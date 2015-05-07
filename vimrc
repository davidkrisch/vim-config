" No need to be compatible with vi
set nocompatible

filetype off " required for Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Github Repositories
Plugin 'kien/ctrlp.vim'
Plugin 'mtth/scratch.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'hallison/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-surround'
Plugin 'itchyny/lightline.vim'
Plugin 'altercation/vim-colors-solarized'

" vim-scripts Repositories
Plugin 'YankRing.vim'
Plugin 'JSON.vim'
Plugin 'snipMate' " for pdb snippet

call vundle#end()
filetype plugin indent on    " required for Vundle

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
set mouse=      " Enable the mouse in terminal
set autoread     "  Reload changed files if they don't have local changes
set endofline    " Ensure the last line of the file has an EOL on it

" Solarized
set background=dark
let g:solarized_termcolors = 256
colorscheme solarized

inoremap jk <Esc>
inoremap <esc> <nop>

" Use 4 spaces
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab

autocmd BufNewFile,BufRead *.md,*.mkdn,*.markdown :set filetype=markdown

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
nnoremap <leader>h <C-w>s<C-w>l
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

" CtrlP - invoked on Ctrl-T
let g:ctrlp_map = '<leader>p'

" Yankring
" Don't add single character yanks/deletes to ring
let g:yankring_min_element_length = 2
nnoremap <leader>y :YRShow<cr>

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
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

autocmd Filetype html setlocal ts=2 sts=2 sw=2

" JSON syntax, error highlighting via JSON.vim
au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
    autocmd!
    autocmd FileType json set autoindent
    autocmd FileType json set formatoptions=tcq2l
    autocmd FileType json set textwidth=78 shiftwidth=2
    autocmd FileType json set softtabstop=2 tabstop=8
    autocmd FileType json set expandtab
    autocmd FileType json set foldmethod=syntax
augroup END
" END JSON.vim configuration

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

" Copy/Paste
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

" lightline
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'component': {
    \   'readonly': '%{&readonly?"⭤":""}',
    \ },
    \ 'separator': { 'left': '⮀', 'right': '⮂' },
    \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
    \ }
