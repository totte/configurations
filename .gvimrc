<<<<<<< HEAD
"------------------------------------------------------------------------------
" DISABLE GUI PARTS
"------------------------------------------------------------------------------
=======
"-------------------------------------------------------------------------------------
" DISABLE GUI PARTS
"-------------------------------------------------------------------------------------
>>>>>>> de70eb7941706e20b8d0864151a8fc0a371ec4d0
set title titlestring=QVim  " Set GUI window title
set iconstring=''           " Set GUI window icon
set go-=l                   " Remove left scrollbar
set go-=L                   " Remove scrollbar
set go-=r                   " Remove right scrollbar
set go-=R                   " Remove scrollbar
set go-=T                   " Remove toolbar
set go-=m                   " Remove menubar
<<<<<<< HEAD
set lines=32 columns=86     " Window size

"------------------------------------------------------------------------------
" VIMDIFF
"------------------------------------------------------------------------------
=======
set lines=42 columns=96     " Window size

"-------------------------------------------------------------------------------------
" VIMDIFF
"-------------------------------------------------------------------------------------
>>>>>>> de70eb7941706e20b8d0864151a8fc0a371ec4d0
if &diff                    " Double the width
        let &columns = ((&columns*2 > 172)? 172: &columns*2)
endif

<<<<<<< HEAD
"------------------------------------------------------------------------------
" FONT
"------------------------------------------------------------------------------
"set guifont=Pragmata\ TT\ 16
set guifont=Meslo\ LG\ S\ 14
"highlight LineNr font='Meslo LG S 10'
"highlight CursorLineNr font='Meslo LG S 10'
=======
"-------------------------------------------------------------------------------------
" FONT
"-------------------------------------------------------------------------------------
set guifont=Droid\ Sans\ Mono\ Slashed\ for\ Powerline\ 12
"highlight LineNr font='Droid Sans Mono Slashed 10'
"highlight CursorLineNr font='Droid Sans Mono Slashed 10'
let g:Powerline_symbols = 'fancy'
>>>>>>> de70eb7941706e20b8d0864151a8fc0a371ec4d0
