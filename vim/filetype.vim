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
   autocmd BufNewFile,BufRead *.tpp set filetype=cpp
   autocmd BufNewFile,BufRead CMakeLists.txt set filetype=cmake
augroup END
