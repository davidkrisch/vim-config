" No need to be compatible with vi
set nocompatible 

filetype off " required for Vundle

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
" Required for Vundle
Bundle 'gmarik/vundle' 

" My plugins

" Github Repositories
Bundle 'wincent/Command-T'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdcommenter'
Bundle 'jnwhiteh/vim-golang'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-markdown'

" vim-scripts Repositories
Bundle 'scratch.vim'
Bundle 'YankRing.vim'
Bundle 'JSON.vim'
Bundle 'snipMate'
Bundle 'Markdown'

filetype plugin indent on " required for Vundle

" Don't show the toolbar if we're using the gui
if has("gui_running")
	set guioptions=egmrt
endif

" No need to set these
" The colorscheme is inherited from the emulator colorscheme
set background=light
"colorscheme solarized

syntax enable
set relativenumber " Show line numbers relative to the cursor
set nowrap
set undofile
set scrolloff=5  " Minimim number of screen lines to keep above and below the cursor
set ttyfast      " More characters will be sent to the screen for redrawing
set laststatus=2 " Always show the status line
set encoding=utf-8 " Necessary to show Unicode glyphs
set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set mouse=a      " Enable the mouse in terminal

" Powerline Configuration
let g:Powerline_symbols='fancy'
set t_Co=256

inoremap jk <Esc>
inoremap <esc> <nop>

" Use 4 spaces
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab

" Use tabs for Go
autocmd FileType go
    \ setlocal noexpandtab

" Indenting 
set autoindent 
set smartindent

" Searching
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
" Get rid of the previous search
nnoremap <leader><space> :nohlsearch<cr>
set visualbell " Turn the auditory bell into a visual one

" Status Line
set showcmd
set ruler

" Windowing

" Split Vertically
nnoremap <leader>v <C-w>v<C-w>l
" Split Horizontally
nnoremap <leader>h <C-w>v<C-w>l
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

" Navigate between Windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Wildmenu completion
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn,.perforce         " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.pyc                            " Python byte code

" Yankring
" Don't add single character yanks/deletes to ring
let g:yankring_min_element_length = 2
nnoremap <leader>p :YRShow<cr>

" Scratch
nnoremap <leader><tab> :Sscratch<cr>

" Make it easy to edit .vimrc and source it
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Remap the arrows to no-op
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Toggle paste mode with \o
nnoremap <leader>o :set paste!<cr>

" Javascript shortcuts
"autocmd FileType javascript :iabbrev <buffer> inspect require('util').inspect(, false, 5)
au BufRead,BufNewFile *.json set filetype=json
