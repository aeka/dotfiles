set nocompatible
syntax on

" IMPORTANT: mkdir ~/vimfiles/autoload, and save plug.vim

if !isdirectory($HOME . '\\vimfiles\\plugged')
    silent call mkdir($HOME . '\\vimfiles\\plugged', 'p')
endif

" initialize vim-plug
call plug#begin($HOME . '\\vimfiles\\plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
call plug#end()

filetype indent plugin on

let mapleader = ","
let maplocalleader = ","

" install fd via chocolatey
let g:ctrlp_user_command = 'fd --type f --color=never "" %s'
let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = $HOME . './.cache/ctrlp'

set autoindent
set smartindent
set backspace=indent,eol,start
set number
set ruler
set wrap
set hlsearch
set ignorecase
set smartcase
set incsearch
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

set swapfile

" create tmp, backup, undo directories
if !isdirectory($HOME . '\\vim\\.swp')
    silent call mkdir($HOME . '\\vim\\.swp', 'p')
endif
if !isdirectory($HOME . '\\vim\\.backup')
    call mkdir($HOME . '\\vim\\.backup', 'p')
endif
if !isdirectory($HOME . '\\vim\\.undo')
    call mkdir($HOME . '\\vim\\.undo', 'p')
endif

" set tmp, backup, undo file directories
set dir=$HOME\\vim\\.swp//
set backupdir=$HOME\\vim\\.backup//
set undodir=$HOME\\vim\\.undo//

" Start in full-screen
au GUIEnter * simalt ~x
