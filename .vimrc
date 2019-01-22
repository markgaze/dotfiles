" view settings
set noerrorbells
set number
set showmode
set showcmd
set ruler

" search settings
set incsearch
set hlsearch
set ignorecase
set smartcase

" formatting defaults
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab

" have syntax highlighting in terminals which can display colours:
if has('syntax') && (&t_Co > 2)
  syntax on
endif

" enable filetype detection:
filetype on

