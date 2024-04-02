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

    function searchString()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end

    local wk = require("which-key")
    wk.register({
      s = {
        s = { "<cmd>lua searchString()<cr>", "string" },
        f = { "<cmd>Telescope find_files<cr>", "files" },
        h = { "<cmd>Telescope help_tags<cr>", "help" },
        b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "buffer" },
        cs = { "<cmd>Telescope colorscheme<cr>", "color scheme" },
        cc = { "<cmd>Telescope commands<cr>", "commands" },
        ch = { "<cmd>Telescope command_history<cr>", "command_history" },
        r = { "<cmd>Telescope oldfiles<cr>", "recent" },
        k = { "<cmd>Telescope keymaps<cr>", "keymaps" },
        m = { "<cmd>Telescope marks<cr>", "marks" },
        n = { "<cmd>Telescope man_pages<cr>", "man pages" },
        a = { "<cmd>Telescope autocommands<cr>", "man pages" },
        gf = { "<cmd>Telescope git_files<cr>", "git files" },
        gb = { "<cmd>Telescope git_branches<cr>", "git branches" },
        gc = { "<cmd>Telescope git_commits<cr>", "git commits" },
        gs = { "<cmd>Telescope git_status<cr>", "git status" },
      },
    }, { prefix = "<leader>" })

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
