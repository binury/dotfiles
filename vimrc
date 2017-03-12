" Basics {{{
if &compatible
  set nocompatible               " Be iMproved
endif

filetype plugin indent on
syntax enable

if has("termguicolors")
 set termguicolors
endif

set encoding=utf8
" }}}
" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')

Plug 'mhinz/vim-startify'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'itchyny/lightline.vim'

" Utilize External Formatting Guidelines
Plug 'Chiel92/vim-autoformat'
Plug 'skammer/vim-css-color'
Plug 'scrooloose/syntastic'
" YouCompleteME is a fucking monster of Plugins and has about a dozen other plugins as dependencies
" Plug 'valloric/youcompleteme'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs'
Plug 'raimondi/delimitmate'
Plug 'janko-m/vim-test'

" Web Development
Plug 'mattn/emmet-vim/'
Plug 'pangloss/vim-javascript'

" Need Load Last
Plug 'https://github.com/ryanoasis/vim-devicons'


" Initialize plugin system
call plug#end()
" }}}
" Plugin Settings {{{

" Use the Ocean Dark theme!
colorscheme oceandark

" LightLine Theme
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }
" Close NerdTree when opening file
let NERDTreeQuitOnOpen=1
" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

"Add extra filetypes
let g:tern#filetypes = [
			\ 'jsx',
			\ 'javascript.jsx',
			\ 'js']

" }}}
" Folding {{{
set foldenable
set foldlevelstart=5
set foldnestmax=10
set foldmethod=indent   " fold based on indent level
" space open/closes folds
nnoremap <space> za
" }}}
" Appearance {{{
" Enhance command-line completion
set wildmenu


" Optimize for fast terminal connections
set ttyfast


" Don’t add empty newlines at the end of files
set binary
set noeol


" Enable line numbers
set number
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set expandtab
set tabstop=4
set shiftwidth=4
" Show “invisible” characters
set list listchars=tab:\ \ ,trail:·,eol:¬,nbsp:_
" }}}

" Usability {{{
set modeline
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
" }}}

" Custom Commands {{{
" turn off search highlight
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

autocmd VimEnter * if !argc() | Startify | NERDTreeToggle | endif

" }}}
" vim: foldmethod=marker:foldlevel=0