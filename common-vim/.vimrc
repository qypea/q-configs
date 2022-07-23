if has('mouse')
 set mouse-=a
endif

set hlsearch

set spell spelllang=en_us
highlight SpellBad None
highlight SpellCap None
highlight SpellLocal None
highlight SpellRare None
highlight SpellBad cterm=underline
highlight SpellCap cterm=underline

set wildmode=longest,list

" Plug automatic plugin script
if !filereadable(expand('~/.vim/plug.vim'))
    silent !curl -fLo ~/.vim/plug.vim
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
source ~/.vim/plug.vim
call plug#begin('~/.vim.plugged')
Plug 'prabirshrestha/vim-lsp'
Plug 'ycm-core/YouCompleteMe'
" Note to self:
" :PlugInstall to install each of these
" Youcompleteme also needs:
" cd ~/.vim.plugged/YouCompleteMe
" python3 ./install.py
call plug#end()

if filereadable(".dwbuild")
    set makeprg=./.dwbuild
endif

" Lines from /etc/vim/vimrc(uncommented)
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("autocmd")
  filetype plugin indent on
endif

set showcmd        " Show (partial) command in status line.
set showmatch      " Show matching brackets.
set autowrite      " Automatically save before commands like :next and :make
set hidden         " Hide buffers when they are abandoned

" Disable c/cpp from continuing // comments on the next line
au Filetype c,cpp setlocal comments-=:// comments+=f://
