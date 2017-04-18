" Special tabbing
set expandtab                           " use spaces, not tabs
set tabstop=4                           " tabstops of 4
set shiftwidth=4                        " indents of 4

" Whitespace highlighting
" todo: Clear out the previous matches first
syn match none /^\t*\zs \+t/	" don't hightlght spaces used for indent
syn match ExtraWhitespace /\t/		" highlight tabs

source ~/.vim/tab/common.vim
