" Vim Config

" Basic settings
set number
set incsearch
set hlsearch
set smartcase
set ignorecase
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set encoding=utf-8
set showcmd
set cursorline
set ruler

filetype on
filetype plugin indent on
syntax on

set viminfo='16,<64,:32,%,n~/.vim/viminfo
set wildmenu
set wildmode=list:longest

" Key binds
let mapleader="<CR>"
"nnoremap <Leader>
nnoremap <C-Left>  :bprevious<CR>
nnoremap <C-Right> :bnext<CR>
nnoremap <C-Up>    :bfirst<CR>
nnoremap <C-Down>  :blast<CR>

" Plugs
call plug#begin('~/.vim/plugged')

Plug 'nordtheme/vim'
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'

call plug#end()

" Color
colorscheme nord

" lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \     'left': [
      \         [ 'mode', 'paste' ],
      \         [ 'gitbranch' ,'readonly', 'filename', 'modified' ]
      \     ],
      \     'right': [
      \         [ 'lineinfo' ], [ 'percent' ],
      \         [ 'fileformat', 'fileencoding', 'filetype' ]
      \     ]
      \ }
      \ }

" ALE
let g:ale_enabled = 1
let g:ale_completion_enabled = 1
let g:ale_set_balloons = 1
let g:ale_completion_autoimport = 1
let g:ale_completion_delay = 130
let g:ale_linters = {
      \ 'rust': ['analyzer'],
      \ 'c': ['clangd'],
      \ 'cpp': ['clangd']
      \ }
let g:ale_linters_explicit = 1
let g:ale_c_clangd_executable = '/usr/bin/clangd'
let g:ale_cpp_clangd_executable = '/usr/bin/clangd'
let g:ale_rust_analyzer_executable = '/usr/bin/rust-analyzer'

let g:ale_sign_error = '!'
let g:ale_sign_warning = '>'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1

let g:ale_lsp_manage_servers = 1
let g:ale_lsp_auto_start = 1

set omnifunc=ale#completion#OmniFunc
autocmd FileType c,cpp,rust setlocal completeopt=menu,menuone,noselect
autocmd FileType c,cpp,rust inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

augroup fmt
    autocmd!
    autocmd BufWritePre *.cpp,*.cc,*.c,*.h,*.hpp silent! execute ':!clang-format -i %'
    autocmd BufWritePre *.cpp,*.cc,*.c,*.h,*.hpp silent! edit!
    ""autocmd BufWritePre *.rs silent! execute ':!rustfmt -q %'
    ""autocmd BufWritePre *.rs silent! edit!
augroup END


