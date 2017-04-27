if has('mouse')
 set mouse-=a
endif

hi clear SpellBad
hi SpellBad cterm=underline

set hlsearch

set spell spelllang=en_us
filetype plugin on
filetype indent on

execute pathogen#infect()

map <C-]> :call rtags#JumpTo(g:SAME_WINDOW)<CR>
map <C-t> :call rtags#JumpBack()<CR>
