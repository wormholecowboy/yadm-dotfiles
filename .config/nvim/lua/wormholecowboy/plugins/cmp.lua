return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "rafamadriz/friendly-snippets",
    { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
    -- "hrsh7th/cmp-cmdline",
    { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    local tailwind_formatter = require("tailwindcss-colorizer-cmp").formatter

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    -- require("luasnip").log.set_loglevel("info")
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip", option = { use_show_condition = false } },
        -- { name = "luasnip" },
        { name = "buffer", keyword_length = 3 },
        { name = "path" },
      }),
      completion = {
        completeopt = "menu,menuone,preview,noinsert",
      },
      window = {
        completion = {
          winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
          col_offset = -3,
          side_padding = 1,
          scrollbar = false,
          scrolloff = 8,
        },
        documentation = {
          winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
        },
      },
      mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-l>"] = cmp.mapping.confirm({ select = true }),
        ["<C-y>"] = cmp.mapping(
          cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
          { "i", "c" }
        ),
      },
      -- formatting = {
      --   format = lspkind.cmp_format({
      --     maxwidth = 50,
      --     ellipsis_char = "...",
      --     menu = {
      --       nvim_lsp = "lsp",
      --       nvim_lua = "lua",
      --       path = "path",
      --       buffer = "buf",
      --       luasnip = "snip",
      --       treesitter = "",
      --       zsh = "",
      --     },
      --     before = tailwind_formatter,
      --   }),
      -- },
    })
  end,
}
