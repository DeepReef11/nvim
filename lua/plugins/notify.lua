return {
  {
    "rcarriga/nvim-notify",
     -- enabled = false,
    config = function()
      local notify = require("notify")
      notify.setup({
        background_colour = "#000000",
        timeout = 10,
      })

			vim.keymap.set("n", "<leader>nd", notify.dismiss, { desc = "Notify Dismiss" })
    end,
    init = function()
      local banned_messages = {
        "No information available",
        "LSP[tsserver] Inlay Hints request failed. Requires TypeScript 4.4+.",
        "LSP[tsserver] Inlay Hints request failed. File not opened in the editor.",
      }
      vim.notify = function(msg, ...)
        for _, banned in ipairs(banned_messages) do
          if msg == banned then
            return
          end
        end
        return require("notify")(msg, ...)
      end
    end,
  },
}
