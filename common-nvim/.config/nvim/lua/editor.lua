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

-- Don't start new lines with comments
vim.api.nvim_command('au FileType * set fo-=c fo-=r fo-=o')

-- Indent based on the .indent file closest to this working copy
local indent_file = vim.fs.find({ '.indent_2', '.indent_4', '.indent_tab' },
    { type = 'file', follow = true, limit = 1, upward = true })[1]
if indent_file == nil or vim.fs.basename(indent_file) == '.indent_2' then
    vim.opt.expandtab = true
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
elseif vim.fs.basename(indent_file) == '.indent_4' then
    vim.opt.expandtab = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
elseif vim.fs.basename(indent_file) == '.indent_tab' then
    vim.opt.expandtab = false
    vim.opt.tabstop = 8
    vim.opt.shiftwidth = 8
else
    vim.notify("Invalid notify file found. Defaults may not be good", vim.log.levels.ERROR)
end

vim.api.nvim_create_user_command("Dwtasks",
    function(opts)
        require("telescope.builtin").grep_string({ search = "[ ]" })
    end,
    {})
