"-------------------------------------------------------------------------------------
" DISABLE GUI PARTS
"-------------------------------------------------------------------------------------
set title titlestring=VIM						" Set GUI window title
set iconstring=''								" Set GUI window icon
set go-=l										" Remove left scrollbar
set go-=L										" Remove scrollbar
set go-=r										" Remove right scrollbar
set go-=R										" Remove scrollbar
set go-=T										" Remove toolbar
set go-=m										" Remove menubar
set lines=42 columns=112						" Window size

"-------------------------------------------------------------------------------------
" VIMDIFF
"-------------------------------------------------------------------------------------
if &diff										" Double the width up
	let &columns = ((&columns*2 > 172)? 172: &columns*2)
endif

"-------------------------------------------------------------------------------------
" FONT
"-------------------------------------------------------------------------------------
if has("macunix")
	" MacVim
	set guifont=Inconsolata:h18
	set fuoptions=maxvert,background:Normal
elseif has("unix")
	" GVim
	set guifont=Inconsolata\ Medium\ 14
endif
