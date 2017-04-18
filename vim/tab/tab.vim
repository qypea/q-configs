" Special tabbing
set noexpandtab                         " use tabs, not spaces
set tabstop=8                           " tabstops of 8
set shiftwidth=8                        " indents of 8
set textwidth=78                        " screen in 80 columns wide, wrap at 78

" Whitespace highlighting
" todo: Clear out the previous matches first
syn match none /\t/		" don't highlight tabs
syn match ExtraWhitespace /^  */	" hightlght spaces used for indent

source ~/.vim/tab/common.vim
