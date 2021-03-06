" syntax enable
" set number
" set ruler
" set hlsearch
" set background=dark
" colorscheme solarized
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1

set nocompatible              " be iMproved, required
filetype off                  " required

"set shell=cmd
"set shellcmdflag=/c

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" =============== Vundle Initialization ===============
" This loads all the plugins specified in $HOME/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
if !has("nvim")
	if filereadable(expand("$HOME/.vim/vundles.vim"))
		source $HOME/.vim/vundles.vim
	endif
	au BufNewFile,BufRead *.vundle set filetype=vim
endif

if has("nvim")
	source $HOME/.vim/plugs.vim
endif
" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir $HOME/.vim/backups > /dev/null 2>&1
  set undodir=$HOME/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

set wrap
set linebreak
set nolist
set showbreak=---------->\
set cpoptions+=n
set whichwrap+=<,>,h,l

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" if has('gui_running')
  nnoremap p "+p
  nnoremap P "+P
  nnoremap Y "+Y
  nnoremap y "+y
" endif

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
"set list listchars=tab:\ \ ,trail:...

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
"set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Custom Settings ========================

set encoding=utf-8

if !has("nvim")
    Plugin 'pangloss/vim-javascript'
endif

set tm=300

so $HOME/.vim/settings.vim

set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

" Clipboard copy to gVim, enable if needed
"set clipboard=unnamed
"autocmd BufWritePre * %s/\s\+$//e
