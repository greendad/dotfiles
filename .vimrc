set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Vundle/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'jiangmiao/auto-pairs'
Plugin 'sbdchd/neoformat'

call vundle#end()
filetype plugin indent on

let g:jsx_ext_required = 0
autocmd BufWritePre *.js Neoformat

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2016 Jul 28
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set backupdir=~/.vim/backup//
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

set number				" always show line numbers
set nowrap				" dont wrap lines
set tabstop=2				" a tab is two spaces
set backspace=indent,eol,start		" allow backspacing over everything in inset mode
set autoindent
set copyindent				" copy previous indentation on autoindenting
set shiftwidth=2			" number of spaces to use for autoindenting
set shiftround				" use multiple of shiftwidth when indenting with < and >
set showmatch				" show matching paranthesis
set ignorecase				" ignore case when searching
set smartcase				" ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab				" insert tabs on the start of a line according to shiftwidth, no tabstop
set hlsearch				" highlight search terms
set incsearch				" show search matches as you typE

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif
