" No need to be compatible with vi
set nocompatible

filetype off " required for Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Github Repositories
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'hallison/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'rust-lang/rust.vim'
Plugin 'HerringtonDarkholme/yats.vim' " TypeScript
Plugin 'dart-lang/dart-vim-plugin'

" vim-scripts Repositories
Plugin 'YankRing.vim'
Plugin 'snipMate' " for pdb snippet

call vundle#end()
filetype plugin indent on    " required for Vundle

let mapleader = "\<Space>"

" Don't show the toolbar if we're using the gui
if has("gui_running")
	set guioptions=egmrt
endif

syntax enable
set relativenumber " Show line numbers relative to the cursor
set nowrap
set undofile
set scrolloff=5  " Minimim number of screen lines to keep above and below the cursor
set ttyfast      " More characters will be sent to the screen for redrawing
set laststatus=2 " Always show the status line
set encoding=utf-8 " Necessary to show Unicode glyphs
set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set mouse=a     " Enable the mouse in terminal
set autoread     "  Reload changed files if they don't have local changes
set endofline    " Ensure the last line of the file has an EOL on it

" Solarized
set background=dark
let g:solarized_termcolors = 256
colorscheme solarized

" Use jk to go to normal mode
inoremap jk <Esc>
inoremap <esc> <nop>
" Fix paste bug triggered by the above inoremaps
set t_BE=

" Use 4 spaces
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab

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

" Disable Ex mode
map q: <Nop>
nnoremap Q <nop>

" Windowing

" Split Vertically
nnoremap <leader>v <C-w>v<C-w>l
" Split Horizontally
nnoremap <leader>h <C-w>s<C-w>l
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

" Navigate between Windows
nnoremap <C-h> <C-w>h<C-w>_
nnoremap <C-j> <C-w>j<C-w>_
nnoremap <C-k> <C-w>k<C-w>_
nnoremap <C-l> <C-w>l<C-w>_

" Wildmenu completion
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn,.perforce         " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.pyc                            " Python byte code

" Reselect visual block after indent/outdent visual
vnoremap < <gv
vnoremap > >gv

" CtrlP
let g:ctrlp_map = '<leader>p'

" Yankring
" Don't add single character yanks/deletes to ring
let g:yankring_min_element_length = 2
nnoremap <leader>y :YRShow<cr>

" Make it easy to edit .vimrc and source it
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Remap the arrows to no-op
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Toggle paste mode
nnoremap <leader>o :set paste!<cr>

" Javascript shortcuts
"autocmd FileType javascript :iabbrev <buffer> inspect require('util').inspect(, false, 5)
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype htmldjango setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype dart setlocal ts=2 sts=2 sw=2

autocmd BufNewFile,BufRead *.md,*.mkdn,*.markdown :set filetype=markdown

" JSON syntax, error highlighting via json.vim
let g:vim_json_syntax_conceal = 0

" Remove trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" Show extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" End remove trailing whitespace

" airline status line plugin
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'

" dart plugin
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/dart-vim-plugin
endif
