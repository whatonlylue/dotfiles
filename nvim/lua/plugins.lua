return {
	-- the colorscheme
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false, -- always loads
		priority = 1000, -- loads before any others
		config = function()
			--load the colorscheme here

			vim.cmd("colorscheme rose-pine-moon")
		end,
	},
    {
        "williamboman/mason.nvim",
        opts = { ui = { border = "rounded"}},
    },
    
    "williamboman/mason-lspconfig.nvim",

    'ThePrimeagen/vim-be-good',

    "lewis6991/gitsigns.nvim",

    "neovim/nvim-lspconfig",

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup {
              snippet = {
                expand = function(args) require("luasnip").lsp_expand(args.body) end,
              },
              mapping = cmp.mapping.preset.insert {
                ["<Tab>"]   = cmp.mapping.confirm { select = true },
                ["<C-Space>"] = cmp.mapping.complete {},
              },
              sources = {
                { name = "nvim_lsp" },   -- ← brings in the type‑aware suggestions
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
              },
              experimental = { ghost_text = true }, -- shows faint inline suggestion
            }
        end,

    },

    "nvim-treesitter/nvim-treesitter",

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },

    {
        "SirVer/ultisnips",
        init = function()
            vim.g.UltiSnipsExpandTrigger = "<tab>"
            vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
            vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
            vim.g.UltiSnipsSnippetDirectories = {"UltiSnips"}
        end,
    },

    {
        "lervag/vimtex",
        ft = {'tex'},
        init = function()
            vim.g.vimtex_view_method = "skim"
            vim.g.vimtex_view_skim_sync = 1
            vim.g.vimtex_quickfix_mode = 0
            vim.g.vimtex_compiler_method = "latexmk"
            vim.g.vimtex_compiler_latexmk = {
                build_dir = 'build',
                continuous = 1,
                callback = 1,
                executable = 'latexmk',
                options = {
                    "-shell-escape",
                    "-synctex=1",
                    "-interaction=nonstopmode",
                },
            }
        end,
    },
    
}
