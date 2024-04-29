return {
    {
        -- Render markdown files with Glow command
        "ellisonleao/glow.nvim",
        cmd = "Glow",
        config = function()
            require('glow').setup({
                style = "~/.config/nvim/glamour-dark.json",
            })
        end,
    },
    {
        -- Markdown syntax and snippets
        "ixru/nvim-markdown",
    },
    {
        -- Due dates in <>
        "nfrid/due.nvim",
        config = function()
            require('due_nvim').setup {}
        end,
    },
}
