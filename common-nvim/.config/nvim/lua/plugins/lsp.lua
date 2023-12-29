return {
    {
        -- Common setup, good defaults
        'VonHeikemen/lsp-zero.nvim',
    },
    {
        -- LSP servers
        'neovim/nvim-lspconfig',
        dependencies = { { 'hrsh7th/cmp-nvim-lsp' }, },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })

                -- Autoformat on save
                lsp_zero.buffer_autoformat()
            end)

            -- Specific language servers
            require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls({
                cmd = { "/home/q/.config/lua-language-server-3.7.3-linux-x64/bin/lua-language-server" },
            }))
            require('lspconfig').clangd.setup({ capabilities = lsp_zero.get_capabilities() })
            require('lspconfig').pylsp.setup({
                capabilities = lsp_zero.get_capabilities(),
                settings = {
                    pylsp = {
                        plugins = {
                            -- Disable linters. These are run below instead so they get .configs better
                            autopep8 = { enabled = false },
                            flake8 = { enabled = false },
                            preload = { enabled = false },
                            pycodestyle = { enabled = false },
                            pydocstyle = { enabled = false },
                            pylint = { enabled = false },
                            yapf = { enabled = false },
                        }
                    }
                }
            })
        end
    },
    {
        -- Extras for other languages
        "nvimtools/none-ls.nvim",
        dependencies = { { "nvim-lua/plenary.nvim" }, },
        event = { "BufReadPre", "BufNewFile" },
        opts = function()
            local null_ls = require("null-ls")
            return {
                sources = {
                    -- Shell linting
                    null_ls.builtins.diagnostics.shellcheck,
                    -- Python Styling
                    null_ls.builtins.diagnostics.pydocstyle,
                    null_ls.builtins.diagnostics.pylint,
                    null_ls.builtins.formatting.black.with({
                        extra_args = {
                            "--line-length",
                            "150",
                        },
                    }),
                    null_ls.builtins.formatting.isort.with({
                        extra_args = {
                            "--profile",
                            "black",
                            "--line-length",
                            "150",
                        },
                    }),
                },
            }
        end,
    },
}
