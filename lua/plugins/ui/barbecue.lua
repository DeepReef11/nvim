return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {
    -- configurations go here
  },
  config = function()
    require("barbecue").setup({
      theme = {
        -- this highlight is used to override other highlights
        -- you can take advantage of its `bg` and set a background throughout your winbar
        -- (e.g. basename will look like this: { fg = "#c0caf5", bold = true })
        normal = { fg = "#c0caf5", bg = "#1f2329" },

        -- these highlights correspond to symbols table from config
        ellipsis = { fg = "#7a818e" },
        separator = { fg = "#7a818e" },
        modified = { fg = "#7a818e" },

        -- these highlights represent the _text_ of three main parts of barbecue
        dirname = { fg = "#7a818e" },
        basename = { bold = true },
        context = {},

        -- these highlights are used for context/navic icons
        context_file = { fg = "#ac8fe4" },
        context_module = { fg = "#ac8fe4" },
        context_namespace = { fg = "#ac8fe4" },
        context_package = { fg = "#ac8fe4" },
        context_class = { fg = "#ac8fe4" },
        context_method = { fg = "#ac8fe4" },
        context_property = { fg = "#ac8fe4" },
        context_field = { fg = "#ac8fe4" },
        context_constructor = { fg = "#ac8fe4" },
        context_enum = { fg = "#ac8fe4" },
        context_interface = { fg = "#ac8fe4" },
        context_function = { fg = "#ac8fe4" },
        context_variable = { fg = "#ac8fe4" },
        context_constant = { fg = "#ac8fe4" },
        context_string = { fg = "#ac8fe4" },
        context_number = { fg = "#ac8fe4" },
        context_boolean = { fg = "#ac8fe4" },
        context_array = { fg = "#ac8fe4" },
        context_object = { fg = "#ac8fe4" },
        context_key = { fg = "#ac8fe4" },
        context_null = { fg = "#ac8fe4" },
        context_enum_member = { fg = "#ac8fe4" },
        context_struct = { fg = "#ac8fe4" },
        context_event = { fg = "#ac8fe4" },
        context_operator = { fg = "#ac8fe4" },
        context_type_parameter = { fg = "#ac8fe4" },
      },
    })
  end
}
