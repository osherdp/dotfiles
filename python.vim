" ------
" python
" ------
" rope
let g:pymode_rope=0  |" disable rope

" breakpoints
let g:pymode_breakpoint=0  |" disable breakpoint plugin
nnoremap <leader>b Oimport ipdb; ipdb.set_trace()<ESC>

" syntax highlighting
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all

" other
let g:pymode_virtualenv=1  |" support virtualenv
let g:pymode_folding=0  |" don't automatically fold code

" ---------
" syntastic
" ---------
let g:syntastic_python_checkers=["python", "prospector"]

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_aggregate_errors=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_loc_list_height=4

let g:syntastic_error_symbol="✗"
let g:syntastic_warning_symbol="⚠"
let g:syntastic_style_error_symbol="✗"
let g:syntastic_style_warning_symbol="⚠"

" -----
" vimpy
" -----
let g:vimpy_prompt_resolve=1  |" when not sure, vimpy asks
nnoremap <leader>i :VimpyCheckLine<CR>  |" auto import on current line

" ----
"  YCM
" ----
let g:ycm_python_binary_path = 'python'
