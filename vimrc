set nocompatible              	" be iMproved, required
filetype off                  	" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" ------------------------------------------------------------
" All of your Plugins must be added between the following lines

Plugin 'gmarik/Vundle.vim' 	" let Vundle manage Vundle, required
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'othree/html5.vim'
Plugin 'tristen/vim-sparkup'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'jelera/vim-javascript-syntax'
" Plugin 'tomtom/tlib_vim'
" Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'kchmck/vim-coffee-script'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'joestelmach/lint.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'acevery/snipmate-plus'
Plugin 'nono/vim-handlebars'
Plugin 'mklabs/grunt.vim'
Plugin 'ag.vim'

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
" GENERAL CONFIG BY DONIELLE 
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set encoding=utf-8		" yup
set nofoldenable		" folding can be dangerous when collaborating
set visualbell                  " No sounds
set autoread                    " Reload files changed outside vim
set hidden			" Allows u to hide buffer without having to write it first

" VIM WEIRD BACKUP FILE STUFF
set noswapfile
set undofile
set undodir=~/.vim/undodir

" VISUAL STUFF
set number			" love seeing where I am in the file
set title			" Sets title at tope of tab to be the filename
set showmode                    " Show current mode down the bottom
syntax on			" um, duh
autocmd BufWritePre * :%s/\s\+$//e " Remove trailing whitespace on save

" FORMATTING
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

set iskeyword+=- 		" Makes foo-bar considered one word
set wildignore=node_modules/*,*.jpg,*.png,*.gif,*.woff 			" Ignores stuff we're not editing 

" HELPFUL VIM FUNCTIONALITY
imap <leader>,m <c-x><c-o> 	" Omni completion
nmap <CR> o<Esc>k		" Enter new lines above/below w/o going into insert mode
nnoremap ff :CtrlP<CR>		" For CTRLP plugin, alias for fuzzy find
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules)$'	" Ignore node_modules in CtrlP 

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
