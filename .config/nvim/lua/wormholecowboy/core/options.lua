vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  desc = "Hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("WritingMode", { clear = true }),
  desc = "Writing Mode",
  pattern = "*",
  callback = function()
    vim.keymap.set("n", "<leader>q", function()
      vim.cmd("ZenMode")
      require("cmp").setup.buffer({ enabled = false })
      vim.wo.wrap = true
      vim.wo.linebreak = true
    end, { buffer = 0, desc = "Writing mode engaged" })
  end,
})

-- vim.diagnostic.config({virtual_text = false, underline = true})
-- this will disable lsp diagnostics
--
-- toggle script for lsp diagnostic
vim.api.nvim_create_user_command("DiagnosticsToggleVirtualText", function()
  local current_value = vim.diagnostic.config().virtual_text
  if current_value then
    vim.diagnostic.config({ virtual_text = false })
  else
    vim.diagnostic.config({ virtual_text = true })
  end
end, {}) --
--

vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.pumheight = 10 -- pop up menu height

vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.shiftwidth = 2 -- the number of spaces when using <>
vim.opt.softtabstop = 2 -- Defines how many spaces the <Tab> key inserts or deletes in insert mode. This doesn’t directly affect > or <, but it's useful to keep consistent with shiftwidth.
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.tabstop = 2 -- Controls how many spaces a tab character represents visually. This only matters if expandtab is not set and actual tab characters are used.
vim.opt.smarttab = true -- It makes tabbing smarter by aligning it with the indentation settings (shiftwidth and tabstop).
-- Effect in Insert Mode:
--
-- When smarttab is enabled, pressing <Tab> inserts spaces equivalent to the shiftwidth value (if expandtab is enabled) or aligns to the shiftwidth-based indentation level.
-- If smarttab is disabled, <Tab> always inserts spaces or tabs based on tabstop, regardless of context.
-- Effect in Command Mode (e.g., when using >> or <<):
--
-- With smarttab, the >> and << commands respect the shiftwidth setting for indentation.

-- vim.opt.autoindent = true -- makes Vim automatically align new lines with the indentation level of the previous line.
--
vim.opt.smartindent = true
-- vim.opt.cindent = true
vim.opt.numberwidth = 2 -- controls the width of the column used to display line numbers 
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true
vim.opt.wrap = false -- display lines as one long line

vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "80"

vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.opt.grepformat = "%f:%l:%c:%m"
