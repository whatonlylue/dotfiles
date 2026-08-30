require("config.lazy")

vim.wo.relativenumber = true

local opt = vim.opt
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.title = false
opt.titlestring = ""

require("smear_cursor").setup()
require("mason").setup()
require("mason-lspconfig").setup()
vim.lsp.enable({"lua_ls", "pyright", "clangd", "cssls", "elixir_ls", "ts_ls"})

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
require("lualine").setup {
    options = {
        component_separators = '',
        section_separators = '',
        theme = 'gruvbox_dark',
        sections = {
            lualine_a = {},
            lualine_z = {},
        }
    }
}
