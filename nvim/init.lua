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
require("luasnip.loaders.from_vscode").lazy_load()
local ls = require("luasnip")
vim.keymap.set({"i"}, "<Tab>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<Tab>", function() ls.jump(1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

vim.lsp.enable({"lua_ls", "pyright", "clangd", "cssls", "elixir_ls", "ts_ls"})

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
require("lualine").setup {
    options = {
        component_separators = '',
        section_separators = '',
        theme = 'gruvbox_dark',
    }
}
