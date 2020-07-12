" My filetypes
if exists("did_load_filetypes")
   finish
endif

augroup filetypedetect
   autocmd BufNewFile,BufRead Jenkinsfile set filetype=groovy
   autocmd BufNewFile,BufRead *.shlib set filetype=sh
   autocmd BufNewFile,BufRead *.json set filetype=json
   autocmd BufNewFile,BufRead Jamfile,Jamroot,*.jam set filetype=jam
   autocmd BufNewFile,BufRead *.bb,*.inc,*.conf set filetype=bitbake
   autocmd BufNewFile,BufRead *.ino set filetype=c
   autocmd BufNewFile,BufRead *.tpp set filetype=cpp
   autocmd BufNewFile,BufRead CMakeLists.txt set filetype=cmake
   autocmd BufEnter COMMIT_EDITMSG set filetype=gitcommit
   autocmd BufEnter TAG_EDITMSG set filetype=gitcommit
   autocmd BufEnter git-rebase-todo call setpos('.', [0, 1, 1, 0])
augroup END
