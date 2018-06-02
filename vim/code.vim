" Indenting
set autoindent smartindent              " turn on auto/smart indenting
set smarttab                            " make <tab> and <backspace> smarter
set backspace=eol,start,indent          " allow backspacing over indent, eol, & start
set textwidth=118                       " screen in 120 columns wide, wrap at 118
filetype plugin indent on

" Syntax matching
syntax on
highlight ExtraWhitespace ctermbg=darkgreen

set formatoptions=tcqlron

map <C-F> :py3f ~/bin/clang-format.py<cr>
imap <C-F> <c-o>:py3f ~/bin/clang-format.py<cr>
function! ClangFormatFile()
  let l:lines="all"
  py3f ~/bin/clang-format.py
endfunction
map <C-K> :.call ClangFormatFile()<cr>


if filereadable(".kernel")
    source ~/.vim/tab/tab.vim
else
    if filereadable(".3space")
        source ~/.vim/tab/3space.vim
    else
        if filereadable(".2space")
            source ~/.vim/tab/2space.vim
        else
            if filereadable(".garbage")
                source ~/.vim/tab/garbage.vim
            else
                source ~/.vim/tab/4space.vim
                "#autocmd BufWritePre *.h,*.cc,*.cpp call ClangFormatFile()
            endif
        endif
    endif
endif
