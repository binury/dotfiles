"let g:python_host_prog='/usr/local/bin/python'

if &compatible
  set nocompatible               " Be iMproved
endif

filetype plugin indent on
syntax enable

if has("termguicolors")
 set termguicolors
endif

set encoding=utf8

" PLUGINS
call plug#begin('~/.local/share/nvim/plugged')

Plug 'mhinz/vim-startify'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'itchyny/lightline.vim'

" Utilize External Formatting Guidelines
Plug 'Chiel92/vim-autoformat'

" Web Development
Plug 'mattn/emmet-vim/'

" Need Load Last
Plug 'https://github.com/ryanoasis/vim-devicons'


" Initialize plugin system
call plug#end()

" PLUGIN SETTINGS

" Use the Ocean Dark theme!
colorscheme oceandark

" LightLine Theme
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }
" Close NerdTree when opening file
let NERDTreeQuitOnOpen = 1

" Quit when NerdTree is last open buffer *Broken in neovim?*
" autocmd bufenter * if (winnr(“$”) == 1 && exists(“b:NERDTreeType”) && b:NERDTreeType == “primary”) | q | endif

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
" set clipboard=unnamed
" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Optimize for fast terminal connections
set ttyfast

" Change mapleader
" let mapleader=","

" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
"set backupdir=~/.vim/backups
"set directory=~/.vim/swaps
"if exists("&undodir")
"	set undodir=~/.vim/undo
"endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
" set modeline
" set modelines=4

" Enable line numbers
set number
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=4
set shiftwidth=4
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Highlight searches
" set hlsearch

" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch

" Disable error bells
set noerrorbells

" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the filename in the window titlebar
set title

" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif

" Start scrolling three lines before the horizontal window border
set scrolloff=6
"Scrolls the window horizontally one increment at time instead of in large chanks
set sidescroll=1


" Custom Commands
" Strip trailing whitespace (*ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" NerdTree
" \f toggle
nnoremap <Leader>f :NERDTreeToggle<Enter>

" Save a file as root (*W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
filetype on

" Automatic commands
if has("autocmd")
	" Enable file type detection
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" Automatic reloading of .vimrc
augroup reload_vimrc
	autocmd!
	autocmd bufwritepost .vimrc nested source %
augroup END

" PYMODE
" Automatically closes Scratch if we move the cursor ! Unknown Status !
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif

"NerdTreeAutoOpen **BROKEN**
autocmd VimEnter * if !argc() | Startify | NERDTreeToggle | endif