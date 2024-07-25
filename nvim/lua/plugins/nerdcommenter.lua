return {
    'preservim/nerdcommenter',
    keys = {
        { '<C-/>', ':call nerdcommenter#Comment(1, "toggle")<CR>', mode={ 'n', 'v' } },
        { '<C-_>', ':call nerdcommenter#Comment(1, "toggle")<CR>', mode={ 'n', 'v' } }, -- Underscore sometimes represents / in some terminals
    },
    config = function()
        vim.g.NERDCreateCustomMappings = 0
        vim.g.NERDSpaceDelims = 1
        vim.g.NERDCommentEmptyLines = 1
        vim.g.NERDToggleCheckAllLines = 1
        vim.g.NERDDefaultAlign = 'left'
    end
}
