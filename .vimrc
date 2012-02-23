"---------------------------------------------------------------------------------------------------
" PATHOGEN
"---------------------------------------------------------------------------------------------------
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

"---------------------------------------------------------------------------------------------------
" FILETYPE RECOGNITION
"---------------------------------------------------------------------------------------------------
filetype on										" Detect filetypes
filetype plugin on								" ...load relevant plugins
filetype plugin indent on						" ...enable loading indent file for filetype
"autocmd FileType html set ft=htmldjango			" Parse all HTML files as django-HTML

"---------------------------------------------------------------------------------------------------
" SYNTAX HIGHLIGHTING
"---------------------------------------------------------------------------------------------------
syntax on										" Enable syntax highlighting
colorscheme totte								" Set colorscheme

"---------------------------------------------------------------------------------------------------
" TAB COMPLETION
"---------------------------------------------------------------------------------------------------
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

"---------------------------------------------------------------------------------------------------
" CHMOD +X
"---------------------------------------------------------------------------------------------------
function! SetExecutableBit()
	let fname = expand("%:p")
	checktime
	execute "au FileChangedShell " . fname . " :echo"
	silent !chmod a+x %
	checktime
	execute "au! FileChangedShell " . fname
endfunction
command! Xbit call SetExecutableBit()

"---------------------------------------------------------------------------------------------------
" RELOAD CONFIGURATION FILES
"---------------------------------------------------------------------------------------------------
if !exists("*ReloadConfigs")
  function ReloadConfigs()
      :source ~/.vimrc
      if has("gui_running")
          :source ~/.gvimrc
      endif
  endfunction
  command! Recfg call ReloadConfigs()
endif

"---------------------------------------------------------------------------------------------------
" SNIPMATE
"---------------------------------------------------------------------------------------------------
let g:snips_author = 'Hans Tovetjärn'

"---------------------------------------------------------------------------------------------------
" CODE FOLDING
"---------------------------------------------------------------------------------------------------
set foldmethod=indent
set foldlevel=99

"---------------------------------------------------------------------------------------------------
" MISCELLANEOUS
"---------------------------------------------------------------------------------------------------
set nocompatible								" Disable Vi-like behaviour
"set notitle										" Disable 'Thanks for flying Vim' message
set number										" Enable line numbers
set cursorline									" Highlight cursor line
set tabstop=4									" Number of spaces a tab counts for
set autoindent									" Autoindent new lines
set shiftwidth=4								" Number of spaces used for each autoindent
set wrap										" Inserts soft line breaks for lines that reach the right margin 
set wm=4										" Right-side margin
set so=999										" Number of lines to keep above and beneath cursor
set shortmess=I									" Disable startup message
set completeopt=menuone							" Popup menu with code completion suggestion
set backspace=indent,eol,start					" Make the backspace key act like I'm used to
set encoding=utf-8								" Set UTF-8 encoding
set termencoding=utf-8							" Set terminal UTF-8 encoding
set ls=2										" Always display statusline
set nuw=6										" Columns used for line number display
set clipboard=unnamed							" Copy to OS X clipboard
set hlsearch									" Highlight search pattern
set hidden										" (LycosaExplorer suggested this)

"---------------------------------------------------------------------------------------------------
" STATUSLINE
"---------------------------------------------------------------------------------------------------
" Check if file is a help document
function! IsHelp()
	return &buftype=='help'?'':''
endfunction

" Have syntax highlight group for item under cursor displayed
function! SyntaxItem()
	return synIDattr(synID(line("."),col("."),1),"name")
endfunction

" Check with fugitive if we're in a git directory
function! IsGit()
	if !exists('b:git_dir')
    	return ''
	endif
	return 'git:'
endfunction

" Chop off '[Git(' and ')]' from the string returned by fugitive#statusline()
function! GitBranch()
	if !exists('b:git_dir')
    	return ''
	endif
	let branch = substitute(fugitive#statusline(), '.*(\(.*\)).*', '\1', 'g')
	return branch.'  '
endfunction

set statusline=\ %F
set statusline+=%2*%{&modified?'\ (modified)\ ':'\ '}
set statusline+=%2*%{IsHelp()}
set statusline+=%2*%{&readonly?'\ (read-only)\ ':'\ '}
set statusline+=%2*%{IsGit()}%1*%{GitBranch()}
set statusline+=%2*encoding:%1*%{strlen(&fenc)?&fenc:'none'}\ \ 
set statusline+=%2*format:%1*%{&ff}\ \ 
set statusline+=%2*type:%1*%{strlen(&ft)?&ft:'none'}\ \ 
"set statusline+=%2*syntax:%1*%{SyntaxItem()}
set statusline+=%1*%=
set statusline+=%2*column:%1*%c\ \ 
set statusline+=%2*line:%1*%l\ \ 
set statusline+=%2*total:%1*%L\ 

"---------------------------------------------------------------------------------------------------
" KEYBINDINGS
"---------------------------------------------------------------------------------------------------
" Toggle fullscreen mode
map <d-cr> :set invfu<cr>

" Double tap <leader> to <esc>ape into normal mode
imap <leader><leader> <esc>

" Leader stuff
nmap <leader>xb :Xbit<cr>
autocmd FileType python nmap <buffer> <leader>py27 :!python2.7 %<cr>
autocmd FileType python nmap <buffer> <leader>py32 :!python3.2 %<cr>
nmap <leader>gw :Gwrite<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gb :Gblame<cr>

" Launcher-likes
map <c-space> :LycosaFilesystemExplorer<cr>
map <c-s-space> :LycosaBufferExplorer<cr>

" Function keys
nmap <F1> :NERDTreeToggle<cr>
nmap <F2> :Gundo<cr>
nmap <F3> :Tasklist<cr>
autocmd FileType python nmap <buffer> <F4> :!python %<cr>
nmap <silent><F5> <esc>:Pytest file<cr>
nmap <silent><F6> <esc>:Pytest class<cr>
nmap <silent><F7> <esc>:Pytest method<cr>
nmap <silent><F8> <esc>:Pytest function<cr>
nmap <silent><F9> <esc>:Pytest previous<cr>
nmap <silent><F10> <esc>:Pytest next<cr>
nmap <silent><F11> <esc>:Pytest session<cr>
let g:pep8_map='<F12>'

" The normal mode remap for Colemak
nnoremap w t
nnoremap W T
nnoremap g G
nnoremap G g
nnoremap l o
nnoremap L O
nnoremap t i
nnoremap T I
nnoremap h n 
nnoremap H N
nnoremap n h
nnoremap e j
nnoremap i k
nnoremap o l
nnoremap N b
nnoremap E B
nnoremap I W
nnoremap O w

" Cursor control
noremap <silent><c-n> <home>
noremap <silent><c-e> <pagedown>
noremap <silent><c-i> <pageup>
noremap <silent><c-o> <end>

" Buffer control
noremap <c-w>c <c-w>n
noremap <c-w>h :hide<cr>
noremap <c-w>w :bd<cr>
noremap <c-w>q :q<cr>
noremap <c-w>n <c-w>h
noremap <c-w>e <c-w>j
noremap <c-w>i <c-w>k
noremap <c-w>o <c-w>l
noremap <c-w>r :Rename 
noremap <c-w>. :Recfg<cr>

noremap <c-left> :bprev<cr>
noremap <c-right> :bnext<cr>

" Quick fold, write and close buffer
nnoremap zz za
nnoremap ZZ :w<return>
nnoremap ZQ :bd<return>
