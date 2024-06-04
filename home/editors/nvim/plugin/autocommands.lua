
local augroup = vim.api.nvim_create_augroup
local LauhkzGroup = augroup('Lauhkz', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = LauhkzGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
