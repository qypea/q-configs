-- Editor options
vim.opt.mouse = ""
vim.opt.signcolumn = 'no'
vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.wildmode = 'longest,list'
vim.opt.showcmd = true
vim.opt.autowrite = true
vim.opt.makeprg = './.dwbuild'
vim.opt.autoread = true
vim.opt.ttyfast = true
vim.opt.foldenable = false

-- Spell check underlining
vim.opt.spell = true
vim.api.nvim_command('highlight SpellBad None')
vim.api.nvim_command('highlight SpellCap None')
vim.api.nvim_command('highlight SpellLocal None')
vim.api.nvim_command('highlight SpellRare None')
vim.api.nvim_command('highlight SpellBad cterm=underline')
vim.api.nvim_command('highlight SpellCap cterm=underline')

-- Spaces, 4 wide with tab char
-- TODO: Indent amount based on .files in working copy
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.api.nvim_create_user_command("Dwtasks",
    function(opts)
        require("telescope.builtin").grep_string({ search = "[ ]" })
    end,
    {})
