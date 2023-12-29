return {
    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
            { 'VonHeikemen/lsp-zero.nvim' },
        },
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
                }),
                sources = {
                    { name = "neorg" },
                    { name = "lsp_zero" },
                },
            })
        end
    },
}
