" ============================================================
" ============================================================
" SETUP FILE VARIABLES, VUNDLE, AND LIST PLUGINS TO BE INSTALLED
" ============================================================
" ============================================================
set nocompatible              	" be iMproved, required
filetype off                  	" required

let mapleader = ','             " Create custom alias with this guy

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" ------------------------------------------------------------
" All of your Plugins must be added between the following lines

Plugin 'gmarik/Vundle.vim' 	" let Vundle manage Vundle, required
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'acevery/snipmate-plus'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'crusoexia/vim-monokai' " color scheme for js files
Plugin 'kristijanhusak/vim-hybrid-material' "color scheme
Plugin 'pangloss/vim-javascript'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic' " syntax highlighting
Plugin 'elzr/vim-json' " syntax highlighting json

" ------------------------------------------------------------
call vundle#end()            	" required

filetype plugin indent on    	" required


" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ============================================================
" ============================================================
" GENERAL CONFIG BY DONIELLE
" ============================================================
" ============================================================
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set encoding=utf-8		          " yup
set nofoldenable		            " folding can be dangerous when collaborating
set visualbell                  " No sounds
set autoread                    " Reload files changed outside vim
set hidden			                " Allows u to hide buffer without having to write it first

" VIM WEIRD BACKUP FILE STUFF
set noswapfile
set undofile
set undodir=~/.vim/undodir

" VISUAL STUFF
" colorscheme monokai               " https://github.com/crusoexia/vim-monokai
colorscheme hybrid_material         " https://github.com/kristijanhusak/vim-hybrid-material
set number			                    " love seeing where I am in the file
set title			                      " Sets title at tope of tab to be the filename
set showmode                        " Show current mode down the bottom
syntax on			                      " um, duh
autocmd BufWritePre * :%s/\s\+$//e " Remove trailing whitespace on save

" FORMATTING
set cindent
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set iskeyword+=- 		    " Makes foo-bar considered one word
set wildignore=node_modules/*,*.jpg,*.png,*.gif,*.woff 			" Ignores stuff we're not editing
set incsearch           " Searches as you type

" Code folding
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" ------------------------------------------------------------
" GENERAL VIM CONFIG

" Fix indenting for css style things (sass, css, styl)
au BufEnter *.css set nocindent
au BufLeave *.css set cindent
au BufEnter *.scss set nocindent
au BufLeave *.scss set cindent
au BufEnter *.styl set nocindent
au BufLeave *.styl set cindent

"Sets filetpe of scss & styl to be css. Helps with plugins.
autocmd BufNewFile,BufRead *.scss set ft=scss.css
autocmd BufNewFile,BufRead *.styl set ft=styl.css

" Gives css auto completion to files using filetype=css
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" resize splits with mouse
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" ------------------------------------------------------------
" GENERAL VIM - KEYBOARD SHORTCUTS
" Enter new lines above/below w/o going into insert mode
nmap <CR> o<Esc>k

" VIM WINDOW LAYOUT AND NAVIGATION
" Jumping between split windows, instead of ctrl-w-w just do ctrl-j to jump
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Shortcut to switch between horizontal and vertical split views
nnoremap <Leader>sh <C-W>t <C-W>K
nnoremap <Leader>sv <C-W>t <C-W>H


" Copy and Paste from OSX clipboard
vmap <Leader>y y:call system("pbcopy", getreg("\""))<CR>
nmap <Leader>p :call setreg("\"",system("pbpaste"))<CR>p

" open current file in browser
nnoremap <Leader>ob :!open %<Enter>

" Auto close brackets and use control-j to escape out after done typing inside
imap <C-j> <Esc>:exec "normal f" . leavechar<CR>a
inoremap ( ()<Esc>:let leavechar=")"<CR>i
inoremap [ []<Esc>:let leavechar="]"<CR>i
inoremap { {}<Esc>:let leavechar="}"<CR>i
inoremap ' ''<Esc>:let leavechar="'"<CR>i
inoremap " ""<Esc>:let leavechar='"'<CR>i


" ------------------------------------------------------------
"  SPECIFIC PLUGINS - CONFIG AND KEYBOARD SHORTCUTS
" Ag plugin - make search start at root
let g:ag_working_path_mode="r"

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>


" Nerdtree plugin - shortcut to open/close nerdtree side panel
map <Leader> :NERDTreeToggle<CR>


" in CtrlP ignore the build folders when searching
nnoremap ff :CtrlP<CR>		" For CTRLP plugin, alias for fuzzy find
let g:ctrlp_custom_ignore = 'builds\|node_modules\'
let g:ctrlp_custom_ignore = 'dist\|node_modules\'

" Make syntastic use eslint for JSX/ES6 syntax
let g:syntastic_javascript_checkers = ['eslint']
" ------------------------------------------------------------
