filetype plugin indent on
syntax on "activates syntax highlighting among other things
set autoindent "indent base on previous and syntax
set backspace=indent,eol,start "Fixes the backspace
set foldmethod=indent "fold your code.
set hidden "work with multiple unsaved buffers.
set incsearch "highlights as you search
set ignorecase
set smartcase
set relativenumber number "sets line numbers
set splitbelow splitright
set omnifunc=syntaxcomplete#Complete
set lazyredraw "redraw off for macros
set laststatus=2
set showcmd
set suffixesadd=.java
set undofile
set undodir="~/.vim/undo/"

"Key remapping
let mapleader = ","
noremap <leader>c :cd %:p:h<cr>:pwd<cr>
noremap <leader><cr> o<Esc>
noremap <space>h <C-w>h
noremap <space>j <C-w>j
noremap <space>k <C-w>k
"normap <space>l <C-w>l
noremap <down> :resize +2<Cr>
noremap <up> :resize -2<cr>
noremap <right> :vertical resize +2<CR>
noremap <left> :vertical resize -2<CR>
inoremap jk <Esc>

"Java Support! Should go in compiler/ and ftplugin/
augroup javaSu
	autocmd!
	autocmd FileType java compiler javac
	au Filetype java setlocal makeprg=javac\ %\ -g
	au Filetype java setlocal errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
	au FileType java noremap <buffer> <leader>8 :make<cr>:copen<cr>
	au FileType java noremap <buffer> <leader>9 :!echo %\|awk -F. '{print $1}'\|xargs java<cr>
augroup end

 if executable('rg')
 	set grepprg=rg\ --vimgrep
 	set grepformat^=%f:%l:%c:%m
 endif


 " Neovim and plugins
 call plug#begin('~/.vim/plugged')
" important
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets' " Snippets are separated from the engine
Plug 'puremourning/vimspector', {'for': ['java']}

" recommended
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'} "undo tree to see recent changed
Plug 'tpope/vim-commentary' "Comment stuff
Plug 'tpope/vim-repeat' "repeats
Plug 'tpope/vim-surround' "Allows me to change { to [ and what not
Plug 'ludovicchabant/vim-gutentags' "Tags Generate

" You might want to look at
Plug 'wellle/targets.vim' "adds more targets like [ or ,
Plug 'jiangmiao/auto-pairs'
Plug 'uiiaoo/java-syntax.vim' "better java syntax
call plug#end()

" neovim only
set inccommand=split "for incsearch while sub

" Gutentag
let g:gutentags_add_default_project_roots = '0'
let g:gutentags_project_root = ['package.json', '.git', 'tags']
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
let g:gutentags_generate_on_new = '1'
let g:gutentags_generate_on_missing = '1'
let g:gutentags_generate_on_write = '1'

let g:coc_global_extensions = [
	\ 'coc-java',
	\ 'coc-snippets',
	\ 'coc-java-debug',
	\ 'coc-lists'
    \ ]
