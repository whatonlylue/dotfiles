local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

npairs.clear_rules()

npairs.add_rules({
    Rule("$", "$", "text")
    :with_pair(function(opts)
        local prev_char = opts.line:sub(opts.col-1, opts.col -1)
        return prev_char ~= "\\"
    end),

    Rule("\\[", "\\]", "tex"),
    Rule("\\(", "\\)", "tex"),
})

vim.keymap.set('n', '<leader>lv', '<cmd>VimtexView<CR>',   { desc = 'Open PDF viewer' })
vim.keymap.set('n', '<leader>lc', '<cmd>VimtexCompile<CR>',{ desc = 'Start/stop continuous compile' })
vim.keymap.set('n', '<leader>lk', '<cmd>VimtexClean<CR>',  { desc = 'Clean aux files' })
