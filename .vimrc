"---------------------------------------------------------------------------------------------------
" PATHOGEN
"---------------------------------------------------------------------------------------------------
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

"---------------------------------------------------------------------------------------------------
" CODE FOLDING
"---------------------------------------------------------------------------------------------------
set foldmethod=indent
set foldlevel=99

"---------------------------------------------------------------------------------------------------
" SYNTAX HIGHLIGHTING
"---------------------------------------------------------------------------------------------------
syntax on										" Enable syntax highlighting
colorscheme totte								" Set colorscheme

"---------------------------------------------------------------------------------------------------
" FILETYPE RECOGNITION
"---------------------------------------------------------------------------------------------------
filetype on										" Detect filetypes
filetype plugin on								" ...load relevant plugins
filetype plugin indent on						" ...enable loading indent file for filetype
autocmd FileType html set ft=htmldjango			" Parse all HTML files as django-HTML


"---------------------------------------------------------------------------------------------------
" TAB COMPLETION
"---------------------------------------------------------------------------------------------------
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

"---------------------------------------------------------------------------------------------------
" PYFLAKES
"---------------------------------------------------------------------------------------------------
let g:pyflakes_use_quickfix = 0

"---------------------------------------------------------------------------------------------------
" MISCELLANEOUS
"---------------------------------------------------------------------------------------------------
set nocompatible								" Disable Vi-like behaviour(?)
set t_Co=256									" Gimme colourz! (Do I still need this?)
set number										" Enable line numbers
set cursorline									" Highlight cursor line
set tabstop=4									" What's this one do again?
set autoindent									" Autoindent new lines
set shiftwidth=4								" What's this one do again?
set wm=4										" Wrap margin
set so=999										" Sets scroll offset to the active line, sort of
set shortmess=I									" Disable welcome message
set completeopt=menuone							" Popup menu with code completion suggestion
set backspace=indent,eol,start					" Make the backspace key act like I'm used to
set encoding=utf-8								" Set UTF-8 encoding EVERYWHERE just to be safe
set termencoding=utf-8							" Yeah, here too, eff you Terminal.app!
set ls=2										" Always display statusline
set clipboard=unnamed							" Copy to OSX clipboard

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
"set statusline+=%2*si:%1*%{SyntaxItem()}
set statusline+=%1*%=
set statusline+=%2*column:%1*%c\ \ 
set statusline+=%2*line:%1*%l\ \ 
set statusline+=%2*total:%1*%L\ 

"---------------------------------------------------------------------------------------------------
" GUI SETTINGS
"---------------------------------------------------------------------------------------------------
"if has('gui_running')							" If run as gui...
"	set title titlestring=VIM					" Set GUI window title
"	set icon iconstring=''						" Set GUI window icon
"	set go-=l									" Remove scrollbar on the left side
"	set go-=L									" Remove scrollbar for realz?
"	set go-=r									" Remove scrollbar on the right side
"	set go-=R									" Remove scrollbar for realz?
"	set go-=T									" Remove toolbar too
"	set guifont=Inconsolata:h18					" Any font at less than size 18 looks bad on S2231W
"	set transp=0								" MacVim transparency, the lower - the more opaque
"	set lines=42 columns=132					" Window size
"endif

"---------------------------------------------------------------------------------------------------
" KEYBINDINGS
"---------------------------------------------------------------------------------------------------
" Changing leader key
let mapleader=","

" <leader>r to run code
autocmd FileType python nmap <buffer> <leader>r :!python %<cr>

" <leader>u to toggle Gundo
nmap <leader>u :GundoToggle<cr>

" <leader>d to toggle NERDtree
nmap <leader>d :NERDTreeToggle<cr>

" <leader>gx for Fugitive git commands
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gd :Gdiff<cr>

" <leader>t to view tasklist
nmap <leader>tl <plug>TaskList

" <leader>tx for pytest commands
" Execute the tests
nmap <silent><leader>tf <esc>:Pytest file<cr>
nmap <silent><leader>tc <esc>:Pytest class<cr>
nmap <silent><leader>tm <esc>:Pytest method<cr>
" cycle through test errors
nmap <silent><leader>tn <esc>:Pytest next<cr>
nmap <silent><leader>tp <esc>:Pytest previous<cr>
nmap <silent><leader>te <esc>:Pytest error<cr>

" Run django tests
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<cr>

" move between buffers with ctrl+movement keys
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
