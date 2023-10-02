-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    --
    -- COLORS --
    use("martinsione/darkplus.nvim")
    use("folke/tokyonight.nvim")
    use("dracula/vim")
    use("lifepillar/vim-solarized8")
    use("neanias/everforest-nvim")
    use("morhetz/gruvbox")
    use({ "rose-pine/neovim", as = "rose-pine" })
    use("EdenEast/nightfox.nvim")
    use("kvrohit/mellow.nvim")
    use("talha-akram/noctis.nvim")
    use({
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    })

    -- EDITING
    use({
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    })
    use("stevearc/conform.nvim")
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })
    use("tpope/vim-surround")
    use("windwp/nvim-ts-autotag")
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    })
    use("rafamadriz/friendly-snippets")
    use({
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
    })

    -- ENVIRON
    use("nvim-treesitter/nvim-treesitter-context")
    use({
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    })
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("mbbill/undotree")
    use({ "kyazdani42/nvim-tree.lua", commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243" })
    use("folke/zen-mode.nvim")
    use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
    })
    use("tpope/vim-fugitive")

    -- NAV
    use("ThePrimeagen/harpoon")
    use({
        "phaazon/hop.nvim",
        branch = "v2", -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
        end,
    })
    use("karb94/neoscroll.nvim")

    -- LSP & CMP
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-buffer")
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },    -- Required
            { "williamboman/mason.nvim" },  -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" }, -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "L3MON4D3/LuaSnip" }, -- Required
            { "saadparwaiz1/cmp_luasnip" },
        },
    })
end)
