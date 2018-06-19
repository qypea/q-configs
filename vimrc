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

execute pathogen#infect()

if filereadable(".dwbuild")
    set makeprg=./.dwbuild
endif

let g:slimv_swank_cmd = '! screen -d -m -t REPL-SBCL sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp'
let g:paredit_mode = 0


" Lines from /etc/vim/vimrc(uncommented)
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("autocmd")
  filetype plugin indent on
endif

set csprg=gtags-cscope
cs add GTAGS

set showcmd        " Show (partial) command in status line.
set showmatch      " Show matching brackets.
set autowrite      " Automatically save before commands like :next and :make
set hidden         " Hide buffers when they are abandoned
