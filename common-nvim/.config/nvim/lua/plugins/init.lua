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
                current_line_blame = true,
                current_line_blame_opts = {
                    virt_text_pos = 'right_align',
                    delay = 100,
                }
            })
        end,
    },
}
