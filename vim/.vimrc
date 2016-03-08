set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'nanotech/jellybeans.vim'
Plugin 'jamessan/vim-gnupg'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'godlygeek/tabular'
"Plugin 'ZoomWin'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Paste Mode On/Off
set pastetoggle=<F2>

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

set mouse=a
set laststatus=2
set updatetime=250
set hidden
set showcmd
set ttyfast
set cursorline
set autoread
filetype indent on

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

" colorscheme
set t_Co=256
color jellybeans
"color bubblegum-256-dark

let g:GPGPreferArmor=1
let g:GPGPreferSign=1

"let g:gitgutter_sign_column_always = 1

" Airline options
let g:airline_theme='bubblegum'
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
set noshowmode " Let airline handle the mode display


" incremental search
set incsearch

" syntax highlighting
"set bg=light
syntax on

" Perl autocommands
augroup filetype_perl
	" clear previous perl automcommands
	autocmd!

	" autoindent
	autocmd FileType perl set autoindent|set smartindent

	" 4 space tabs
	autocmd FileType perl set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4

	" show matching brackets
	autocmd FileType perl set showmatch

	" show line numbers
	autocmd FileType perl set number

	" check perl code with :make
	autocmd FileType perl set makeprg=perl\ -c\ %\ $*
	autocmd FileType perl set errorformat=%f:%l:%m
	autocmd FileType perl set autowrite
augroup END

" Set space to leader
let g:mapleader = "\<Space>"

" dont use Q for Ex mode
noremap Q :q

" make tab in v mode ident code
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" make tab in normal mode ident code
nnoremap <tab> I<tab><esc>
nnoremap <s-tab> ^i<bs><esc>

" toggle line numbers
nnoremap <leader>gn :set invnu<CR>:set number?<CR>
nnoremap <leader>gr :set invrnu<CR>:set rnu?<CR>

" toggle wrap
nnoremap <leader>gw :set invwrap<CR>:set wrap?<CR>

" toggle list characters
nnoremap <leader>gc :set invlist<CR>:set list?<CR>

" Bind command to toggle cursorline/cursorcolumn setting (slows scrolling speed when
" enabled).
nnoremap <leader>cul :set cursorline!<CR>
nnoremap <leader>cuc :set cursorcolumn!<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cnoremap w!! w !sudo tee > /dev/null %

" Easier buffer switching
nnoremap <F5> :buffers<CR>:buffer<Space>

" Refresh .vimrc
nnoremap <leader>rr :source ~/.vimrc<CR>
nnoremap <leader>w :w<CR>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

let NERDTreeMapActivateNode='<right>'

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>j :NERDTreeFind<CR>

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit=0
" Open most recently used files
nnoremap <leader>p :CtrlPMRUFiles<CR>
