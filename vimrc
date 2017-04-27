if has('mouse')
 set mouse-=a
endif

hi clear SpellBad
hi clear SpellCap
hi clear SpellLocal
hi clear SpellRare
hi SpellBad cterm=underline
hi SpellCap cterm=underline

set hlsearch

set spell spelllang=en_us

execute pathogen#infect()

map <C-]> :call rtags#JumpTo(g:SAME_WINDOW)<CR>
map <C-t> :call rtags#JumpBack()<CR>

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
