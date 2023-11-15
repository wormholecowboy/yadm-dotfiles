return {
	"VonHeikemen/lsp-zero.nvim",
	event = { "BufReadPre", "BufNewFile" },
	branch = "v2.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{ "williamboman/mason.nvim" }, -- Optional
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "L3MON4D3/LuaSnip" }, -- Required
		{ "saadparwaiz1/cmp_luasnip" },
	},
	config = function()
		local lsp = require("lsp-zero").preset({})
		local cmp = require("cmp")
		-- local cmp_action = require("lsp-zero").cmp_action()
		-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

		lsp.on_attach(function(client, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			lsp.default_keymaps({ buffer = bufnr })
		end)

		-- (Optional) Configure lua language server for neovim
		require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

		vim.diagnostic.config({

			underline = true,
			virtual_text = false,
			signs = true,
		})

		--[[ lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ["lua_ls"] = { "lua" },
        ["rust_analyzer"] = { "rust" },
    },
}) ]]

		lsp.ensure_installed({
			"tsserver",
			"pyright",
			"lua_ls",
		})

		--[[ local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end ]]

		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip").filetype_extend("javascript", { "javascriptreact" })

		local check_backspace = function() -- from chris@machine (needed for supertab)
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local snip_status_ok, luasnip = pcall(require, "luasnip")
		if not snip_status_ok then
			return
		end

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer", keyword_length = 3 },
			}),
			completion = {
				completeopt = "menu,menuone, noinsert",
			},
			mapping = cmp.mapping.preset.insert({
				["<C-l>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
				["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
				["<C-k>"] = cmp.mapping.scroll_docs(-4),
				["<C-j>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
				["<Tab>"] = cmp.mapping(function(fallback) -- SuperTAB stuff
					--[[ if cmp.visible() then
						cmp.select_next_item() ]]
					if luasnip.jumpable(1) then
						luasnip.jump(1)
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif luasnip.expandable() then
						luasnip.expand()
					elseif check_backspace() then
						-- cmp.complete()
						fallback()
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					--[[ if cmp.visible() then
						cmp.select_prev_item() ]]
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
			}),
		})

		lsp.setup()
	end,
}
