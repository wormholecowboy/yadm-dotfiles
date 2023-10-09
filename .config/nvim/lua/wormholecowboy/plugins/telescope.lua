return {

	"nvim-telescope/telescope.nvim",
	version = "0.1.2",
	dependencies = { { "nvim-lua/plenary.nvim" } },
	config = function()
		local status_ok, telescope = pcall(require, "telescope")
		if not status_ok then
			return
		end

		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
		vim.keymap.set("n", "<leader>sg", builtin.git_files, {})
		vim.keymap.set("n", "<leader>ss", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, {})

		telescope.setup({
			defaults = {

				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { "smart" },
				file_ignore_patterns = {},

				mappings = {
					i = {
						["<Down>"] = actions.cycle_history_next,
						["<Up>"] = actions.cycle_history_prev,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
			},
		})
	end,
}
