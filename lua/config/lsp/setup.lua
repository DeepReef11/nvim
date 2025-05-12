-- Setup installer & lsp configs
local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local ufo_utils = require("utils._ufo")
local ufo_config_handler = ufo_utils.handler
local lspconfig = require("lspconfig")

mason.setup({
  ui = {
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = EcoVim.ui.float.border or "rounded",
  },
})

mason_lsp.setup({
  -- A list of servers to automatically install if they're not already installed
  ensure_installed = {
    "bashls",
    "cssls",
    "eslint",
    "graphql",
    "html",
     
    "emmet_ls", -- HTML/CSS snippets
    "cssls",    -- css
    "jsonls",
    "lua_ls",
    "prismals",
    "tailwindcss",

    "powershell_es",
  },
  -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
  -- This setting has no relation with the `ensure_installed` setting.
  -- Can either be:
  --   - false: Servers are not automatically installed.
  --   - true: All servers set up via lspconfig are automatically installed.
  --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
  --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
  automatic_installation = true,
})


local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    silent = true,
    border = EcoVim.ui.float.border,
  }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = EcoVim.ui.float.border }),
}

local capabilities = require('blink.cmp').get_lsp_capabilities()

local function on_attach(client, bufnr)
  vim.lsp.inlay_hint.enable(true, { bufnr })
end

-- Global override for floating preview border
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or EcoVim.ui.float.border or "rounded" -- default to EcoVim border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.lsp.config("tailwindcss", {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require("config.lsp.servers.tailwindcss").on_attach,
  filetypes = require("config.lsp.servers.tailwindcss").filetypes,
  init_options = require("config.lsp.servers.tailwindcss").init_options,
  settings = require("config.lsp.servers.tailwindcss").settings,
})

vim.lsp.config("cssls", {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require("config.lsp.servers.cssls").on_attach,
  settings = require("config.lsp.servers.cssls").settings,
})

vim.lsp.config("eslint", {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require("config.lsp.servers.eslint").on_attach,
  settings = require("config.lsp.servers.eslint").settings,
  flags = {
    debounce_text_changes = 1000,
    exit_timeout = 1500,
  },
})

vim.lsp.config("jsonls", {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require("config.lsp.servers.jsonls").settings,
})

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require("config.lsp.servers.lua_ls").settings,
})

vim.lsp.config("vuels", {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require("config.lsp.servers.vuels").on_attach,
  filetypes = require("config.lsp.servers.vuels").filetypes,
  init_options = require("config.lsp.servers.vuels").init_options,
  settings = require("config.lsp.servers.vuels").settings,
})

require("ufo").setup({
  fold_virt_text_handler = ufo_config_handler,
  close_fold_kinds_for_ft = { default = { "imports" } },
})



vim.filetype.add({
    extension = {
        mdx = "markdown"
    }
})
