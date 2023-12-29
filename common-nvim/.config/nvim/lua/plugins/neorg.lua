return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            highlight = { enable = true },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "pysan3/neorg-templates", dependencies = { "L3MON4D3/LuaSnip" } },
        },
        config = function()
            require("neorg").setup({
                load = {
                    ["core.completion"] = {
                        config = {
                            engine = "nvim-cmp",
                        },
                    },
                    ["core.concealer"] = {},
                    ["core.defaults"] = {},
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                notes = "~/notes",
                            },
                            default_workspace = "notes",
                        },
                    },
                    ["core.journal"] = {
                        config = {
                            strategy = "flat",
                        },
                    },
                    ["external.templates"] = {},
                },
            })

            vim.wo.conceallevel = 2

            vim.api.nvim_create_autocmd("BufNewFile", {
                --[[
                For some odd reason this doesn't work with "Neorg journal today"
                See journal.sh script for how to open/make journal automatically.
                ]]
                command = "Neorg templates load journal",
                pattern = { "*/journal/*.norg" },
            })
        end,
    },
}
