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
                {'\\D', function() builtin.diagnostics({ root_dir = true }) end },
                {'\\a', builtin.lsp_document_symbols},
                {'\\A', builtin.lsp_workspace_symbols},
                {'\\v', function() builtin.lsp_document_symbols({symbols = {'variable', 'field', 'parameter', 'constant'}}) end },
                {'\\V', function() builtin.lsp_workspace_symbols({symbols = {'variable', 'field', 'parameter', 'constant'}}) end },
                {'\\l', function() builtin.lsp_document_symbols({symbols = {'object', 'string', 'character', 'float', 'number', 'boolean'}}) end },
                {'\\L', function() builtin.lsp_workspace_symbols({symbols = {'object', 'string', 'character', 'float', 'number', 'boolean'}}) end },
                {'\\c', function() builtin.lsp_document_symbols({symbols = 'class'}) end },
                {'\\C', function() builtin.lsp_workspace_symbols({symbols = 'class'}) end },
                {'\\f', function() builtin.lsp_document_symbols({symbols = {'function', 'method', 'constructor', 'property'}}) end },
                {'\\F', function() builtin.lsp_workspace_symbols({symbols = {'function', 'method', 'constructor', 'property'}}) end },
                {'\\q', builtin.quickfix},
                {'<leader><Tab>', builtin.buffers},
                {'<leader>\\?', builtin.search_history},
                {'<leader>\\r', builtin.registers},
                {'<leader>\\:', builtin.command_history},
                {'<leader>\\<F1>', builtin.help_tags},
                {'<leader>\\m', builtin.marks},
                {'<leader>\\h', builtin.highlights},
                {'<leader>\\k', builtin.keymaps},
                {'\\m', builtin.man_pages},
                {'<C-p>', function() builtin.git_files({ show_untracked = true }) end },
                {'\\G', builtin.git_commits},
                {'\\B', builtin.git_branches},
                {'\\g', builtin.git_bcommits},
                {'\\g', mode='v', builtin.git_bcommits_range},
                { '<leader>F', ':Telescope file_browser path=%:p:h select_buffer=true<CR>' },
                {'\\<Tab>', function() builtin.git_files({ git_command={ 'git', 'diff', '--name-only', 'main...' } }) end },
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
            require('telescope').load_extension('fzf')
            require('telescope').load_extension('live_grep_args')
            require('telescope').load_extension('file_browser')
            vim.cmd 'autocmd User TelescopePreviewerLoaded setlocal number'
        end,
        opts = function()
            local actions = require('telescope.actions')
            local git_previewer = { require('telescope.previewers').git_commit_diff_as_was.new({}), }

            return {
                theme = 'tokyonight',
                defaults = {
                    prompt_prefix = '   ',
                    layout_strategy = 'horizontal',
                    -- layout_strategy = 'vertical',
                    mappings = {
                        n = {
                            ['<A-p>'] = require('telescope.actions.layout').toggle_preview,
                            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
                        },
                        i = {
                            ['<A-p>'] = require('telescope.actions.layout').toggle_preview,
                            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
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
                    buffers = {
                        mappings = {
                            i = {
                                    ['<CR>'] = actions.select_drop,
                                    ['<DEL>'] = actions.delete_buffer,
                                },
                            n = {
                                    ['<CR>'] = actions.select_drop,
                                    ['d'] = actions.delete_buffer,
                                },
                        }
                    },
                    live_grep = { disable_coordinates = true, },
                    grep_string = { disable_coordinates = true, },
                    treesitter = { show_line = false, },
                    git_commits = { previewer = git_previewer },
                    git_bcommits = { previewer = git_previewer },
                    git_bcommits_range = { previewer = git_previewer },
                },
            }
        end,
    },
}
