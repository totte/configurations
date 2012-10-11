"-------------------------------------------------------------------------------------
" PATHOGEN
"-------------------------------------------------------------------------------------
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

"-------------------------------------------------------------------------------------
" FILETYPE RECOGNITION
"-------------------------------------------------------------------------------------
filetype on                                     " Detect filetypes
filetype plugin on                              " Load relevant plugins
filetype indent on                              " Load indent file for filetype

"-------------------------------------------------------------------------------------
" SYNTAX HIGHLIGHTING
"-------------------------------------------------------------------------------------
syntax on                                       " Enable syntax highlighting
colorscheme solarized                           " Set colorscheme

"-------------------------------------------------------------------------------------
" TAB COMPLETION
"-------------------------------------------------------------------------------------
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

"-------------------------------------------------------------------------------------
" SNIPMATE
"-------------------------------------------------------------------------------------
let g:snips_author = 'totte'

"-------------------------------------------------------------------------------------
" CODE FOLDING
"-------------------------------------------------------------------------------------
set foldlevel=99
set foldmethod=indent

"-------------------------------------------------------------------------------------
" INDENTATION
"-------------------------------------------------------------------------------------
set autoindent                  " Automatically indent the new line to match previous
set expandtab                   " Insert spaces instead of tab characters
set shiftwidth=4                " Number of spaces for each indent by the < > keys
set softtabstop=4               " Number of spaces inserted instead of tab characters
set tabstop=8
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 4
let g:indent_guides_enable_on_vim_startup = 1

"-------------------------------------------------------------------------------------
" MISCELLANEOUS
"-------------------------------------------------------------------------------------
set backspace=indent,eol,start  " Make the backspace key act like I'm used to
set clipboard=unnamed           " Copy to OS X clipboard
set completeopt=menuone         " Popup menu with code completion suggestion
set cursorline                  " Highlight cursor line
set encoding=utf-8              " Set UTF-8 encoding
set hlsearch                    " Highlight search pattern
set ignorecase                  " Case insensitive search
set incsearch                   " Match while typing
set laststatus=2                " Always display statusline
set nolist                      " Don't display unprintable characters
set listchars=tab:▸\ ,eol:¬     " Use these symbols for tabstops and EOLs
set nocompatible                " Disable Vi-like behaviour
"set notitle                    " Disable 'Thanks for flying Vim' message
set number                      " Enable line numbers
set numberwidth=4               " Columns used for line number display
set scrolloff=999               " Number of lines to keep above and beneath cursor
set shortmess=I                 " Disable startup message
set termencoding=utf-8          " Set terminal UTF-8 encoding
set textwidth=0                 " Disable hard linewrap
set wrap                        " Enable soft linewrap
set wrapmargin=0                " Number of characters from the right

"-------------------------------------------------------------------------------------
" SYNTASTIC
"-------------------------------------------------------------------------------------
let g:syntastic_check_on_open=0
let g:syntastic_echo_current_error=1
let g:syntastic_enable_balloons=0
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='EE'
let g:syntastic_warning_symbol='WW'
let g:syntastic_style_error_symbol='SE'
let g:syntastic_style_warning_symbol='SW'
let g:syntastic_enable_highlighting=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=8
let g:syntastic_mode_map = { 'mode': 'passive',
                            \ 'active_filetypes': [],
                            \ 'passive_filetypes': [] }
let g:syntastic_quiet_warnings=0
let g:syntastic_python_checker='flake8'

"-------------------------------------------------------------------------------------
" STATUSLINE
"-------------------------------------------------------------------------------------
" Check if file is a help document
function! IsHelp()
        return &buftype=='help'?'':''
endfunction

" Have syntax highlight group for item under cursor displayed
function! SyntaxItem()
        return synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . " " . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")
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
set statusline+=%{&modified?'\ (modified)\ ':'\ '}
set statusline+=%{IsHelp()}
set statusline+=%{&readonly?'\ (read-only)\ ':'\ '}
set statusline+=%{IsGit()}%{GitBranch()}
set statusline+=encoding:%{strlen(&fenc)?&fenc:'none'}\ \ 
set statusline+=format:%{&ff}\ \ 
set statusline+=type:%{strlen(&ft)?&ft:'none'}\ \ 
"set statusline+=%2*syntax:%1*%{SyntaxItem()}
set statusline+=%=
set statusline+=column:%c\ \ 
set statusline+=line:%l\ \ 
set statusline+=total:%L\ 

"-------------------------------------------------------------------------------------
" CHMOD +X CURRENT FILE AND RUN IT (WITH ABSOLUTE PATH AND ESCAPING)
"-------------------------------------------------------------------------------------
function! SetExecutableBitAndRun()
    let fname = expand("%:p")
    checktime
    execute "au FileChangedShell " . fnameescape(fname) . " :echo"
    silent execute "!chmod +x " . shellescape(fname)
    checktime
    execute "au! FileChangedShell " . fnameescape(fname)
    execute "! " . shellescape(fname)
endfunction
command! XnRun call SetExecutableBitAndRun()

"-------------------------------------------------------------------------------------
" RELOAD CONFIGURATION FILES
"-------------------------------------------------------------------------------------
if !exists("*ReloadConfigs")
    function ReloadConfigs()
        :source ~/.vimrc
        if has("gui_running")
            :source ~/.gvimrc
        endif
    endfunction
    command! Recfg call ReloadConfigs()
endif

"-------------------------------------------------------------------------------------
" KEYBINDINGS
"-------------------------------------------------------------------------------------
" Toggle fullscreen mode
map <d-cr> :set invfu<cr>

" Leader stuff
nmap <leader>r :Recfg<cr>
nmap <leader>h :call HexHighlight()<cr>
nmap <leader>l :set linebreak! list!<cr>
nmap <leader>i :IndentGuidesToggle<cr>
nmap <leader>gw :Gwrite<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gb :Gblame<cr>
nmap <silent> <leader>/ :silent noh<cr>

" Function keys
nmap <F1> :NERDTreeToggle<cr>
nmap <F2> :GundoToggle<cr>
nmap <F3> <Plug>TaskList
nmap <F4> :XnRun<cr>
nmap <silent><F5> <esc>:Pytest file<cr>
nmap <silent><F6> <esc>:Pytest class<cr>
nmap <silent><F7> <esc>:Pytest method<cr>
nmap <silent><F8> <esc>:Pytest function<cr>
nmap <silent><F9> <esc>:Pytest previous<cr>
nmap <silent><F10> <esc>:Pytest next<cr>
nmap <silent><F11> <esc>:Pytest session<cr>
nmap <F12> :SyntasticCheck<cr>

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
