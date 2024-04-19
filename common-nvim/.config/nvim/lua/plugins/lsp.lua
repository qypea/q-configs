return {
    {
        -- Common setup, good defaults
        'VonHeikemen/lsp-zero.nvim',
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        -- LSP servers
        'neovim/nvim-lspconfig',
        dependencies = { { 'hrsh7th/cmp-nvim-lsp' }, },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(_client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })

                -- Autoformat on save
                lsp_zero.buffer_autoformat()
            end)

            -- Specific language servers
            require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls({
                cmd = { "/home/q/.config/lua-language-server-3.7.3-linux-x64/bin/lua-language-server" },
                settings = {
                    Lua = {
                        diagnostics = {
                            unusedLocalExclude = { "_*" },
                        }
                    }
                }
            }))
            require('lspconfig').clangd.setup({ capabilities = lsp_zero.get_capabilities() })
            require('lspconfig').jsonls.setup({})
            require('lspconfig').pylsp.setup({
                capabilities = lsp_zero.get_capabilities(),
                settings = {
                    pylsp = {
                        plugins = {
                            -- Disable linters. These are run below instead so they get .configs better
                            autopep8 = { enabled = false },
                            flake8 = { enabled = false },
                            mccabe = { enabled = false },
                            preload = { enabled = false },
                            pycodestyle = { enabled = false },
                            pydocstyle = { enabled = true },
                            pylint = { enabled = false },
                            yapf = { enabled = false },
                        }
                    }
                }
            })
            require('lspconfig').beancount.setup({
                capabilities = lsp_zero.get_capabilities(),
                init_options = {
                    journal_file = "/home/q/Documents/beancount/main.beancount",
                }
            })
        end
    },
    {
        -- Extras for other languages
        "nvimtools/none-ls.nvim",
        dependencies = { { "nvim-lua/plenary.nvim", "nvimtools/none-ls-extras.nvim", "gbprod/none-ls-shellcheck.nvim" }, },
        event = { "BufReadPre", "BufNewFile" },
        opts = function()
            local null_ls = require("null-ls")
            return {
                sources = {
                    -- Yaml linting
                    null_ls.builtins.diagnostics.yamllint,
                    -- Json linting
                    require("none-ls.formatting.jq").with({
                        extra_args = { "--indent", "4", },
                    }),
                    -- Shell linting
                    require("none-ls-shellcheck.diagnostics"),
                    require("none-ls-shellcheck.code_actions"),
                    -- Python Styling
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
