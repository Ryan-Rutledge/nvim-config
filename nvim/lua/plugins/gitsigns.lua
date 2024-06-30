require('gitsigns').setup({
    current_line_blame = false,
    attach_to_untracked = true,
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        vim.keymap.set('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(gs.next_hunk)
            return '<Ignore>'
        end, { buffer = bufnr, silent = true, noremap = true, expr=true})

        vim.keymap.set('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(gs.prev_hunk)
            return '<Ignore>'
        end, { buffer = bufnr, silent = true, noremap = true, expr=true})

        mopts = { buffer = bufnr, silent = true, noremap = true }
        vim.keymap.set('n', '<leader>gg', gs.toggle_signs, mopts)
        vim.keymap.set('n', '<leader>gb', function() gs.blame_line{full=true} end, mopts)
        vim.keymap.set('n', '<leader>gd', gs.diffthis, mopts)
        vim.keymap.set('n', '<leader>gD', function() gs.diffthis(vim.cmd("~")) end, mopts)
        vim.keymap.set('n', '<leader>gp', gs.preview_hunk_inline, mopts)
        vim.keymap.set('n', '<leader>gP', gs.preview_hunk, mopts)
        vim.keymap.set('n', '<leader>gr', gs.reset_hunk, mopts)
        vim.keymap.set('v', '<leader>gr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, mopts)
        vim.keymap.set('n', '<leader>gR', gs.reset_buffer, mopts)
        vim.keymap.set('n', '<leader>gs', gs.stage_hunk, mopts)
        vim.keymap.set('v', '<leader>gs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, mopts)
        vim.keymap.set('n', '<leader>gS', gs.stage_buffer, mopts)
        vim.keymap.set('n', '<leader>gu', gs.undo_stage_hunk, mopts)
        vim.keymap.set('n', '<leader>gw', gs.toggle_word_diff, mopts)
        vim.keymap.set({'o', 'x'}, 'ic', gs.select_hunk, mopts)
        vim.keymap.set({'o', 'x'}, 'ac', gs.select_hunk, mopts)
    end
})
