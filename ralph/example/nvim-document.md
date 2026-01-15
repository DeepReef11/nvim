# Ralph - Document Neovim Config

## MCP Tools for Sub-Agents
- context7: true

## Task
Document all Lua modules. For plugin configs, fetch plugin docs via context7 first.

## Target Directory
./lua

## File Pattern
*.lua

## Task Type
document

## Output File
./docs/CONFIG.md

## Sub-Agent Instructions
For each file:
1. If it configures a plugin → use context7 to fetch plugin docs
2. Extract: module purpose, functions, keybindings, settings
3. Return JSON with documentation structure

## Aggregation
Compile all results into CONFIG.md with:
- Module index table
- Per-module documentation
- Keybinding reference (all keybindings across modules)
