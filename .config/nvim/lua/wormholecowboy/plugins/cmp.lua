return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "rafamadriz/friendly-snippets",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-cmdline",
    { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    local tailwind_formatter = require("tailwindcss-colorizer-cmp").formatter

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()
    -- luasnip.filetype_extend("javascript", { "javascriptreact" })

    local check_backspace = function() -- from chris@machine (needed for supertab)
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noinsert",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = {
          border = "rounded",
          winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
          col_offset = -3,
          side_padding = 1,
          scrollbar = false,
          scrolloff = 8,
        },
        documentation = {
          border = "rounded",
          winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
        },
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

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer", keyword_length = 3 },
        { name = "path" },
      }),

      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
          menu = {
            nvim_lsp = "lsp",
            nvim_lua = "lua",
            path = "path",
            buffer = "buf",
            luasnip = "snip",
            treesitter = "",
            zsh = "",
          },
          before = tailwind_formatter,
        }),
      },
    })
  end,
}
