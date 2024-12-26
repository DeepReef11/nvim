return {
  {
    "mistricky/codesnap.nvim",
    build = "make build_generator",
    cmd = { "CodeSnap", "CodeSnapPreviewOn" },
    opts = {
    },
    config = function() 
      require("codesnap").setup({
        bg_color = "#535c68",
        mac_window_bar = false,
        title = "CodeSnap.nvim",
        code_font_family = "CaskaydiaCove Nerd Font",
        watermark_font_family = "Pacifico",
        watermark = "",
        bg_theme = "default",
        breadcrumbs_separator = "/",
        has_breadcrumbs = true,
        has_line_number = true,
        show_workspace = false,
        min_width = 0,
        bg_x_padding = 0,
        bg_y_padding = 0,
        save_path = os.getenv("XDG_PICTURES_DIR") or (os.getenv("HOME").. "/Pictures"),
      })
    end,
    keys = {
      { "<leader>csc", "<Esc><cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
      { "<leader>csC", "<Esc><cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
    },
  },
}
