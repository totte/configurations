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
" SNIPMATE
"---------------------------------------------------------------------------------------------------
let g:snips_author = 'Hans Tovetjärn'

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
set nuw=6										" Columns used for line number display
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
" KEYBINDINGS
"---------------------------------------------------------------------------------------------------
" Double tap <leader> to <esc>ape into normal mode
imap <leader><leader> <esc>
" <F1> to toggle NERDtree
nmap <F1> :NERDTreeToggle<cr>
" <F2> to toggle Gundo
nmap <F2> :GundoToggle<cr>
" <F3> to view tasklist
nmap <F3> <plug>TaskList
" <F4> to run code
autocmd FileType python nmap <buffer> <F4> :!python %<cr>
" <F5-10> for pytest commands
nmap <silent><F5> <esc>:Pytest file<cr>
nmap <silent><F6> <esc>:Pytest class<cr>
nmap <silent><F7> <esc>:Pytest method<cr>
nmap <silent><F8> <esc>:Pytest next<cr>
nmap <silent><F9> <esc>:Pytest previous<cr>
nmap <silent><F10> <esc>:Pytest error<cr>
" <F11> for PEP8
let g:pep8_map='<F11>'
" <F12> for Fugitive git status
nmap <F12> :Gstatus<cr>

noremap w t
noremap W T
noremap g G
noremap G g
noremap l o
noremap L O
noremap t i
noremap T I
noremap h n
noremap H N

noremap n h
noremap e j
noremap i k
noremap o l
noremap N b
noremap E B
noremap I W
noremap O w

map <silent><c-n> <home>
map <silent><c-e> <pagedown>
map <silent><c-i> <pageup>
map <silent><c-o> <end>

imap <leader><leader> <esc>
nnoremap zz za
nnoremap ZZ :w<return>
nnoremap ZQ :q<return>

" NEWBMEWD
"unmap !
"unmap @
"unmap #
"unmap $
"unmap %
"unmap ^
"unmap &
"unmap *
"unmap (
"unmap )
"unmap _
"unmap +
"unmap `
"unmap 0
"unmap -
"unmap =
"unmap Q
"unmap W
"unmap F
"unmap G
"unmap J
"unmap L
"unmap {
"unmap }
"unmap |
"unmap q
"unmap w
"unmap f
"unmap j
"unmap l
"unmap ;
"unmap [
"unmap ]
"unmap "
"unmap '
"unmap B
"unmap M
"unmap b
"unmap k
"unmap m
"unmap ,
