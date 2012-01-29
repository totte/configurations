set title titlestring=VIM					" Set GUI window title
set icon iconstring=''						" Set GUI window icon
set go-=l									" Remove scrollbar on the left side
set go-=L									" Remove scrollbar for realz?
set go-=r									" Remove scrollbar on the right side
set go-=R									" Remove scrollbar for realz?
set go-=T									" Remove toolbar too
set guifont=Inconsolata:h18						" Any font at less than size 16 looks bad on S2231W
set transp=8								" MacVim transparency, the lower - the more opaque
set lines=42 columns=128					" Window size
for i in range(1, 9)						" Cmd+1-9 to switch between tabs
	exec "nnoremap <D-".i."> ".i."gt" 
endfor
macm Window.Select\ Previous\ Tab  key=<D-A-Left>	" Cmd+Alt+Left to switch to previous tab
macm Window.Select\ Next\ Tab	   key=<D-A-Right>	" Cmd+Alt+Right to switch to next tab
