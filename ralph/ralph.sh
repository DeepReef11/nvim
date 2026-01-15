#!/bin/bash
# ralph.sh - Orchestrator-based file processor with sub-agent support
# 
# Usage: Place this script in ./ralph/ralph.sh within any repo
#        Create ./ralph/prompt.md with your task
#        Run: cd your-repo && bash ./ralph/ralph.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RALPH_DIR="$SCRIPT_DIR"
PROMPT_FILE="$RALPH_DIR/prompt.md"
STATE_FILE="$RALPH_DIR/state.json"
LOG_FILE="$RALPH_DIR/log.txt"
STATS_FILE="$RALPH_DIR/stats.json"
RESULTS_DIR="$RALPH_DIR/results"
MAX_ITERATIONS=200
ITERATION=0

SCRIPT_START=$(date +%s)
TOTAL_INPUT_TOKENS=0
TOTAL_OUTPUT_TOKENS=0

INPUT_COST_PER_MILLION=3.00
OUTPUT_COST_PER_MILLION=15.00

mkdir -p "$RESULTS_DIR"

if [[ ! -f "$PROMPT_FILE" ]]; then
    echo "Error: $PROMPT_FILE not found"
    echo ""
    echo "Create $PROMPT_FILE with your task instructions."
    echo "Use prompt-template.md as a starting point."
    exit 1
fi

: > "$LOG_FILE"

format_duration() {
    local seconds=$1
    local hours=$((seconds / 3600))
    local minutes=$(((seconds % 3600) / 60))
    local secs=$((seconds % 60))
    
    if [[ $hours -gt 0 ]]; then
        printf "%dh %dm %ds" $hours $minutes $secs
    elif [[ $minutes -gt 0 ]]; then
        printf "%dm %ds" $minutes $secs
    else
        printf "%ds" $secs
    fi
}

calculate_cost() {
    local input=$1
    local output=$2
    echo "scale=6; ($input * $INPUT_COST_PER_MILLION / 1000000) + ($output * $OUTPUT_COST_PER_MILLION / 1000000)" | bc
}

log() {
    local msg="[$(date '+%Y-%m-%d %H:%M:%S')] $1"
    echo "$msg"
    echo "$msg" >> "$LOG_FILE"
}

save_stats() {
    local total_elapsed=$(($(date +%s) - SCRIPT_START))
    local avg_per_iteration=0
    [[ $ITERATION -gt 0 ]] && avg_per_iteration=$((total_elapsed / ITERATION))
    
    local total_cost=$(calculate_cost $TOTAL_INPUT_TOKENS $TOTAL_OUTPUT_TOKENS)
    local avg_input=0
    local avg_output=0
    [[ $ITERATION -gt 0 ]] && avg_input=$((TOTAL_INPUT_TOKENS / ITERATION))
    [[ $ITERATION -gt 0 ]] && avg_output=$((TOTAL_OUTPUT_TOKENS / ITERATION))
    
    cat > "$STATS_FILE" << EOF
{
  "timing": {
    "start_time": "$(date -d @$SCRIPT_START '+%Y-%m-%d %H:%M:%S' 2>/dev/null || date -r $SCRIPT_START '+%Y-%m-%d %H:%M:%S')",
    "end_time": "$(date '+%Y-%m-%d %H:%M:%S')",
    "total_seconds": $total_elapsed,
    "total_formatted": "$(format_duration $total_elapsed)",
    "iterations": $ITERATION,
    "avg_seconds_per_iteration": $avg_per_iteration
  },
  "usage": {
    "total_input_tokens": $TOTAL_INPUT_TOKENS,
    "total_output_tokens": $TOTAL_OUTPUT_TOKENS,
    "total_tokens": $((TOTAL_INPUT_TOKENS + TOTAL_OUTPUT_TOKENS)),
    "avg_input_tokens_per_iteration": $avg_input,
    "avg_output_tokens_per_iteration": $avg_output
  },
  "cost": {
    "input_cost_per_million": $INPUT_COST_PER_MILLION,
    "output_cost_per_million": $OUTPUT_COST_PER_MILLION,
    "total_cost_usd": $total_cost,
    "note": "Orchestrator only. Sub-agent costs are additional."
  }
}
EOF
}

extract_usage() {
    local output="$1"
    local input_tokens=0
    local output_tokens=0
    
    if echo "$output" | grep -q "input_tokens"; then
        input_tokens=$(echo "$output" | grep -o '"input_tokens"[[:space:]]*:[[:space:]]*[0-9]*' | grep -o '[0-9]*' | tail -1) || input_tokens=0
    fi
    
    if echo "$output" | grep -q "output_tokens"; then
        output_tokens=$(echo "$output" | grep -o '"output_tokens"[[:space:]]*:[[:space:]]*[0-9]*' | grep -o '[0-9]*' | tail -1) || output_tokens=0
    fi
    
    echo "$input_tokens $output_tokens"
}

cleanup() {
    local elapsed=$(($(date +%s) - SCRIPT_START))
    log "Script interrupted after $(format_duration $elapsed)"
    log "Tokens: $((TOTAL_INPUT_TOKENS + TOTAL_OUTPUT_TOKENS)) (in: $TOTAL_INPUT_TOKENS, out: $TOTAL_OUTPUT_TOKENS)"
    save_stats
    exit 1
}
trap cleanup SIGINT SIGTERM

log "Starting Ralph Orchestrator"
log "Repo: $(pwd)"
log "Prompt: $PROMPT_FILE"

while [[ $ITERATION -lt $MAX_ITERATIONS ]]; do
    ITERATION=$((ITERATION + 1))
    ITER_START=$(date +%s)
    log "--- Iteration $ITERATION ---"
    
    output=$(cat "$PROMPT_FILE" | claude -p --dangerously-skip-permissions --output-format json 2>&1) || {
        log "Error: Claude command failed"
        echo "$output" >> "$LOG_FILE"
        sleep 5
        continue
    }
    
    ITER_END=$(date +%s)
    ITER_DURATION=$((ITER_END - ITER_START))
    
    read iter_input iter_output <<< $(extract_usage "$output")
    TOTAL_INPUT_TOKENS=$((TOTAL_INPUT_TOKENS + iter_input))
    TOTAL_OUTPUT_TOKENS=$((TOTAL_OUTPUT_TOKENS + iter_output))
    
    response_text=$(echo "$output" | jq -r '.result // .content // .message // .' 2>/dev/null || echo "$output")
    
    echo "=== Iteration $ITERATION ===" >> "$LOG_FILE"
    echo "$response_text" >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"
    
    log "Duration: $(format_duration $ITER_DURATION) | Tokens: +$iter_input in, +$iter_output out"
    
    if echo "$response_text" | grep -q "RALPH_COMPLETE"; then
        completion_msg=$(echo "$response_text" | grep "RALPH_COMPLETE" | head -1)
        log "✓ $completion_msg"
        break
    fi
    
    if echo "$response_text" | grep -q "RALPH_PROGRESS"; then
        progress_msg=$(echo "$response_text" | grep "RALPH_PROGRESS" | head -1)
        log "$progress_msg"
    fi
    
    if echo "$response_text" | grep -q "SUBAGENTS_COMPLETE"; then
        subagent_count=$(ls -1 "$RESULTS_DIR"/*.result 2>/dev/null | wc -l || echo 0)
        log "Sub-agents complete: $subagent_count results"
    fi
    
    sleep 1
done

TOTAL_ELAPSED=$(($(date +%s) - SCRIPT_START))
TOTAL_COST=$(calculate_cost $TOTAL_INPUT_TOKENS $TOTAL_OUTPUT_TOKENS)

log "----------------------------------------"
log "SUMMARY"
log "----------------------------------------"

if [[ $ITERATION -ge $MAX_ITERATIONS ]]; then
    log "Warning: Reached max iterations ($MAX_ITERATIONS)"
fi

log "Time: $(format_duration $TOTAL_ELAPSED) across $ITERATION iteration(s)"
log "Tokens: $((TOTAL_INPUT_TOKENS + TOTAL_OUTPUT_TOKENS)) ($TOTAL_INPUT_TOKENS in, $TOTAL_OUTPUT_TOKENS out)"
log "Cost: \$$TOTAL_COST USD (orchestrator only)"

if [[ -f "$STATE_FILE" ]]; then
    completed=$(jq -r '.completed | length' "$STATE_FILE" 2>/dev/null || echo "?")
    errors=$(jq -r '.errors | length' "$STATE_FILE" 2>/dev/null || echo "?")
    log "Files: $completed completed, $errors errors"
fi

log "----------------------------------------"

save_stats

[[ $ITERATION -lt $MAX_ITERATIONS ]] && exit 0 || exit 1
