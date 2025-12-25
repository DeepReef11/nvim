local keymap = vim.keymap.set
local silent = { silent = true }

table.unpack = table.unpack or unpack -- 5.1 compatibility

local function launch_claude_docker(prompt)
    local current_dir = vim.fn.getcwd()
    -- Convert ~/workspace/path to /workspace/path
    local container_dir = current_dir:gsub(vim.fn.expand('$HOME') .. '/workspace', '/workspace')

    -- Build the docker-compose command
    local docker_cmd = string.format(
      'docker-compose -f ~/workspace/ai/safe-container/docker-compose.yml exec -u ubuntu -w %s claude-dev claude --dangerously-skip-permissions %s',
      vim.fn.shellescape(container_dir),
      prompt
    )

    local term_program = vim.env.TERM_PROGRAM
    if term_program then
      local wm = vim.fn.system("echo $XDG_CURRENT_DESKTOP"):gsub("%s+", "")

      if wm == "niri" then
        vim.system({
          term_program,
          "-e", "sh", "-c",
          string.format("sleep 0.1 && niri msg action consume-or-expel-window-left && %s", docker_cmd)
        }, {
          detach = true,
          clear_env = false,
        })
      else
        vim.fn.system(string.format("%s -e '%s' &", term_program, docker_cmd))
      end
    else
      vim.notify('TERM_PROGRAM environment variable not set', vim.log.levels.ERROR)
    end
  end

vim.api.nvim_create_user_command('Claude', function(opts)
      launch_claude_docker(opts.args)
  end, { nargs = '*' })

vim.keymap.set('n', '<leader>cc', function()
    launch_claude_docker('')
  end, { desc = 'Launch Claude in Docker' })

vim.keymap.set('n', '<leader>cC', function()
    launch_claude_docker('-r')
  end, { desc = 'Launch Claude in Docker (resume)' })

vim.keymap.set('n', '<leader>ps', function()
  vim.system({ 'pythonscad', vim.fn.expand('%') })
end, { desc = 'Launch PythonSCAD with current buffer' })

-- inserst mode binding

-- Delete word backward with Ctrl-Backspace in Insert mode
vim.keymap.set('i', '<C-BS>', '<C-w>', { desc = 'Delete word backward' })
vim.keymap.set('i', '<C-h>', '<C-w>', { desc = 'Delete word backward (terminal fallback)' })

-- Delete word forward with Ctrl-Delete in Insert mode
vim.keymap.set('i', '<C-Del>', '<C-o>dw', { desc = 'Delete word forward' })

-- Autoindent on insert
vim.keymap.set("n", "i", function()
  if #vim.fn.getline(".") == 0 then
    return [["_cc]]
  else
    return "i"
  end
end, { expr = true, desc = "properly indent on empty line when insert" })

-- Custom command to yank and exit
vim.api.nvim_create_user_command('Y', function(args)
  local vimCmd = '%y+|wq'
  -- if (args['fargs'][0]) then
  --   vimCmd = vimCmd .. ' ' .. args['fargs'][0]
  -- end
  vim.cmd(vimCmd)
  -- vim.cmd "echo 'ok'"
end, { desc = 'Yank buffer, save and exit' })

local function get_visual()
  local vstart = vim.fn.getpos("'<")

  local vend = vim.fn.getpos("'>")

  local line_start = vstart[2]
  local line_end = vend[2]

  -- or use api.nvim_buf_get_lines
  local lines = vim.fn.getline(line_start, line_end)
  return lines
end

vim.api.nvim_create_user_command('CodeSnapText', function()
  -- Get the current visual selection
  local relative_filename = vim.fn.expand('%')
  local file_extension = vim.fn.expand('%:e')
  -- local selection = vim.fn.getreg('"')
  local selection = table.concat(get_visual(), "\n")
  -- selection = string.gsub(selection,"```","``\\`")
  local formated_selection = "*" .. relative_filename .. "*\n" .. "```" .. file_extension .. "\n" .. selection .. "\n```"
  -- Yank the visual selection to the default register
  vim.fn.setreg("+", formated_selection)
  -- Echo a message to the user
end, { desc = "Format selection then yank code to share as text" })

local function launch_terminal()
  local term_program = vim.env.TERM_PROGRAM
  vim.notify(term_program)
  if term_program then
    local wm = vim.fn.system("echo $XDG_CURRENT_DESKTOP"):gsub("%s+", "")

    if wm == "niri" then
      -- vim.fn.system(term_program ..
      --   ' -e \'exec $SHELL --login -c "sleep 0.1 && niri msg action consume-or-expel-window-left && exec $SHELL"\' &')
      vim.system({
        term_program, -- or xterm, kitty, etc.
        "-e", "sh", "-c",
        "sleep 0.1 && niri msg action consume-or-expel-window-left && exec $SHELL --login"
      }, {
        detach = true,
        clear_env = false,
      })
    else
      -- vim.fn.system("notify-send \"" .. wm .. "\"")
      vim.fn.system(term_program .. ' &')
    end
  else
    vim.notify('TERM_PROGRAM environment variable not set', vim.log.levels.ERROR)
  end
end

vim.keymap.set('n', '<leader>T', launch_terminal, {
  desc = "Execute terminal program in background",
  silent = true
})
vim.keymap.set('x', '<leader>cy', '<Esc><cmd>CodeSnapText<CR>', { desc = 'Yank and format text for sharing' })
vim.keymap.set('n', '<leader>cy', 'ggVG<Esc><cmd>CodeSnapText<CR><C-o>', { desc = 'Yank and format text for sharing' })

vim.keymap.set('n', 'gV', 'v`]o`[', { desc = "Select last pasted (Visual mode)" })
-- vim.keymap.set('n', '<Leader>gv', 'v`]o`[')
-- Fix moving forward in jumplist via <C-i>
keymap("n", "<C-I>", "<C-I>", silent)

-- H to move to the first non-blank character of the line
keymap("n", "H", "^", silent)
-- Visual mode keybinding
vim.keymap.set('v', '<S-Up>', '<Up>', { desc = 'Visual mode prevent page up' })
vim.keymap.set('v', '<S-Down>', '<Down>', { desc = 'Visual mode prevent page down' })
vim.keymap.set('v', '<S-Left>', '<Left>', { desc = 'Visual mode move left' })
vim.keymap.set('v', '<S-Right>', '<Right>', { desc = 'Visual mode move right' })

-- Move selected line / block of text in visual mode
-- keymap("x", "K", ":move '<-2<CR>gv-gv", silent)
-- keymap("x", "J", ":move '>+1<CR>gv-gv", silent)

-- Keep visual mode indenting
keymap("v", "<", "<gv", silent)
keymap("v", ">", ">gv", silent)

-- Case change in visual mode
keymap("v", "`", "u", silent)
keymap("v", "<A-`>", "U", silent)

-- Save file by CTRL-S
-- keymap("n", "<C-s>", ":w<CR>", silent)
-- keymap("i", "<C-s>", "<ESC> :w<CR>", silent)

-- Remove highlights
keymap("n", "<CR>", ":noh<CR><CR>", silent)

-- Buffers
vim.keymap.set('n', '<leader>bk', '<cmd>bd<CR>', { desc = 'Buffer Delete' })
vim.keymap.set('n', '<leader>bd', '<cmd>bd!<CR>', { desc = 'Buffer Delete force!' })

-- Remove highlights on esc
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('i', 'jj', '<Esc>', { desc = 'Exit insert mode' })


-- keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", silent)
-- keymap("n", "gn", ":bn<CR>", silent)
-- keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", silent)
-- keymap("n", "gp", ":bp<CR>", silent)
-- keymap("n", "<S-q>", ":lua require('mini.bufremove').delete(0, false)<CR>", silent)

-- Don't yank on delete char
keymap("n", "x", '"_x', silent)
keymap("n", "X", '"_X', silent)
keymap("v", "x", '"_x', silent)
keymap("v", "X", '"_X', silent)
keymap({ 'n' }, '<Del>', '"_x')

-- Don't yank on visual paste
keymap("v", "p", '"_dP', silent)

-- Avoid issues because of remapping <c-a> and <c-x> below
vim.cmd([[
  nnoremap <Plug>SpeedDatingFallbackUp <c-a>
  nnoremap <Plug>SpeedDatingFallbackDown <c-x>
]])

-- Quickfix
-- keymap("n", "<Space>,", ":cp<CR>", silent)
-- keymap("n", "<Space>.", ":cn<CR>", silent)

-- Toggle quicklist
keymap("n", "<leader>q", "<cmd>lua require('utils').toggle_quicklist()<CR>", silent)

-- Manually invoke speeddating in case switch.vim didn't work
keymap("n", "<C-a>", ":if !switch#Switch() <bar> call speeddating#increment(v:count1) <bar> endif<CR>", silent)
keymap(
  "n",
  "<C-x>",
  ":if !switch#Switch({'reverse': 1}) <bar> call speeddating#increment(-v:count1) <bar> endif<CR>",
  silent
)
-- Open links under cursor in browser with gx
if vim.fn.has("macunix") == 1 then
  keymap("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", silent)
else
  keymap("n", "gx", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", silent)
end

-- LSP
-- keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>", silent)
keymap("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", silent)
keymap("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
keymap("n", "<leader>cf", "<cmd>lua require('config.lsp.functions').format()<CR>", silent)
keymap("v", "<leader>cf", function()
  local start_row, _ = table.unpack(vim.api.nvim_buf_get_mark(0, "<"))
  local end_row, _ = table.unpack(vim.api.nvim_buf_get_mark(0, ">"))

  vim.lsp.buf.format({
    range = {
      ["start"] = { start_row, 0 },
      ["end"] = { end_row, 0 },
    },
    async = true,
  })
end, silent)
keymap("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", silent)
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", silent)
keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)
keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)
keymap("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion<CR>", { desc = "Lsp show suggestion, trigger completion" })
keymap("n", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Lsp show signature (Press twice to focus)" })
keymap("n", "<C-k>", function()
    local winid = require("ufo").peekFoldedLinesUnderCursor()
    if not winid then
      vim.lsp.buf.hover()
    end
  end,
  { desc = "Lsp hover, show additionnal information such as signature (Press twice to focus)" }

)
