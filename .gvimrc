"------------------------------------------------------------------------------
" DISABLE GUI PARTS
"------------------------------------------------------------------------------
set title titlestring=QVim  " Set GUI window title
set iconstring=''           " Set GUI window icon
set go-=l                   " Remove left scrollbar
set go-=L                   " Remove scrollbar
set go-=r                   " Remove right scrollbar
set go-=R                   " Remove scrollbar
set go-=T                   " Remove toolbar
set go-=m                   " Remove menubar
set lines=32 columns=86     " Window size

"------------------------------------------------------------------------------
" VIMDIFF
"------------------------------------------------------------------------------
if &diff                    " Double the width
        let &columns = ((&columns*2 > 172)? 172: &columns*2)
endif

"------------------------------------------------------------------------------
" FONT
"------------------------------------------------------------------------------
"set guifont=Pragmata\ TT\ 16
set guifont=Meslo\ LG\ S\ 14
"highlight LineNr font='Meslo LG S 10'
"highlight CursorLineNr font='Meslo LG S 10'
