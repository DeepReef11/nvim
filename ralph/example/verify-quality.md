# Ralph - Verify Code Quality

## MCP Tools for Sub-Agents
- context7: false

## Task
Check all JS files for:
- No console.log (except dev files)
- Async functions have error handling
- No hardcoded secrets

## Target Directory
./src

## File Pattern
*.js

## Task Type
verify

## Output File
./ralph/quality-report.md

## Sub-Agent Instructions
For each file, check all conditions and return:
```json
{
  "status": "pass|fail",
  "file": "...",
  "checks": {
    "no_console_log": { "passed": true, "issues": [] },
    "async_error_handling": { "passed": false, "issues": [...] }
  }
}
```

## Aggregation
Generate report with:
- Summary table (pass/fail counts)
- Issues grouped by check type
- Per-file details for failures
