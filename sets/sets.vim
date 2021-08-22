let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

command! -nargs=0 Compile call TermWrapper(printf('g++ -std=c++11 %s', expand('%')))
command! -nargs=0 Run call TermWrapper('./a.out')
autocmd FileType cpp nnoremap <leader>fw :CompileAndRun<CR>
