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
set nocompatible
set noshowmode
set laststatus=2
set updatetime=100
set splitbelow
set splitright
set mouse=

filetype on
filetype plugin indent on
syntax on

set viminfo='16,<64,:32,%,n~/.cache/vim/viminfo
set wildmenu
set wildmode=noselect:lastused,full 
set wildoptions=pum,fuzzy
set complete+=i,k,d
set completeopt=menuone,noinsert,fuzzy,popup
set completepopup=height:5,width:50,highlight:InfoPopup
set completefunc+=FuzzyCompleteFunc
set autocomplete
set pumheight=10

" Key binds
let mapleader="<CR>"
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
Plug 'slint-ui/vim-slint'
Plug 'skim-rs/skim'
Plug 'imsnif/kdl.vim'

call plug#end()

" Color
colorscheme nord

" lightline
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \     'left': [
      \         [ 'mode', 'paste' ],
      \         [ 'gitbranch' ,'readonly', 'filename', 'modified' ]
      \     ],
      \     'right': [
      \         [ 'lineinfo' ], [ 'percent' ],
      \         [ 'ale_e', 'ale_w', 'ale_i', 'fileformat', 'fileencoding', 'filetype' ]
      \     ]
      \ },
      \ 'component_function': {
      \     'gitbranch': 'FugitiveHead',
      \     'ale_e': 'LA_errors',
      \     'ale_w': 'LA_warnings',
      \     'ale_i': 'LA_infos'
      \ },
      \ }

function! LA_infos() abort
  if !LA_linted()
    return ''
  endif
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.info == 0 ? '' : printf('I: %d', l:counts.info)
endfunction

function! LA_warnings() abort
  if !LA_linted()
    return ''
  endif
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_warnings = l:counts.warning + l:counts.style_warning
  return l:all_warnings == 0 ? '' : printf('W: %d', all_warnings)
endfunction

function! LA_errors() abort
  if !LA_linted()
    return ''
  endif
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  return l:all_errors == 0 ? '' : printf('E: %d', all_errors)
endfunction

function! LA_linted() abort
  return get(g:, 'ale_enabled', 0) == 1
    \ && getbufvar(bufnr(''), 'ale_enabled', 1)
    \ && getbufvar(bufnr(''), 'ale_linted', 0) > 0
    \ && ale#engine#IsCheckingBuffer(bufnr('')) == 0
endfunction

" ALE
let g:ale_enabled = 1
let g:ale_completion_enabled = 1
let g:ale_set_balloons = 1
let g:ale_completion_autoimport = 1
let g:ale_linters = {
      \ 'rust': ['analyzer'],
      \ 'c': ['clangd'],
      \ 'cpp': ['clangd'],
      \ 'lua': ['lua-language-server']
      \ }
let g:ale_c_clangd_executable = '/usr/bin/clangd'
let g:ale_cpp_clangd_executable = '/usr/bin/clangd'
let g:ale_rust_analyzer_executable = '/usr/bin/rust-analyzer'

let g:ale_sign_error = '!'
let g:ale_sign_warning = '>'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_lsp_manage_servers = 1
let g:ale_lsp_auto_start = 1

let g:ale_hover_cursor = 1
let g:ale_set_balloons = 1
let g:ale_hover_to_preview = 1
let g:ale_hover_to_floating_preview = 1
let g:ale_floating_preview = 1
let g:ale_floating_window_border = ['|','-','*','*','*','*','|','-']

set omnifunc=ale#completion#OmniFunc

autocmd CmdlineChanged [:/\?] call wildtrigger()
autocmd CmdlineEnter [/\?] set pumheight=8
autocmd CmdlineLeave [/\?] set pumheight&

augroup lightline#ale
  autocmd!
  autocmd User ALEJobStarted call lightline#update()
  autocmd User ALELintPost call lightline#update()
  autocmd User ALEFixPost call lightline#update()
augroup END

" Fuzzy Complete (Thank @deathbeam!)
let g:fuzzyfunc = &omnifunc
function! FuzzyCompleteFunc(findstart, base)
  let Func = function(get(g:, 'fuzzyfunc', &omnifunc))
  let results = Func(a:findstart, a:base)
  
  if a:findstart
    return results
  endif

  if type(results) == type({}) && has_key(results, 'words')
    let l:words = []
    for result in results.words
      call add(words, result.word . ' ' . result.menu)
    endfor
  elseif len(results)
    let l:words = results
  endif

  if len(l:words)
    let result = skim#run({ 'source': l:words, 'down': '40%', 'options': printf('--query "%s" +s', a:base) })

    if empty(result)
      return [ a:base ]
    endif

    return [ split(result[0])[0] ]
  else
    return [ a:base ]
  endif
endfunction

" Supertab
let g:SuperTabClosePreviewOnPopupClose = 1

nmap <esc><esc> :noh<return>

