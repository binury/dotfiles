" Basics {{{
filetype plugin indent on
syntax enable

if has("termguicolors")
 set termguicolors
endif
set encoding=utf8
" }}}
" Plugins {{{
call plug#begin('~/.vim/plugged')
  " Vim
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'itchyny/lightline.vim'
Plug 'chrisbra/sudoedit.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'machakann/vim-highlightedyank'

  " Utilize External Formatting Guidelines
Plug 'Chiel92/vim-autoformat'
Plug 'udalov/kotlin-vim'
Plug 'janko-m/vim-test'
Plug 'metakirby5/codi.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'w0rp/ale'

  " completion and snippets
Plug 'Shougo/deoplete.nvim'
Plug 'ternjs/tern_for_vim'
Plug 'carlitux/deoplete-ternjs'
Plug 'othree/jspc.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

  " Web Development
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'stephenway/postcss.vim'
Plug 'tpope/vim-haml'
Plug 'reasonml/vim-reason-loader'
Plug 'mxw/vim-jsx'

  " Languages
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

  " Zen
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

  " Need Load Last
Plug 'ryanoasis/vim-devicons'

call plug#end()
" }}}
" Plugin Settings {{{
" Use the Ocean Dark theme!
colorscheme oceandark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark

" LightLine Theme
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }
" Close NerdTree when opening file
let NERDTreeQuitOnOpen=1
" Use deoplete.
let g:deoplete#enable_at_startup = 1
" deoplete sources
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
" ternjs
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

" Goyo + Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"Add extra filetypes
let g:tern#filetypes = [
			\ 'jsx',
			\ 'javascript.jsx',
			\ 'js']
" Ctrlp
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

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
" Clipboard
" set clipboard+=unnamedplus
" Don’t add empty newlines at the end of files
set binary
set noeol
" Enable line numbers
set number
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set expandtab
set tabstop=2
set shiftwidth=2
" Interactive serach
set inccommand=split
" Show “invisible” characters
set list listchars=tab:\ \ ,trail:·,eol:¬,nbsp:_
" Enable italic highlighting
highlight Comment gui=italic
highlight Comment cterm=italic
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

" A line represents a line
set nowrap
" Start scrolling three lines before the horizontal window border
set scrolloff=6
"Scrolls the window horizontally one increment at time instead of in large chanks
set sidescroll=1

" }}}

" Custom Commands {{{
" Strip trailing whitespace
:command Strail %s/\s\+$
" Remap tab for deoplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
" deo:tern go to definition
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

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

" Toggle paste
noremap <leader>p :set paste!<CR>

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

autocmd VimEnter * if !argc() | Startify | endif
" omnicompletion for deo
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
"tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif
" }}}
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" vim: foldmethod=marker:foldlevel=0