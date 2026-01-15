# Ralph - Iterative Task Processor

Drop `ralph/` into any repo. Define a task, run the script, Claude orchestrates.

## Quick Start

```bash
cp -r ralph/ ~/my-project/ralph/
cp ralph/examples/nvim-document.md ~/my-project/ralph/prompt.md  # or write your own
cd ~/my-project
bash ./ralph/ralph.sh
```

## Structure

```
your-repo/
├── ralph/
│   ├── ralph.sh           # Runner script
│   ├── prompt.md          # Your task (create this)
│   ├── prompt-template.md # Reference template
│   ├── examples/          # Example prompts
│   ├── state.json         # Progress (auto)
│   └── log.txt            # Output log (auto)
└── ...
```

## How It Works

The orchestrator:
1. Reads your task from `prompt.md`
2. Plans and executes steps
3. Uses **parallel sub-agents** when applying the same operation to multiple files
4. Handles other operations directly
5. Tracks state, resumes if interrupted

## Task Types

| Type | Description |
|------|-------------|
| **document** | Analyze files → compile output |
| **verify** | Check conditions → generate report |
| **transform** | Modify files in place |
| **custom** | Mix of operations with defined steps |

## MCP Tools

Enable in your prompt for sub-agents:
```markdown
## MCP Tools for Sub-Agents
- context7: true
```

Requires MCP server configured in `~/.claude/settings.json`.

## Signals

- `RALPH_PROGRESS: ...` → more work
- `RALPH_COMPLETE: ...` → done

## Requirements

- `claude` CLI
- `jq`, `bc`
