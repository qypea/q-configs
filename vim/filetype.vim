" My filetypes
if exists("did_load_filetypes")
   finish
endif

augroup filetypedetect
   autocmd BufNewFile,BufRead *.shlib set filetype=sh
   autocmd BufNewFile,BufRead *.json set filetype=json
   autocmd BufNewFile,BufRead Jamfile,Jamroot,*.jam set filetype=jam
   autocmd BufNewFile,BufRead *.bb,*.inc,*.conf set filetype=bitbake
   autocmd BufNewFile,BufRead *.ino set filetype=c
augroup END
