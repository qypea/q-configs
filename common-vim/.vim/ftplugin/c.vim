source ~/.vim/code.vim
source ~/.vim/lsp-clangd.vim

" Extra keywords
syn keyword cType uint ubyte ulong uint64_t uint32_t uint16_t uint8_t boolean_t int64_t int32_t int16_t int8_t u_int64_t u_int32_t u_int16_t u_int8_t
syn keyword cOperator likely unlikely

" Comment format matching
syn match cError /\/\*[^ \t*!]/     " highlight lack of spaces in comments
" syn match cError /\/\//             " highlight cpp comments
" todo: Catch comments of the form '/* bad comment*/'

