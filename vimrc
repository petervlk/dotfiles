"""""""""""""""
" Plugins Setup
"""""""""""""""
" Environment
set dictionary=/usr/share/dict/words
set directory=$XDG_CACHE_HOME/vim,~/,/tmp
set backupdir=$XDG_CACHE_HOME/vim,~/,/tmp
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
set runtimepath=$XDG_CONFIG_HOME/vim,$XDG_CACHE_HOME/vim,$VIM,$VIMRUNTIME
let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"

" install plugin manager if missing
if empty(glob('$XDG_CACHE_HOME/vim/autoload/plug.vim'))
  silent !curl -fLo $XDG_CACHE_HOME/vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" install plugins
call plug#begin('$XDG_CACHE_HOME/vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'elzr/vim-json'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
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

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

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
" copy/paste from system clipboard
""""""""""""""""""""
nnoremap <Leader>p "+p
nnoremap <Leader>c "+yy
vnoremap <Leader>c "+y

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
nnoremap <NL> i<CR><ESC>

""""""""""""""""""""
" Yanks go on clipboard instead.
""""""""""""""""""""
set clipboard+=unnamedplus 

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

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

""""""""""""""""""""
" LightLine config
""""""""""""""""""""
let g:lightline = {
  \ 'colorscheme': 'solarized',
	\   'component': {
	\     'lineinfo': ' %3l:%-2v',
	\   },
  \ }
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': ''
  \}

""""""""""""""""""""
" indentLine config
""""""""""""""""""""
let g:indentLine_setColors = 0
