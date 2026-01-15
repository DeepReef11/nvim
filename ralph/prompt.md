# Ralph Script - Neovim Keybinding Analysis

> **IMPORTANT**: Process ONE batch of tasks per invocation, then STOP.
> Output `RALPH_PROGRESS` and END your response. Do NOT continue processing.

## MCP Tools for Sub-Agents
- context7: true

## State Management
Check `./ralph/state.json` for current progress. If it doesn't exist, initialize it.

## Your Task
Perform a comprehensive keybinding audit for this Neovim config (the repo you're in).

## Target Directory
./lua

## File Pattern
*.lua

## Task Type
document

## Output Directory
./ralph/output/

---

## Instructions

### First Run (no state.json exists):

1. Create directories:
```bash
mkdir -p ./ralph/output/plugins
```

2. Find all plugin files:
```bash
find ./lua -path "*/plugins/*.lua" -type f
```

3. Read `lazy-lock.json` to get list of installed plugins

4. Create `./ralph/state.json`:
```json
{
  "tasks": [
    "parse_keymappings",
    "parse_init",
    "analyze_vim_defaults",
    "plugin_file:<path1>",
    "plugin_file:<path2>",
    "...(one entry per plugin .lua file found)...",
    "plugin_defaults:<plugin1>",
    "plugin_defaults:<plugin2>",
    "...(one entry per installed plugin from lazy-lock.json)...",
    "detect_conflicts",
    "generate_suggestions",
    "compile_report"
  ],
  "completed": [],
  "current": null,
  "errors": [],
  "data": {
    "custom_keybindings": [],
    "plugin_keybindings": [],
    "vim_defaults": [],
    "conflicts": [],
    "suggestions": []
  }
}
```

5. Output:
```
RALPH_PROGRESS: Initialized with X tasks (0/X done)
```

---

### Subsequent Runs:

1. Read `./ralph/state.json`
2. Identify pending tasks (not in `completed` and not in `errors`)
3. Process **ONE BATCH ONLY** per invocation:
   - For `plugin_file:*` or `plugin_defaults:*`: take up to 10, launch in parallel
   - For sequential tasks: process exactly ONE task
4. After sub-agents complete (or single task completes):
   - Update state.json
   - Output `RALPH_PROGRESS: ...`
   - **STOP IMMEDIATELY** - do NOT process more tasks

**CRITICAL: Process ONE batch, output progress, then STOP. The orchestrator will call you again for the next batch.**

---

## CRITICAL: Parallel Sub-Agent Execution

### You MUST use the Task tool for batch processing

When you have multiple `plugin_file:*` or `plugin_defaults:*` tasks pending, you MUST launch them in parallel using multiple Task tool calls in a SINGLE response.

### Example: Processing 10 plugin_defaults tasks in parallel

If pending tasks include:
- `plugin_defaults:telescope.nvim`
- `plugin_defaults:nvim-treesitter`
- `plugin_defaults:gitsigns.nvim`
- ... (7 more)

You MUST call the Task tool 10 times in ONE response like this:

```
<use Task tool>
  subagent_type: "general-purpose"
  description: "Document telescope.nvim defaults"
  prompt: "Document default keybindings for telescope.nvim. Use context7 MCP to fetch plugin docs. Write output to ./ralph/output/plugins/telescope.nvim_defaults.md. Return summary of keybindings found."
</use Task tool>

<use Task tool>
  subagent_type: "general-purpose"
  description: "Document nvim-treesitter defaults"
  prompt: "Document default keybindings for nvim-treesitter. Use context7 MCP to fetch plugin docs. Write output to ./ralph/output/plugins/nvim-treesitter_defaults.md. Return summary of keybindings found."
</use Task tool>

... (8 more Task tool calls in the SAME response)
```

### Key Rules for Parallel Execution:
1. **ALWAYS** call multiple Task tools in a SINGLE response for batch tasks
2. Take up to **10 pending tasks** of the same type per batch
3. Each Task tool call runs as an independent sub-agent
4. All sub-agents run CONCURRENTLY - do not wait between calls
5. After ALL sub-agents complete, update state.json with results

### Sub-agent prompt template for plugin_defaults:
```
Document default keybindings for <PLUGIN_NAME>.
1. Use context7 MCP to fetch the plugin's documentation
2. Extract all default keybindings the plugin provides out of the box
3. Note which modes each keybinding works in (n/v/i/x/o/t)
4. Write findings to ./ralph/output/plugins/<PLUGIN_NAME>_defaults.md
5. Return a brief summary of keybindings found
```

### Sub-agent prompt template for plugin_file:
```
Analyze <FILEPATH> for keybindings.
1. Read the file
2. Extract all vim.keymap.set() calls and keys = {} tables
3. Document each keybinding with: key, mode, action, description
4. Write findings to ./ralph/output/plugins/<FILENAME>.md
5. Return a brief summary of keybindings found
```

---

## Task Definitions

### Task: parse_keymappings
- Read `lua/config/keymappings.lua` (or find the main keymappings file)
- Extract all `vim.keymap.set()` and `vim.api.nvim_set_keymap()` calls
- Store in `state.data.custom_keybindings`
- Write to `./ralph/output/01_core_keymaps.md`

### Task: parse_init
- Read `init.lua` and `init.vim` if they exist
- Extract any legacy `map`, `nmap`, `vmap`, `imap` commands
- Append to `state.data.custom_keybindings`
- Append to `./ralph/output/01_core_keymaps.md`

### Task: analyze_vim_defaults
- Document all standard Vim/Neovim default keybindings
- Categories: Movement, Operators, Text Objects, Search, Marks, Folds, Windows, Tabs, Insert Mode, Visual Mode, Macros, Misc
- Store in `state.data.vim_defaults`
- Write to `./ralph/output/02_vim_defaults.md`

### Task: plugin_file:<filepath>
**Process ONE plugin configuration file.**

Example: `plugin_file:lua/plugins/telescope.lua`

- Read ONLY this specific file from `./lua/plugins/...`
- Extract keymaps from:
  - `keys = { }` tables (lazy.nvim format)
  - `vim.keymap.set()` inside config functions
- Append to `state.data.custom_keybindings`
- Write to `./ralph/output/plugins/<filename>.md`

### Task: plugin_defaults:<plugin_name>
**Document default keybindings for ONE plugin.**

Example: `plugin_defaults:telescope.nvim`

- Use context7 MCP to fetch plugin documentation
- Document the default keybindings this plugin provides out of the box
- Check if any are overridden by custom config
- Store in `state.data.plugin_keybindings`
- Write to `./ralph/output/plugins/<plugin_name>_defaults.md`

### Task: detect_conflicts
- Compare all keybindings collected in `state.data`
- Find: direct conflicts, shadows, mode conflicts
- Store in `state.data.conflicts`
- Write to `./ralph/output/03_conflicts.md`

### Task: generate_suggestions
- Identify unbound keys (F1-F12, Alt combos, Leader sequences, g-prefix, z-prefix, brackets)
- Suggest bindings for frontend/React workflow
- Store in `state.data.suggestions`
- Write to `./ralph/output/04_suggestions.md`

### Task: compile_report
- Combine all outputs into `./ralph/output/FULL_KEYBINDING_REPORT.md`
- Include: Table of Contents, All keybindings by category, Conflicts, Suggestions, Available keys

---

## Output Messages

**After each task, output exactly one of:**

If more tasks remain:
```
RALPH_PROGRESS: Completed <task_name> (X/Y tasks done)
```

If all tasks done:
```
RALPH_COMPLETE: Processed X tasks, Y errors. Report: ./ralph/output/FULL_KEYBINDING_REPORT.md
```

---

## Rules

1. **ONE BATCH PER INVOCATION**: Process one batch of tasks, then STOP
2. **BATCH plugin tasks**: For `plugin_file:*` or `plugin_defaults:*`, launch up to 10 Task tool calls in parallel
3. **Sequential tasks run alone**: `parse_keymappings`, `parse_init`, `analyze_vim_defaults`, `detect_conflicts`, `generate_suggestions`, `compile_report` - process ONE per invocation
4. **STOP after RALPH_PROGRESS**: Once you output progress, END your response immediately
5. **Always update state.json** before outputting progress
6. **On error**, log to errors array and continue

## IMPORTANT: Invocation Lifecycle

```
START → Read state → Process ONE batch → Update state → Output RALPH_PROGRESS → END
```

Do NOT loop back to process more tasks. The orchestrator script handles iteration.
