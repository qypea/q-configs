" Special tabbing
set expandtab                           " use spaces, not tabs
set tabstop=3                           " tabstops of 3
set shiftwidth=3                        " indents of 3

" Whitespace highlighting
" todo: Clear out the previous matches first
syn match ExtraWhitespace /\t/		" highlight tabs

source ~/.vim/tab/common.vim
