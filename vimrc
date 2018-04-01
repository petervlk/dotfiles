"""""""""""""""
" Plugins Setup
"""""""""""""""

" install plugin manager if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" install plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'elzr/vim-json'
call plug#end()

""""""""""""""""""""""
" <Leader> key binding
""""""""""""""""""""""
let mapleader=","

"""""""""""""""""""""""""""
" tabs, spaces, indentation
"""""""""""""""""""""""""""
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the same symbols as TextMate for tabstops and EOLs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set listchars=tab:▸\ ,eol:¬

""""""""""""""""""""""
" theme settings
""""""""""""""""""""""
set background=dark
colorscheme solarized

""""""""""""""""""""""
" show current command
""""""""""""""""""""""
set showcmd

""""""""""""""""
" search options
""""""""""""""""
set hlsearch

""""""""""""""""""""
" fix some Alt-key combinations
""""""""""""""""""""
set <A-j>=j
set <A-k>=k

""""""""""""""""""""
" move lines mapping
""""""""""""""""""""
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

""""""""""""""""""""
" break line
""""""""""""""""""""
:nnoremap <NL> i<CR><ESC>

""""""""""""""""""""
" switch buffers
""""""""""""""""""""
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <F11> :bp<CR>

""""""""""""""""""""
" NERDTree config
""""""""""""""""""""
" start with NERDTree on if no file is specified  
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" toggle NERDTree 
map <C-n> :NERDTreeToggle<CR>

" exit vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

