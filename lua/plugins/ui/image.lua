return {
{
    "vhyrro/luarocks.nvim",
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
        rocks = { "magick" },
    },
},
{
    "3rd/image.nvim",
    enabled = false,
    dependencies = { "luarocks.nvim" },
    opts = {}
}}
