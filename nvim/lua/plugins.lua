return {
    "williamboman/mason.nvim",

    "williamboman/mason-lspconfig.nvim",

    'ellisonleao/gruvbox.nvim',

    "neovim/nvim-lspconfig",

     "sphamba/smear-cursor.nvim",

     "lewis6991/gitsigns.nvim",

    {
        'saghen/blink.cmp',

        dependencies = { 'rafamadriz/friendly-snippets' },

        version = '1.*',

        --@module 'blink.cmp'
        --@type blink.cmp.Config
        opts = {
            keymap = { preset = 'default' },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            fuzzy = {
                implementation = 'prefer_rust_with_warning'
            }
        },
        opts_extend = { "sources.default" }
    },

    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
    },

    {
        "L3MON4D3/LuaSnip",
        version = "v2.*"
    },

    {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons'}
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            dashboard = {enabled = true},
            bigfile = {enabled = true},
            debug = {enabled = true},
            notifier = {enabled = true},
            explorer = {enabled = true},
            quickfile = {enabled = true},
            indent = {enabled = true},
            picker = {enabled = true},
	        gitbrowse = {enabled = true},
            gh = {enabled = true},
            statuscolumn = {
                enabled = true,
                left = {"mark", "sign"},
                right = {"git", "fold"},
                git = {
                    patterns = {"GitSign", "MiniDiffSign"}
                }

            },
            words = {enabled = true},
        },
        keys = {
            { "<leader>z", function() Snacks.debug.backtrace() end, desc = "Toggle debug"},
            { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification history"},
            { "<leader>gb", function() Snacks.gitbrowse() end, desc = "Git Branches"},
            { "<leader><space>", function() Snacks.picker.smart() end, desc = "fuzzy find"},
            { "<leader>sM", function() Snacks.picker.man() end, desc = "man pages"},
            { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer"},
            { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "Github pull requests (open)"}
        }
    }
}
