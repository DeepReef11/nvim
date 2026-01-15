# Ralph - Migrate to New Config Format

## MCP Tools for Sub-Agents
- context7: true

## Task
Migrate config files from v1 to v2 format, update imports, verify build passes.

## Target Directory
./

## File Pattern
*.config.js

## Task Type
custom

## Output File
./ralph/migration-report.md

## Steps

1. **Backup**: Copy all config files to ./ralph/backup/
2. **Analyze configs** (parallel sub-agents): Identify v1 patterns in each file
3. **Transform configs** (parallel sub-agents): Convert to v2 format
4. **Update imports**: Find all files importing old config paths, update them (single operation, not per-file)
5. **Run build**: Execute `npm run build`, capture output
6. **Verify**: Check build succeeded, list any errors
7. **Report**: Generate migration summary

## Sub-Agent Instructions (for steps 2-3)
- Use context7 to fetch v2 config documentation
- Step 2: Return analysis of what needs to change
- Step 3: Apply transformations, return list of changes made

## Notes
- Steps 1, 4, 5, 6, 7 are single operations (no sub-agents)
- Steps 2, 3 process multiple files in parallel
- If build fails in step 5, still continue to report but mark migration as incomplete
