" Special tabbing
set expandtab                           " use spaces, not tabs
set tabstop=2                           " tabstops of 2
set shiftwidth=2                        " indents of 2

" Whitespace highlighting
" todo: Clear out the previous matches first
syn match ExtraWhitespace /\t/		" highlight tabs

source ~/.vim/tab/common.vim
