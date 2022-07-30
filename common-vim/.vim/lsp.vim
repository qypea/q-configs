" lsp options
setlocal omnifunc=lsp#complete
setlocal tagfunc=lsp#tagfunc
" We get <c-]> for lsp-definition thanks to tagfunc
map <c-p> <plug>(lsp-declaration)

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_highlights_enabled = 1
let g:lsp_diagnostics_highlights_insert_mode_enabled = 0
let g:lsp_diagnostics_signs_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_semantic_enabled = 1
highlight link LspErrorHighlight Error
highlight link LspWarningHighlight Error
highlight LspInformationHighlight None
highlight LspHintHighlight None
highlight lspReference None
setlocal signcolumn=no
