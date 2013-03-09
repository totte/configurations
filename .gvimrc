"-------------------------------------------------------------------------------------
" DISABLE GUI PARTS
"-------------------------------------------------------------------------------------
set title titlestring=VIM   " Set GUI window title
set iconstring=''           " Set GUI window icon
set go-=l                   " Remove left scrollbar
set go-=L                   " Remove scrollbar
set go-=r                   " Remove right scrollbar
set go-=R                   " Remove scrollbar
set go-=T                   " Remove toolbar
set go-=m                   " Remove menubar
set lines=54 columns=128    " Window size

"-------------------------------------------------------------------------------------
" VIMDIFF
"-------------------------------------------------------------------------------------
if &diff                    " Double the width
        let &columns = ((&columns*2 > 172)? 172: &columns*2)
endif

"-------------------------------------------------------------------------------------
" FONT
"-------------------------------------------------------------------------------------
set guifont=Droid\ Sans\ Mono\ Slashed\ for\ Powerline\ 12
highlight LineNr font='Droid Sans Mono Slashed for Powerline 10'
highlight CursorLineNr font='Droid Sans Mono Slashed for Powerline 10'
let g:Powerline_symbols = 'fancy'
