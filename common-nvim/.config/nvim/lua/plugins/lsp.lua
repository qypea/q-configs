return {
    {
        -- Common setup, good defaults
        'VonHeikemen/lsp-zero.nvim',
    },
    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = { { 'L3MON4D3/LuaSnip' }, },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            local cmp = require('cmp')
            local cmp_action = lsp_zero.cmp_action()

            cmp.setup({
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    -- Enter to confirm completion
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    -- Super tab
                    ['<Tab>'] = cmp_action.luasnip_supertab(),
                    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
                })
            })
        end
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
            require('lspconfig').pylsp.setup({ capabilities = lsp_zero.get_capabilities() })
        end
    },
}
