return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				sql = { "sql_formatter" },
			},
			-- format_on_save = {
			-- 	timeout_ms = 500,
			-- 	lsp_fallback = true,
			-- },
		})
          vim.keymap.set("n", "<leader>uf", "<cmd>lua require('conform').format()", {})
	end,
}
