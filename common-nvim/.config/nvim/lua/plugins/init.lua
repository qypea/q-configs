return {
    {
        -- Store our place in files, go back there
        'ethanholz/nvim-lastplace',
        config = function()
            require('nvim-lastplace').setup({
                lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
                lastplace_open_folds = true
            })
        end,
    },
    {
        -- Highlight whitespace at the end of lines
        'johnfrankmorgan/whitespace.nvim',
        config = function()
            require("whitespace-nvim").setup()
        end,
    },
    {
        -- Display blame info to right
        -- Also provides GitSigns command for more
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                current_line_blame = false,
                current_line_blame_opts = {
                    virt_text_pos = 'right_align',
                    delay = 100,
                }
            })
        end,
    },
    {
        -- Themes
        "EdenEast/nightfox.nvim",
        config = function()
            vim.api.nvim_command('colorscheme carbonfox')
        end,
    },
    {
        -- Trouble command tray
        -- For fancy icons install https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/CommitMono.zip
        -- and set it as the font in the console
        'folke/trouble.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },
    {
        -- Telescope to grep for stuff
        'nvim-telescope/telescope.nvim',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
        },
    },
    {
        -- Close quickfix window after a bit
        'mei28/qfc.nvim',
        config = function()
            require('qfc').setup({
                timeout = 3000,   -- Timeout setting in milliseconds
                autoclose = true, -- Enable/disable autoclose feature
            })
        end
    },
    {
        -- Treesitter for advanced formatting etc
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup({
                highlight = {
                    enable = true,
                },
            })
        end
    },
}
