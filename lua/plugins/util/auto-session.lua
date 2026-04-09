return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		{ '<leader>wl', '<cmd>AutoSession search<CR>', desc = 'Session lens' },
		{ '<leader>ws', '<cmd>AutoSession save<CR>', desc = 'Save session' },
		{ '<leader>wa', '<cmd>AutoSession toggle<CR>', desc = 'Toggle autosave' },
		{ '<leader>w3', function()
			local sessions_dir = vim.fn.stdpath("data") .. "/sessions/"
			local files = vim.fn.glob(sessions_dir .. "*", true, true)
			local filtered = {}
			for _, f in ipairs(files) do
				local name = vim.fn.fnamemodify(f, ":t")
				local decoded = name:gsub("%%(%x%x)", function(h) return string.char(tonumber(h, 16)) end)
				if decoded:find("workspace/3d%-model") then
					local session_name = decoded:gsub("%.vim$", "")
					table.insert(filtered, { name = session_name, display = session_name })
				end
			end
			if #filtered == 0 then
				vim.notify("No 3d-model sessions found", vim.log.levels.WARN)
				return
			end
			vim.ui.select(filtered, {
				prompt = "3D Model Sessions",
				format_item = function(item) return item.display end,
			}, function(choice)
				if choice then
					require("auto-session").restore_session(choice.name)
				end
			end)
		end, desc = '3D model sessions' },
	},
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		bypass_save_filetypes = { "alpha", "dashboard" },
		enabled = true,
		root_dir = vim.fn.stdpath("data") .. "/sessions/",
		auto_save = true,
		auto_restore = true,
		auto_create = function()
			local cmd = 'git rev-parse --is-inside-work-tree'
			return vim.fn.system(cmd) == 'true\n'
		end,
		suppressed_dirs = { "~/", "~/workspace/", "~/Downloads", "/" },
		auto_restore_last_session = false,
		use_git_branch = false,
		lazy_support = true,
		close_unsupported_windows = true,
		args_allow_single_directory = true,
		args_allow_files_auto_save = false,
		continue_restore_on_error = true,
		cwd_change_handling = false,
		log_level = "error",

		session_lens = {
			load_on_setup = true,
			previewer = true,
			mappings = {
				delete_session = { "i", "<C-d>" },
				alternate_session = { "i", "<C-s>" },
				copy_session = { "i", "<C-y>" },
			},
		},
	},
}
