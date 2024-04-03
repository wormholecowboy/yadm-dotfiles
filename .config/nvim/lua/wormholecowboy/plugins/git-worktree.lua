return {
  "polarmutex/git-worktree.nvim",
  config = function()
    require("git-worktree").setup({})
    require("telescope").load_extension("git_worktree")
    vim.keymap.set("n", "<leader>gw", "<cmd>Telescope git_worktree<cr>")
  end,
}
