return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			{
				"echasnovski/mini.bufremove",
				version = "*",
				config = function()
					require("mini.bufremove").setup({
						silent = true,
					})
				end,
			},
		},
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					close_command = function(n)
						require("mini.bufremove").delete(n, false)
					end,
					right_mouse_command = function(n)
						require("mini.bufremove").delete(n, false)
					end,
					show_buffer_close_icons = false,
					separator_style = { "|", "|" },
					always_show_bufferline = true,
					style_preset = bufferline.style_preset.no_italic,
					numbers = function(opts)
						return string.format("%s", opts.ordinal)
					end,
					custom_filter = function(buf_number)
						-- filter out filetypes you don't want to see
						if vim.bo[buf_number].filetype ~= "qf" then
							return true
						end
					end,
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							highlight = "EcovimNvimTreeTitle",
							text_align = "center",
							separator = true,
						},
					},
				},
			})
		end,
		keys = {
			-- { "<tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Bufferline cycle next buffer" },
			-- { "<S-tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Bufferline cycle prev buffer" },
			{ "<C-M-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Bufferline cycle next buffer" },
			{ "<C-M-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Bufferline cycle prev buffer" },
			{ "<C-M-Right>", "<cmd>BufferLineCycleNext<CR>", desc = "Bufferline cycle next buffer" },
			{ "<C-M-Left>", "<cmd>BufferLineCyclePrev<CR>", desc = "Bufferline cycle prev buffer" },
			{ "L", "<cmd>BufferLineCycleNext<CR>", desc = "Bufferline cycle next buffer" },
			{ "H", "<cmd>BufferLineCyclePrev<CR>", desc = "Bufferline cycle prev buffer" },
			{ "<S-Right>", "<cmd>BufferLineCycleNext<CR>", desc = "Bufferline cycle next buffer" },
			{ "<S-Left>", "<cmd>BufferLineCyclePrev<CR>", desc = "Bufferline cycle prev buffer" },
			{ "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "[B]ufferline [P]in Toggle" },
		},
	},
}
