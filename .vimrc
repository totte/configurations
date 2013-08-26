<<<<<<< HEAD
" Pathogen settings
filetype off                    " Do this before loading Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#incubate()
call pathogen#helptags()
call pathogen#infect()

" Filetype settings
filetype on                     " Detect filetypes
filetype plugin on              " Load plugins for corresponding filetypes
filetype indent on              " Load indent files for corresponding filetypes
autocmd filetype css           set omnifunc=csscomplete#CompleteCSS
autocmd filetype html,markdown set omnifunc=htmlcomplete#CompleteTags
autocmd filetype javascript    set omnifunc=javascriptcomplete#CompleteJS
autocmd filetype xml           set omnifunc=xmlcomplete#CompleteTags
autocmd filetype python        set omnifunc=python3complete#Complete
                                " Enable python3complete.vim for Python files
                                "  since I compiled with Python 3 support and
                                "  not Python 2
syntax on                       " Enable syntax highlighting
colorscheme molokai             " Set colorscheme

" General settings
set autoindent                  " Automatically indent the new line to match previous
set autoread                    " Detect if a file has been changed outside Vim
set backspace=indent,eol,start  " Make the backspace key act like I'm used to(?)
set completeopt=menuone,longest,preview
                                " Display popup menu even if it's only one
                                "  match, longest I dunnu, preview gives extra
                                "  information in a separate window
set cursorline                  " Highlight cursor line
set encoding=utf-8              " Set UTF-8 encoding
set expandtab                   " Insert spaces instead of tab characters
set foldlevel=99                " ?
set foldmethod=indent           " ?
set history=100                 " Keep 100 lines of command line history
=======
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()
filetype on                     " Detect filetypes
filetype plugin on              " Load relevant plugins
filetype indent on              " Load indent file for filetype
autocmd! filetype python set omnifunc=pythoncomplete#Complete
syntax on                       " Enable syntax highlighting
colorscheme totte        " Set colorscheme
set autoindent                  " Automatically indent the new line to match previous
set autoread
set backspace=indent,eol,start  " Make the backspace key act like I'm used to
set clipboard=unnamed           " Copy to OS X clipboard
set completeopt=menuone,longest,preview
set cursorline                  " Highlight cursor line
set encoding=utf-8              " Set UTF-8 encoding
set expandtab                   " Insert spaces instead of tab characters
set foldlevel=99
set foldmethod=indent
>>>>>>> de70eb7941706e20b8d0864151a8fc0a371ec4d0
set hlsearch                    " Highlight search pattern
set ignorecase                  " Case insensitive search
set incsearch                   " Match while typing
set laststatus=2                " Always display statusline
<<<<<<< HEAD
set lazyredraw                  " Don't redraw screen while executing macros/mappings
set linebreak                   " ?
set list                        " Display unprintable characters (tabstops and EOLs)
set listchars=tab:▸\ ,eol:¬     " Use these symbols for tabstops and EOLs
set mouse=a                     " Enable the mouse
set nobackup                    " Don't create backup and swap files
set nocompatible                " Disable Vi-like behaviour
set nostartofline               " Keep cursor in the same column if possible
set noswapfile                  " ?
set notitle                     " Disable 'Thanks for flying Vim' message
set nowritebackup               " ?
set number                      " Display line numbers
set numberwidth=4               " Columns used for line number display
set scrolloff=999               " Number of lines to keep above and beneath cursor
"set shiftround                  " ?
set shiftwidth=4                " Number of spaces for each indent by the < > keys
set shortmess=I                 " Disable startup message
" set showcmd                    " Display incomplete commands
"set showtabline=2               " Always show tab page labels
"set smartcase                   " Ignore case when the pattern contains lowercase letters only
set softtabstop=4               " Number of spaces inserted instead of tab characters
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
                                " Make files with these suffixes have lower
                                "  priority in tab completion
set tabstop=4                   " Numbers of spaces a tab character counts for
set termencoding=utf-8          " Set terminal UTF-8 encoding
set textwidth=0                 " Disable hard linewrap
set t_Co=256                    " Set terminal colours to 256
set updatetime=1024
"set virtualedit=block           " Allow virtual editing in Visual block mode
"set whichwrap=b,s,[,],<,>,h,l   " Allow cursor to wrap between lines
set wildmode=list:longest       " ?
"set winaltkeys=no               " Allow mapping of alt (meta) key shortcuts
=======
"set lazyredraw		         " Don't redraw screen while executing macros/mappings
set listchars=tab:▸\ ,eol:¬     " Use these symbols for tabstops and EOLs
set mouse=a
set nobackup
set nocompatible                " Disable Vi-like behaviour
set nolist                      " Don't display unprintable characters
"set nostartofline	         " Keep cursor in the same column if possible
set noswapfile
set notitle                     " Disable 'Thanks for flying Vim' message
set nowritebackup
set number                      " Display line numbers
set numberwidth=4               " Columns used for line number display
"set ruler		         " Show the cursor position all the time
set scrolloff=999               " Number of lines to keep above and beneath cursor
set shiftround
set shiftwidth=4                " Number of spaces for each indent by the < > keys
set shortmess=I                 " Disable startup message
"set showcmd		         " Display incomplete commands
"set showtabline=2	         " Always show tab page labels
"set smartcase		         " Ignore case when the pattern contains lowercase letters only
set softtabstop=4               " Number of spaces inserted instead of tab characters
set tabstop=8
set termencoding=utf-8          " Set terminal UTF-8 encoding
set textwidth=0                 " Disable hard linewrap
set t_Co=256
"set virtualedit=block	         " Allow virtual editing in Visual block mode
"set whichwrap=b,s,[,],<,>,h,l   " Allow cursor to wrap between lines
set wildmode=list:longest
"set winaltkeys=no	         " Allow mapping of alt (meta) key shortcuts
>>>>>>> de70eb7941706e20b8d0864151a8fc0a371ec4d0
set wrap                        " Enable soft linewrap
set wrapmargin=0                " Number of characters from the right

" Plugins
<<<<<<< HEAD
set rtp+=/usr/lib/python3.3/site-packages/powerline/bindings/vim
let g:powerline_pycmd = 'python3'

let g:ctrlp_map = '<c-z>'

let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 4
let g:indent_guides_enable_on_vim_startup = 1

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1

=======
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 4
let g:indent_guides_enable_on_vim_startup = 1
let g:snips_author = 'totte'
let g:SuperTabDefaultCompletionType = "context"
>>>>>>> de70eb7941706e20b8d0864151a8fc0a371ec4d0
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

<<<<<<< HEAD
" Hardcore mode
=======
>>>>>>> de70eb7941706e20b8d0864151a8fc0a371ec4d0
" Unbind the cursor keys in all modes
"for prefix in ['i', 'n', 'v']
"    for key in ['<Up>', '<Down>', '<Left>', '<Right>']
"        exe prefix . "noremap " . key . " <Nop>"
"    endfor
"endfor

<<<<<<< HEAD
" Experimental fullscreen for vim-Qt
set columns=128
set fuoptions=maxvert,columns:128
let s:InFullScreenMode = 0
function ToggleFullscreen()
    if s:InFullScreenMode == 1
        exe "set nofu"
        let s:InFullScreenMode = 0
    else
        exe "set fu"
        exe "set columns=128"
        exe "set lines=128"
        let s:InFullScreenMode = 1
    endif
endfunction
command! ToggleFullscreen call ToggleFullscreen()

" My keybindings
nmap <leader>fs :ToggleFullscreen<cr>
=======
>>>>>>> de70eb7941706e20b8d0864151a8fc0a371ec4d0
nmap <leader>gw :Gwrite<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gb :Gblame<cr>
nmap <leader>hl :silent noh<cr>
nmap <leader>ig :IndentGuidesToggle<cr>
<<<<<<< HEAD
=======
nmap <leader>lb :set linebreak! list!<cr>
>>>>>>> de70eb7941706e20b8d0864151a8fc0a371ec4d0
nmap <leader>pa :Pytest file<cr>
nmap <leader>pc :Pytest class<cr>
nmap <leader>pm :Pytest method<cr>
nmap <leader>pf :Pytest function<cr>
nmap <leader>pp :Pytest previous<cr>
nmap <leader>pn :Pytest next<cr>
nmap <leader>ps :Pytest session<cr>
nmap <leader>sc :SyntasticCheck<cr>
nmap <leader>tb :TagbarToggle<cr>
nmap <leader>tl <Plug>TaskList

<<<<<<< HEAD

=======
>>>>>>> de70eb7941706e20b8d0864151a8fc0a371ec4d0
"TODO ALL BELOW THIS LINE IS OBSOLETE
"" Cursor control
"noremap <silent><c-n> <home>
"noremap <silent><c-e> <pagedown>
"noremap <silent><c-i> <pageup>
"noremap <silent><c-o> <end>
"
"" Buffer control
"noremap <c-w>c <c-w>n
"noremap <c-w>h :hide<cr>
"noremap <c-w>w :bd<cr>
"noremap <c-w>q :q<cr>
"noremap <c-w>n <c-w>h
"noremap <c-w>e <c-w>j
"noremap <c-w>i <c-w>k
"noremap <c-w>o <c-w>l
"noremap <c-left> :bprev<cr>
"noremap <c-right> :bnext<cr>
"
"" Quick fold, write and close buffer
"nnoremap zz za
"nnoremap ZZ :w<return>
"nnoremap ZQ :bd<return>
