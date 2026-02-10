local utils = require("plugins.telescope.utils")
local M = {}
-- Find is for files
function M.get_keymaps()
	local builtin = require("telescope.builtin")

	return {

		-- Buffer management
		{
			"<leader><leader>",
			function()
				builtin.buffers({ sort_lastused = true, sort_mru = true })
			end,
			desc = "  Find existing buffers",
		},

		-- Current buffer search
		{
			"<leader>/",
			function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end,
			desc = "Fuzzily search in current buffer",
		},

		-- File search
		{
			"<leader>ff",
			function()
				builtin.find_files({ no_ignore = false
 })
			end,
			desc = "Search Files",
		},
		{
			"<leader>Ff",
			function()
				builtin.find_files({ cwd = "~" })
			end,
			desc = "Search Files in Home",
		},
		{
			"<leader>fF",
			function()
				builtin.find_files({
					hidden = true,
					no_ignore = true,
					additional_args = utils.grep_exclusions_all,
				})
			end,
			desc = "Find . files (including hidden)",
		},
		{
			"<leader>f+",
			function()
				builtin.find_files({ hidden = true, no_ignore = true })
			end,
			desc = "Find . files (including hidden and git ignore)",
		},
		{
			"<leader>FF",
			function()
				builtin.find_files({ cwd = "~", hidden = true })
			end,
			desc = "Find . files in Home (including hidden)",
		},
		{
			"<leader>fg",
			function()
				builtin.live_grep({
					additional_args = utils.grep_exclusions_normal,
				})
			end,
			desc = "Find by Grep in project files",
		},
		---------------------------------------------------------------------------
		-- BUFFER DIR scope (<leader>f.)
		---------------------------------------------------------------------------
		{
			"<leader>f.f",
			function()
				builtin.find_files({ cwd = utils.get_buffer_dir() })
			end,
			desc = "Find files in buffer dir",
		},
		{
			"<leader>f.g",
			function()
				builtin.live_grep({
					cwd = utils.get_buffer_dir(),
					prompt_title = "Grep in Buffer Dir",
					additional_args = utils.grep_exclusions_normal,
				})
			end,
			desc = "Grep in buffer dir",
		},
		{
			"<leader>f.F",
			function()
				builtin.find_files({
					cwd = utils.get_buffer_dir(),
					hidden = true,
					no_ignore = true,
					file_ignore_patterns = utils.find_exclusions_all,
					prompt_title = "Find ALL in Buffer Dir",
				})
			end,
			desc = "Find ALL files in buffer dir (hidden+ignored)",
		},
		{
			"<leader>f.G",
			function()
				builtin.live_grep({
					cwd = utils.get_buffer_dir(),
					prompt_title = "Grep ALL in Buffer Dir",
					no_ignore = true,
					additional_args = utils.grep_exclusions_all,
				})
			end,
			desc = "Grep ALL in buffer dir (hidden+ignored)",
		},
		{
			"<leader>Fg",
			function()
				builtin.live_grep({
					cwd = "~",
					additional_args = utils.grep_exclusions_normal,
				})
			end,
			desc = "Find by Grep in Home",
		},
		{
			"<leader>FG",
			function()
				builtin.live_grep({
					cwd = "~",
					additional_args = utils.grep_exclusions_hidden,
				})
			end,
			desc = "Find by Grep in Home including hidden files",
		},
		{
			"<leader>fG",
			function()
				builtin.live_grep({
					-- grep_open_files = true,
					prompt_title = "Live Grep in project Files including hidden files",
					hidden = true,
					additional_args = utils.grep_exclusions_hidden,
				})
			end,
			desc = "Find by grep (including hidden)",
		},
		{
			"<leader>fo",
			function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files including hidden files",
					hidden = true,
					additional_args = utils.grep_exclusions_hidden,
				})
			end,
			desc = "Find by grep in open files",
		},
		-- Recent files
		{
			"<leader>Fr",
			function()
				builtin.oldfiles()
			end,
			desc = 'Find Recent Files ("." for repeat)',
		},

		-- Neovim config files
		{
			"<leader>FN",
			function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Neovim files",
		},

		---------------------------------------------------------------------------
		-- PARENT PROJECT ROOT scope (<leader>fp) — search in parent git repo
		---------------------------------------------------------------------------
		{
			"<leader>fpf",
			function()
				builtin.find_files({ cwd = utils.get_parent_root_or_cwd() })
			end,
			desc = "Find files in parent root",
		},
		{
			"<leader>fpg",
			function()
				builtin.live_grep({
					cwd = utils.get_parent_root_or_cwd(),
					prompt_title = "Grep in Parent Root",
					additional_args = utils.grep_exclusions_normal,
				})
			end,
			desc = "Grep in parent root",
		},
		{
			"<leader>fpF",
			function()
				builtin.find_files({
					cwd = utils.get_parent_root_or_cwd(),
					hidden = true,
					no_ignore = true,
					file_ignore_patterns = utils.find_exclusions_all,
					prompt_title = "Find ALL in Parent Root",
				})
			end,
			desc = "Find ALL files in parent root (hidden+ignored)",
		},
		{
			"<leader>fpG",
			function()
				builtin.live_grep({
					cwd = utils.get_parent_root_or_cwd(),
					prompt_title = "Grep ALL in Parent Root",
					no_ignore = true,
					additional_args = utils.grep_exclusions_all,
				})
			end,
			desc = "Grep ALL in parent root (hidden+ignored)",
		},
	}
end

return M
