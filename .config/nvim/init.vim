" Use Vim settings, rather than Vi settings (much better!).
if &compatible
  set nocompatible
endif

" Load Packager (only when needed)
function! PackagerInit() abort
  packadd vim-packager

  call packager#init()

  " Whatever it is that Dirvish does...
  call packager#add('justinmk/vim-dirvish')

  " Emmet keyboard shortcuts
  call packager#add('mattn/emmet-vim')

  " Git wrapper
  call packager#add('tpope/vim-fugitive')

  " Git diffs
  call packager#add('airblade/vim-gitgutter')

  " Status bar
  call packager#add('vim-airline/vim-airline')

  " Nord theme
  call packager#add('arcticicestudio/nord-vim', { 'as': 'nord' })

  " Add 'ends' to function definitions
  call packager#add('tpope/vim-endwise')

  " Access Database from Vim
  call packager#add('tpope/vim-dadbod')

  " Elixir Language
  call packager#add('elixir-editors/vim-elixir')

  " Language support
  call packager#add('sheerun/vim-polyglot')

  " Split vim and tmux panes with Ctrl + direction
  call packager#add('christoomey/vim-tmux-navigator')

  " Vim picker for file search
  call packager#add('srstevenson/vim-picker')

  " Vim LSP
  call packager#add('prabirshrestha/async.vim')
  call packager#add('prabirshrestha/vim-lsp')
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()

scriptencoding utf-8
set encoding=utf-8

augroup LSC
  autocmd!
  autocmd User lsp_setup call lsp#register_server({
    \ 'name': 'ElixirLS',
    \ 'cmd': {_->[$HOME.'/.local/share/applications/lsp/language_server.sh']},
    \ 'whitelist': ['elixir', 'eelixir']
  \})
augroup END

" Activate syntax highlighting
syntax enable

filetype plugin on


" Set colourscheme
colorscheme nord

" Use csscomplete function (Plug)
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci

" Highlight leex files as eex
augroup leex_ft
  au!
  autocmd BufNewFile,BufRead *.html.leex set filetype=eelixir
augroup END

" Allow vim<>system clipboard
set clipboard=unnamed

" Remap leader to spacebar
let mapleader = "\<Space>"

" Map 'save' to leader
nnoremap <Leader>w :w<CR>

" Map <Leader>, to clear search
map <Leader>, :noh<CR>

" Map 'FZF :Files' to leader
nnoremap <Leader>ff :PickerEdit<CR>
nnoremap <Leader>fs :PickerVsplit<CR>

" Use <Space> + wv/wh to create splits
nnoremap <Leader>wv :vsplit<CR>
nnoremap <Leader>wh :split<CR>

" Show invisibles (tabs and trailing spaces)
set list
set listchars=tab:»-,trail:·

" Remap <Esc> to something faster
imap jk <esc>

set number relativenumber
set splitbelow
set splitright
set showmatch
set ruler
set expandtab
set tabstop=2
set shiftwidth=2
set textwidth=80
set modifiable
