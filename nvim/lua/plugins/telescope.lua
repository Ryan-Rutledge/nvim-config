return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
            },
            'nvim-telescope/telescope-file-browser.nvim',
            'nvim-telescope/telescope-live-grep-args.nvim',
        },
        keys = function()
            local builtin = require('telescope.builtin')

            return {
                {'gi', builtin.lsp_implementations},
                {'gr', builtin.lsp_references},
                {'z=', builtin.spell_suggest},
                {'\\%', builtin.current_buffer_fuzzy_find},
                {'\\*', builtin.grep_string},
                {'\\b', function() builtin.live_grep({ grep_open_files = true }) end },
                {'\\<BS>', builtin.resume},
                {'\\d', builtin.diagnostics},
                {'\\a', builtin.lsp_document_symbols},
                {'\\n', function() builtin.lsp_document_symbols({symbols = {'namespace'}}) end },
                {'\\c', function() builtin.lsp_document_symbols({symbols = 'class'}) end },
                {'\\f', function() builtin.lsp_document_symbols({symbols = {'function', 'method', 'constructor', 'property'}}) end },
                {'\\v', function() builtin.lsp_document_symbols({symbols = {'variable', 'field', 'parameter', 'constant'}}) end },
                {'\\q', builtin.quickfix},
                {'\\l', builtin.loclist},
                {'<leader><Tab>', builtin.buffers},
                {'<leader>\\?', builtin.search_history},
                {'<leader>\\r', builtin.registers},
                {'<leader>\\:', builtin.command_history},
                {'<leader>\\<F1>', builtin.help_tags},
                {'<leader>\\m', builtin.marks},
                {'<leader>\\h', builtin.highlights},
                {'<leader>\\k', builtin.keymaps},
                {'\\m', builtin.man_pages},
                {'<C-p>', function() builtin.git_files({ use_file_path = true, show_untracked = true }) end },
                {'\\G', builtin.git_commits},
                {'\\B', builtin.git_branches},
                {'\\g', builtin.git_bcommits},
                {'\\g', mode='v', builtin.git_bcommits_range},
                {'<leader>f', builtin.find_files },
                -- {'<leader>F', ':Telescope file_browser path=%:p:h select_buffer=true<CR>' },
                {'<leader>F', function() require('telescope').extensions.file_browser.file_browser({
                    path = '%:p:h',
                    select_buffer = true,
                    hidden = true,
                    follow_symlinks = true,
                }) end },
                {'\\<Tab>', function() builtin.git_files({ git_command={ 'git', 'diff', '--name-only', 'main...' } }) end },
                {'\\<S-Tab>', function() builtin.git_files({ git_command={ 'git', 'diff', '--name-only', 'master...' } }) end },
                {
                    '\\\\',
                    function()
                        local args = {}
                        local gitdir = vim.fn.finddir('.git', vim.fn.expand '%:p:p' .. ';')
                        if gitdir ~= '' then
                            local repodir = require('plenary').path:new(gitdir):parent():absolute()
                            args = { search_dirs = { repodir } }
                        end

                        require('telescope').extensions.live_grep_args.live_grep_args(args)
                    end
                },
            }
        end,
        config = function(_, opts)
            require('telescope').setup(opts)
            vim.cmd 'autocmd User TelescopePreviewerLoaded setlocal number'
        end,
        opts = function()
            local actions = require('telescope.actions')
            local layout = require('telescope.actions.layout')

            return {
                theme = 'tokyonight',
                defaults = {
                    prompt_prefix = '   ',
                    layout_strategy = 'horizontal',
                    mappings = {
                        n = {
                            ['<A-p>'] = layout.toggle_preview,
                            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
                            ['<C-l>'] = actions.smart_send_to_loclist + actions.open_loclist,
                        },
                        i = {
                            ['<A-p>'] = layout.toggle_preview,
                            ['<A-k>'] = actions.cycle_previewers_prev,
                            ['<A-j>'] = actions.cycle_previewers_next,
                            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
                            ['<C-l>'] = actions.smart_send_to_loclist + actions.open_loclist,
                        },
                    },
                    path_display = {
                        filename_first = { reverse_directories = true }
                    },
                    winblend = 0,
                    border = true,
                    color_devicons = true,
                    multi_icon = ' ',
                    selection_caret = '  ',
                    entry_prefix = '  ',
                    initial_mode = 'insert',
                    sorting_strategy = 'ascending',
                    show_line = false,
                    trim_text = true,
                },
                extensions = {
                    file_browser = {
                        hide_parent_dir = true,
                        follow_symlinks = true,
                        prompt_path = true,
                    },
                    live_grep_args = {
                        mappings = {
                            i = {
                                ['<C-k>'] = require('telescope-live-grep-args.actions').quote_prompt(),
                                ['<C-i>'] = require('telescope-live-grep-args.actions').quote_prompt({ postfix = ' --iglob ' }),
                            },
                        },
                    }
                },
                pickers = {
                    git_files = {
                        mappings = {
                            i = { ['<CR>'] = actions.select_drop, },
                            n = { ['<CR>'] = actions.select_drop, },
                        }
                    },
                    buffers = {
                        mappings = {
                            i = { ['<CR>'] = actions.select_drop, ['<DEL>'] = actions.delete_buffer, },
                            n = { ['<CR>'] = actions.select_drop, ['d'] = actions.delete_buffer, },
                        }
                    },
                    live_grep = { disable_coordinates = true, },
                    grep_string = { disable_coordinates = true, },
                    treesitter = { show_line = false, },
                },
            }
        end,
    },
}
