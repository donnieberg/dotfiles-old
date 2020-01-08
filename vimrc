" ============================================================
" ============================================================
" SETUP FILE VARIABLES, VUNDLE, AND LIST PLUGINS TO BE INSTALLED
" ============================================================
" ============================================================

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Colorscheme
Plugin 'reewr/vim-monokai-phoenix'
Plugin 'acevery/snipmate-plus'
Plugin 'scrooloose/nerdtree'
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'sjl/gundo.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'othree/html5.vim'
Plugin 'ag.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mxw/vim-jsx'
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'

call vundle#end()

" ============================================================
" Donielle Config
" ============================================================
" Create custom alias with this guy

let mapleader = ','
  

" VISUAL STUFF
set title                 " Sets the title at top of tab to be the filename if "titlestring" isn't defined
set laststatus=1          " Has to do with the status bar at the bottom. Check :help laststatus
set number                " Line numbers on the left hand side
set visualbell            " That bell is the worst sound. Shut it the fuck off.
syntax enable             " Sets syntax highlighting on because what is this notepad
filetype plugin indent on " This gets vim to automatically load filetype specific options for plugins and indentation
" hi LineNr   ctermfg=gray ctermbg=NONE
" "hi htmlTagName ctermfg=black ctermbg=NONE

" BASIC FUNCTIONALITY

set encoding=utf-8        " Duh
set history=5112          " Default is 20, I'd rather set this to infinity
set viminfo='1000,<500,:500,/500
set nofoldenable          " Don't fold shit because it's the worst.
set ignorecase smartcase
set iskeyword+=-          " Make hypenated words considered one tab stop

" Swap file stuff.
set noswapfile
set hidden
set undofile
set undodir=~/.vim/undo

" Formatting
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
"autocmd BufWritePre * :%s/\s\+$//e " Remove trailing whitespace on save

" Fix indenting for css style things (sass, css)
au BufEnter *.css set nocindent
au BufLeave *.css set cindent
au BufEnter *.scss set nocindent
au BufLeave *.scss set cindent
au BufEnter *.sass set nocindent
au BufLeave *.sass set cindent
au BufEnter *.less set nocindent
au BufLeave *.less set cindent

autocmd BufNewFile,BufRead *.scss set ft=scss.css "Sets filetype of scss to be css. Helps with plugins.
autocmd BufNewFile,BufRead *.less set ft=less.css "Sets filetype of less to be css. Helps with plugins.

" Enter newlines without entering insert mode
" http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode
nnoremap <CR> o<Esc>k

" Local list nav
nnoremap fj :execute "noautocmd vimgrep /" . expand("<cword>") . "/j **" <Bar> cnext<CR>
nnoremap cn :cn<CR>
nnoremap cp :cp<CR>
"nnoremap -- :GundoToggle<CR>

" CtrlP customizations
nnoremap ff :CtrlP<CR>
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules\|build\|dist\|lib)$'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

inoremap ;d :r !date -u <CR>
"


nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>gx :Gbrowse<CR>
nnoremap <leader>g :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>c :ccl<CR>
nnoremap <leader>o :copen<CR>
map <Esc><Esc> :w<CR>

set wildignore=node_modules/*,*.jpg,*.png,*.gif,*.woff,node_modules " See :help wildignore
autocmd FileType css set omnifunc=csscomplete#CompleteCSS           " Gives css auto completion to files using filetype=css
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" Escape/unescape & < > HTML entities in range (default current line).
function! HtmlEntities(line1, line2, action)
  let search = @/
  let range = 'silent ' . a:line1 . ',' . a:line2
  if a:action == 0  " must convert &amp; last
    execute range . 'sno/&lt;/</eg'
    execute range . 'sno/&gt;/>/eg'
    execute range . 'sno/&amp;/&/eg'
  else              " must convert & first
    execute range . 'sno/&/&amp;/eg'
    execute range . 'sno/</&lt;/eg'
    execute range . 'sno/>/&gt;/eg'
  endif
  nohl
  let @/ = search
endfunction
command! -range -nargs=1 Entities call HtmlEntities(<line1>, <line2>, <args>)
noremap <silent> \h :Entities 0<CR>
noremap <silent> \H :Entities 1<CR>

" ============================================================
" Layout & Mouse Functionality

" resize splits with mouse
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif


" VIM WINDOW LAYOUT AND NAVIGATION
" Jumping between split windows, instead of ctrl-w-w just do ctrl-j to jump
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

" Nerdtree plugin - shortcut to open/close nerdtree side panel
map <Leader> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" eslint and jsx
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint' " use local npm eslint instead of global


