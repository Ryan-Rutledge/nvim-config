return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim', 'nvim-telescope/telescope-file-browser.nvim', 'nvim-telescope/telescope-live-grep-args.nvim'},
        keys = {
            {'gi', function() require('telescope.builtin').lsp_implementations() end },
            {'gr', function() require('telescope.builtin').lsp_references() end },
            {'z=', function() require('telescope.builtin').spell_suggest() end },
            {'<leader>f', function() require('telescope.builtin').find_files() end },
            {'\\%', function() require('telescope.builtin').current_buffer_fuzzy_find() end },
            {'\\*', function() require('telescope.builtin').grep_string() end },
            {'\\b', function() require('telescope.builtin').live_grep({ grep_open_files = true }) end },
            {'\\T', function() require('telescope.builtin').treesitter() end },
            {'\\<BS>', function() require('telescope.builtin').resume() end },
            {'\\d', function() require('telescope.builtin').diagnostics() end },
            {'\\D', function() require('telescope.builtin').diagnostics({ root_dir = true }) end },
            {'\\a', function() require('telescope.builtin').lsp_document_symbols() end },
            {'\\A', function() require('telescope.builtin').lsp_workspace_symbols() end },
            {'\\v', function() require('telescope.builtin').lsp_document_symbols({symbols = {'variable', 'field', 'parameter', 'constant'}}) end },
            {'\\V', function() require('telescope.builtin').lsp_workspace_symbols({symbols = {'variable', 'field', 'parameter', 'constant'}}) end },
            {'\\l', function() require('telescope.builtin').lsp_document_symbols({symbols = {'object', 'string', 'character', 'float', 'number', 'boolean'}}) end },
            {'\\L', function() require('telescope.builtin').lsp_workspace_symbols({symbols = {'object', 'string', 'character', 'float', 'number', 'boolean'}}) end },
            {'\\c', function() require('telescope.builtin').lsp_document_symbols({symbols = 'class'}) end },
            {'\\C', function() require('telescope.builtin').lsp_workspace_symbols({symbols = 'class'}) end },
            {'\\f', function() require('telescope.builtin').lsp_document_symbols({symbols = {'function', 'method', 'constructor', 'property'}}) end },
            {'\\F', function() require('telescope.builtin').lsp_workspace_symbols({symbols = {'function', 'method', 'constructor', 'property'}}) end },
            {'\\q', function() require('telescope.builtin').quickfix() end },
            {'<leader><Tab>', function() require('telescope.builtin').buffers() end },
            {'<leader>\\?', function() require('telescope.builtin').search_history() end },
            {'<leader>\\r', function() require('telescope.builtin').registers() end },
            {'<leader>\\:', function() require('telescope.builtin').command_history() end },
            {'<leader>\\<F1>', function() require('telescope.builtin').help_tags() end },
            {'<leader>\\m', function() require('telescope.builtin').marks() end },
            {'<leader>\\h', function() require('telescope.builtin').highlights() end },
            {'<leader>\\k', function() require('telescope.builtin').keymaps() end },
            {'\\m', function() require('telescope.builtin').man_pages() end },
            {'<C-p>', function() require('telescope.builtin').git_files({ show_untracked = true }) end },
            {'\\G', function() require('telescope.builtin').git_commits() end },
            {'\\B', function() require('telescope.builtin').git_branches() end },
            {'\\g', function() require('telescope.builtin').git_bcommits() end },
            {'\\g', function() require('telescope.builtin').git_bcommits_range() end, mode='v' },
            { '<leader>F', ':Telescope file_browser path=%:p:h select_buffer=true<CR>' },
            {
                '\\\\',
                function()
                    local args = {}
                    local gitdir = vim.fn.finddir('.git', vim.fn.expand '%:p:p' .. ';')
                    if gitdir ~= '' then
                        local repodir = require('plenary').path:new(gitdir):parent():absolute()
                        args = { search_dirs = { repodir } }
                    end

                    require('telescope').extensions.live_grep_args.live_grep_args( args)
                end
            },
        },
        config = function(_, opts)
            require('telescope').setup(opts)

            require('telescope').load_extension('fzf')
            require('telescope').load_extension('live_grep_args')
            require('telescope').load_extension('file_browser')
            vim.cmd 'autocmd User TelescopePreviewerLoaded setlocal number'
        end,
        opts = function() return {
            theme = 'tokyonight',
            defaults = {
                prompt_prefix = '   ',
                layout_strategy = 'horizontal',
                -- layout_strategy = 'vertical',
                mappings = {
                    n = {
                        ['<A-p>'] = require('telescope.actions.layout').toggle_preview,
                        ['<C-q>'] = require('telescope.actions').smart_send_to_qflist + require('telescope.actions').open_qflist,
                    },
                    i = {
                        ['<A-p>'] = require('telescope.actions.layout').toggle_preview,
                        ['<C-q>'] = require('telescope.actions').smart_send_to_qflist + require('telescope.actions').open_qflist,
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
                            ["<C-k>"] = function() return require("telescope-live-grep-args.actions").quote_prompt() end,
                            ["<C-i>"] = function() return require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }) end,
                        },
                    },
                }
            },
            pickers = {
                buffers = {
                    mappings = {
                        i = {
                            ['<DEL>'] = require('telescope.actions').delete_buffer
                        },
                        n = {
                            ['d'] = require('telescope.actions').delete_buffer
                        }
                    }
                },
                live_grep = {
                    disable_coordinates = true,
                },
                grep_string = {
                    disable_coordinates = true,
                },
                treesitter = {
                    show_line = false,
                },
            },
        } end,
    },
}
