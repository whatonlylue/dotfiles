require("config.lazy")

local opt = vim.opt

opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
vim.wo.relativenumber = true
opt.title = false
opt.titlestring = ""
opt.redrawtime = 10000
opt.lazyredraw = true
opt.ttyfast = true

vim.api.nvim_create_autocmd("VimResized", {
    pattern = "*",
    command = "redraw!"
})


require("mason").setup()



-- Merge LSP capabilities with nvim‑cmp (skip this if you don’t use cmp)
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp then capabilities = cmp_lsp.default_capabilities(capabilities) end

local lspconfig = require("lspconfig")

-- Tell Mason which servers you care about
require("mason-lspconfig").setup {
  ensure_installed = { "pylsp", "jdtls", "lua_ls", "texlab", "rust_analyzer", "ts_ls", "cssls", "html"}, -- add yours here

  handlers = {
    function(server_name)                 -- default handler for *every* server
        lspconfig[server_name].setup {
          capabilities = capabilities,
          on_attach = function(_, bufnr)     -- optional keymaps
            if vim.lsp.inlay_hint and vim.lsp.inlay_hint.enable then
                vim.lsp.inlay_hint.enable(true, {bufnr = bufnr}) 
        end
            local k = vim.keymap.set
            k("n", "K",     vim.lsp.buf.hover,        { buffer = bufnr })
            k("n", "gd",    vim.lsp.buf.definition,   { buffer = bufnr })
            k("n", "<leader>rn",  vim.lsp.buf.rename,       { buffer = bufnr })
          end,
        }
      end,
  }
}



