-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local silent = { silent = true }
vim.keymap.set("n", "_", function()
  local current_line = vim.fn.line(".")
  vim.cmd(":" .. current_line + 1)
  vim.cmd("normal! ^") -- Move to first non-blank character
end, { desc = "Go to next line number and first non-blank" })

table.unpack = table.unpack or unpack -- 5.1 compatibility

-- Autoindent on insert
vim.keymap.set("n", "i", function()
  if #vim.fn.getline(".") == 0 then
    return [["_cc]]
  else
    return "i"
  end
end, { expr = true, desc = "properly indent on empty line when insert" })

-- Custom command to yank and exit
vim.api.nvim_create_user_command("Y", function(args)
  local vimCmd = "%y+|wq"
  -- if (args['fargs'][0]) then
  --   vimCmd = vimCmd .. ' ' .. args['fargs'][0]
  -- end
  vim.cmd(vimCmd)
  -- vim.cmd "echo 'ok'"
end, { desc = "Yank buffer, save and exit" })

local function get_visual()
  local vstart = vim.fn.getpos("'<")

  local vend = vim.fn.getpos("'>")

  local line_start = vstart[2]
  local line_end = vend[2]

  -- or use api.nvim_buf_get_lines
  local lines = vim.fn.getline(line_start, line_end)
  return lines
end

vim.api.nvim_create_user_command("CodeSnapText", function()
  -- Get the current visual selection
  local relative_filename = vim.fn.expand("%")
  local file_extension = vim.fn.expand("%:e")
  -- local selection = vim.fn.getreg('"')
  local selection = table.concat(get_visual(), "\n")
  -- selection = string.gsub(selection,"```","``\\`")
  local formated_selection = "*"
    .. relative_filename
    .. "*\n"
    .. "```"
    .. file_extension
    .. "\n"
    .. selection
    .. "\n```"
  -- Yank the visual selection to the default register
  vim.fn.setreg("+", formated_selection)
  -- Echo a message to the user
end, { desc = "Format selection then yank code to share as text" })

local function launch_terminal()
  local term_program = vim.env.TERM_PROGRAM
  if term_program then
    vim.fn.system(term_program .. " &")
  else
    vim.notify("TERM_PROGRAM environment variable not set", vim.log.levels.ERROR)
  end
end

vim.keymap.set("n", "<leader>tt", launch_terminal, {
  desc = "Execute terminal program in background",
  silent = true,
})
vim.keymap.set("x", "<leader>cy", "<Esc><cmd>CodeSnapText<CR>", { desc = "Yank and format text for sharing" })

vim.keymap.set("n", "gV", "v`]o`[", { desc = "Select last pasted (Visual mode)" })
-- vim.keymap.set('n', '<Leader>gv', 'v`]o`[')
-- Fix moving forward in jumplist via <C-i>
keymap("n", "<C-I>", "<C-I>", silent)

-- H to move to the first non-blank character of the line
keymap("n", "H", "^", silent)
-- Visual mode keybinding
vim.keymap.set("v", "<S-Up>", "<Up>", { desc = "Visual mode prevent page up" })
vim.keymap.set("v", "<S-Down>", "<Down>", { desc = "Visual mode prevent page down" })
vim.keymap.set("v", "<S-Left>", "<Left>", { desc = "Visual mode move left" })
vim.keymap.set("v", "<S-Right>", "<Right>", { desc = "Visual mode move right" })

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
vim.keymap.set("n", "<leader>bk", "<cmd>bd<CR>", { desc = "Buffer Delete" })
vim.keymap.set("n", "<leader>bK", "<cmd>bd!<CR>", { desc = "Buffer Delete force!" })

-- Remove highlights on esc
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })

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
keymap({ "n" }, "<Del>", '"_x')

-- Don't yank on visual paste
keymap("v", "p", '"_dP', silent)

-- Quickfix
-- keymap("n", "<Space>,", ":cp<CR>", silent)
-- keymap("n", "<Space>.", ":cn<CR>", silent)

-- Open links under cursor in browser with gx
if vim.fn.has("macunix") == 1 then
  keymap("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", silent)
else
  keymap("n", "gx", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", silent)
end

keymap(
  "n",
  "<C-s>",
  "<cmd>lua vim.lsp.buf.signature_help()<CR>",
  { desc = "Lsp show signature (Press twice to focus)" }
)
keymap("n", "<C-k>", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end, { desc = "Lsp hover, show additionnal information such as signature (Press twice to focus)" })
