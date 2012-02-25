set title titlestring=VIM						" Set GUI window title
set iconstring=''								" Set GUI window icon
set go-=l										" Remove left scrollbar
set go-=L										" Remove scrollbar
set go-=r										" Remove right scrollbar
set go-=R										" Remove scrollbar
set go-=T										" Remove toolbar
set go-=m										" Remove menubar
set lines=42 columns=100						" Window size
if &diff										" Double the width up
	let &columns = ((&columns*2 > 172)? 172: &columns*2)
endif

" GVim
set guifont=Inconsolata\ Medium\ 14

" MacVim
if has("unix")
	let s:uname = system("uname")
	if s:uname == "Darwin"
		set guifont=Inconsolata:h18
		set fuoptions=maxvert,background:Normal
	endif
endif
