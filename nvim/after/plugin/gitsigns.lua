require('gitsigns').setup{
    current_line_blame = false,
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        map('n', '[c', function()
            if vim.wo.diff then return '[c' end vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        -- Actions
        map('n', '<leader>gb', function() gs.blame_line{full=true} end)
        map('n', '<leader>gB', gs.toggle_current_line_blame)
        map('n', '<leader>gd', gs.diffthis)
        map('n', '<leader>gD', function() gs.diffthis(vim.cmd("~")) end)
        map('n', '<leader>gp', gs.preview_hunk_inline)
        map('n', '<leader>gP', gs.preview_hunk)
        map('n', '<leader>gr', gs.reset_hunk)
        map('v', '<leader>gr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
        map('n', '<leader>gR', gs.reset_buffer)
        map('n', '<leader>gs', gs.stage_hunk)
        map('v', '<leader>gs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
        map('n', '<leader>gS', gs.stage_buffer)
        map('n', '<leader>gu', gs.undo_stage_hunk)
        map('n', '<leader>gw', gs.toggle_word_diff)

        -- Text object
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}
