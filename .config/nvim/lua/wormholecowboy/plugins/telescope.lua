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

        vim.keymap.set("n", "<leader>sgf", builtin.git_files, {})
        vim.keymap.set("n", "<leader>sgb", builtin.git_branches, {})
        vim.keymap.set("n", "<leader>sgc", builtin.git_commits, {})
        vim.keymap.set("n", "<leader>sgs", builtin.git_status, {})
        vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
        vim.keymap.set("n", "<leader>sb", builtin.current_buffer_fuzzy_find, {})
        vim.keymap.set("n", "<leader>sh", builtin.help_tags, {})
        vim.keymap.set("n", "<leader>scs", builtin.colorscheme, {})
        vim.keymap.set("n", "<leader>scc", builtin.commands, {})
        vim.keymap.set("n", "<leader>sch", builtin.command_history, {})
        vim.keymap.set("n", "<leader>sr", builtin.oldfiles, {})
        vim.keymap.set("n", "<leader>sk", builtin.keymaps, {})
        vim.keymap.set("n", "<leader>sm", builtin.marks, {})
        vim.keymap.set("n", "<leader>sn", builtin.man_pages, {})
        vim.keymap.set("n", "<leader>sa", builtin.autocommands, {})
        vim.keymap.set("n", "<leader>ss", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)

        telescope.setup({
            defaults = {

                prompt_prefix = " ",
                selection_caret = " ",
                path_display = { "smart" },
                file_ignore_patterns = { "node_modules" },

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
