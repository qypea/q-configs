source ~/.vim/lsp.vim

if executable('pylsp')
    augroup lsp_pylsp
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'pylsp',
            \ 'cmd': {server_info->['pylsp']},
            \ 'whitelist': ['python'],
            \ })
    augroup end
endif
