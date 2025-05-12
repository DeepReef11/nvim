local M = {}


function M.format()
  local bufnr = vim.api.nvim_get_current_buf()
  local ft = vim.bo[bufnr].filetype

  -- Check for JS/TS files and eslint
  local js_ts_filetypes = {
    ["javascript"] = true, ["typescript"] = true,
    ["javascriptreact"] = true, ["typescriptreact"] = true,
    ["vue"] = true, ["svelte"] = true
  }

  if js_ts_filetypes[ft] then
    for _, client in ipairs(vim.lsp.get_clients({bufnr = bufnr})) do
      if client.name == "eslint" then
        local eslint_diagnostics = vim.diagnostic.get(bufnr, {namespace = vim.lsp.diagnostic.get_namespace(client.id)})

        if #eslint_diagnostics > 0 then
          vim.notify("Found " .. #eslint_diagnostics .. " eslint issues, fixing...", vim.log.levels.INFO)
          vim.cmd("EslintFixAll")
        else
          -- vim.notify("No eslint issues found, using LSP format", vim.log.levels.INFO)
          vim.lsp.buf.format({
            bufnr = bufnr,
            async = false,
            timeout_ms = 3000
          })
        end
        return
      end
    end
  end

  -- Use direct LSP formatting for non-JS/TS files or when eslint isn't available
  vim.lsp.buf.format({
    bufnr = bufnr,
    async = false,
    timeout_ms = 3000
  })
end

function M.enable_format_on_save()
  local group = vim.api.nvim_create_augroup("format_on_save", { clear = false })
  vim.api.nvim_create_autocmd("BufWritePre", {
    callback = M.format,
    group = group,
  })
  require("notify")("Enabled format on save", "info", { title = "LSP", timeout = 2000 })
end

function M.disable_format_on_save()
  vim.api.nvim_del_augroup_by_name("format_on_save")
  require("notify")("Disabled format on save", "info", { title = "LSP", timeout = 2000 })
end

function M.toggle_format_on_save()
  if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

vim.api.nvim_create_user_command("LspToggleAutoFormat", 'lua require("config.lsp.functions").toggle_format_on_save()', {})

-- Custom textDocument/hover LSP handler to colorize colors inside hover results - WIP
function M.custom_hover_handler(_, result)
  local handler = function(_, result)
    if result then
      local colorizer = require("colorizer")

      local lines = vim.split(result.contents.value, "\n")
      local bufnr =
          vim.lsp.util.open_floating_preview(lines, "markdown", { border = EcoVim.ui.float.border or "rounded" })
      colorizer.highlight_buffer(bufnr, nil, vim.list_slice(lines, 2, #lines), 0, colorizer.get_buffer_options(0))
    end
  end

  return handler
end

return M
