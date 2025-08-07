local M = {}

M.settings = {
  python = {
    --   pythonPath = function()
    --     if vim.env.VIRTUAL_ENV then
    --       return vim.env.VIRTUAL_ENV .. "/bin/python"
    --     end
    --   return "/usr/bin/python3"  -- Change to your python path
    -- end,
    analysis = {
      autoSearchPaths = true,
      diagnosticMode = "openFilesOnly",
      useLibraryCodeForTypes = true
    }
  }
}

return M
