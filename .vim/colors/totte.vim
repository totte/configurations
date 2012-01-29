" ViM color file

" Author: Hans 'Totte' Tovetjärn <hans.tovetjarn@gmail.com
" Source: https://github.com/hwt/dotfiles

" Note: This is an attempt to create a template and the
" colour settings I prefer are rather minimal. Most themes
" I found didn't include all highlighting groups and that's
" what I try to remedy here (at least the generic stuff,
" not delving deeper into programming languages).

" Palette:
" #ee3216 #ff6432 001 009 Red				Errors, Warnings, Messages
" #96ca2c #c8d686 002 010 Green				Python, django
" #89725b #e7e1b7 003 011 Brown (Yellow)	Shell, JavaScript
" #4192d9 #a5cffc 004 012 Blue				Markup, (X)HTML, CSS
" #9900ff #cc99ff 005 013 Magenta			Haskell
" #424242 #868686 006 014 Grey (Cyan)
" #dddddd #ffffff 007 015 White
" #000000 #161616 016 000 Black

" Additional colours (I've always got 256 anyway)
" #242424

set background=dark
hi clear
syntax reset
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="totte"

" User
hi User1				gui=NONE		guibg=#424242	guifg=#ffffff		cterm=NONE		ctermbg=6			ctermfg=15
hi User2				gui=NONE		guibg=#424242	guifg=#868686		cterm=NONE		ctermbg=6			ctermfg=14
hi User3				gui=NONE		guibg=#424242	guifg=#ee3216		cterm=NONE		ctermbg=6			ctermfg=1
hi User4				gui=NONE		guibg=NONE		guifg=NONE			cterm=NONE		ctermbg=NONE		ctermfg=NONE
hi User5				gui=NONE		guibg=NONE		guifg=NONE			cterm=NONE		ctermbg=NONE		ctermfg=NONE
hi User6				gui=NONE		guibg=NONE		guifg=NONE			cterm=NONE		ctermbg=NONE		ctermfg=NONE
hi User7				gui=NONE		guibg=NONE		guifg=NONE			cterm=NONE		ctermbg=NONE		ctermfg=NONE
hi User8				gui=NONE		guibg=NONE		guifg=NONE			cterm=NONE		ctermbg=NONE		ctermfg=NONE
hi User9				gui=NONE		guibg=NONE		guifg=NONE			cterm=NONE		ctermbg=NONE		ctermfg=NONE

" Generic
hi cDefine				gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi Character			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi cInclude				gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi ColorColumn			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi Comment				gui=NONE		guibg=NONE		guifg=#868686		cterm=NONE		ctermbg=NONE		ctermfg=14
hi Conceal				gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi Conditional			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi Constant				gui=NONE		guibg=NONE		guifg=#ffffff		cterm=NONE		ctermbg=NONE		ctermfg=15
hi Cursor				gui=NONE		guibg=#ffffff	guifg=#161616		cterm=NONE		ctermbg=15			ctermfg=16
hi CursorColumn			gui=NONE		guibg=#242424	guifg=NONE			cterm=NONE		ctermbg=8			ctermfg=NONE
hi CursorLine			gui=NONE		guibg=#242424	guifg=NONE			cterm=NONE		ctermbg=8			ctermfg=NONE
hi Debug				gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi Define				gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi Delimiter			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi DiffAdd				gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi DiffChange			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi DiffDelete			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi DiffText				gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi Directory			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi Error				gui=NONE		guibg=#ee3216	guifg=#ffffff		cterm=NONE		ctermbg=1			ctermfg=15
hi ErrorMsg				gui=NONE		guibg=#ee3216	guifg=#ffffff		cterm=NONE		ctermbg=1			ctermfg=15
hi Exception			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi Float				gui=NONE		guibg=NONE		guifg=#ffffff		cterm=NONE		ctermbg=NONE		ctermfg=15
hi FoldColumn			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi Folded				gui=NONE		guibg=NONE		guifg=#868686		cterm=NONE		ctermbg=NONE		ctermfg=14
hi Function				gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi GreenBar				gui=NONE		guibg=#96ca2c	guifg=#ffffff		cterm=NONE		ctermbg=2			ctermfg=15
hi Identifier			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi Ignore				gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi IncSearch			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi Keyword				gui=NONE		guibg=NONE		guifg=#a5cffc		cterm=NONE		ctermbg=NONE		ctermfg=12
hi Label				gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi LineNr				gui=NONE		guibg=NONE		guifg=#424242		cterm=NONE		ctermbg=NONE		ctermfg=6
hi Macro				gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi MatchParen			gui=NONE		guibg=#424242	guifg=#ffffff		cterm=NONE		ctermbg=6			ctermfg=15
hi ModeMsg				gui=NONE		guibg=NONE		guifg=#ffffff		cterm=NONE		ctermbg=NONE		ctermfg=15
hi MoreMsg				gui=NONE		guibg=NONE		guifg=#ff00aa		cterm=NONE		ctermbg=NONE		ctermfg=15
hi NonText				gui=NONE		guibg=NONE		guifg=#161616		cterm=NONE		ctermbg=NONE		ctermfg=0
hi Normal				gui=NONE		guibg=#161616	guifg=#ffffff		cterm=NONE		ctermbg=0			ctermfg=15
hi Number				gui=NONE		guibg=NONE		guifg=#ffffff		cterm=NONE		ctermbg=NONE		ctermfg=15
hi Operator				gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi Pmenu				gui=NONE		guibg=#424242	guifg=#161616		cterm=NONE		ctermbg=6			ctermfg=0
hi PmenuSel				gui=NONE		guibg=#424242	guifg=#868686		cterm=NONE		ctermbg=6			ctermfg=14
hi PmenuSbar			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi PmenuThumb			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi PreCondit			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi PreProc				gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi Question				gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi RedBar				gui=NONE		guibg=#ee3216	guifg=#ffffff		cterm=NONE		ctermbg=1			ctermfg=15
hi Repeat				gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi Search				gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi SignColumn			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi Special				gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi SpecialChar			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi SpecialComment		gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi SpecialKey			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
if has("spell")
    hi SpellBad			gui=NONE		guibg=#ee3216	guifg=#ffffff		cterm=NONE		ctermbg=1			ctermfg=15
    hi SpellCap			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
    hi SpellLocal		gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
    hi SpellRare		gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
endif
hi Statement			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi StatusLine			gui=NONE		guibg=#424242	guifg=#ffffff		cterm=NONE		ctermbg=6			ctermfg=15
hi StatusLineNC			gui=NONE		guibg=#424242	guifg=#424242		cterm=NONE		ctermbg=6			ctermfg=6
hi StorageClass			gui=NONE		guibg=NONE		guifg=#a5cffc		cterm=NONE		ctermbg=NONE		ctermfg=12
hi String				gui=NONE		guibg=NONE		guifg=#ffffff		cterm=NONE		ctermbg=NONE		ctermfg=15
hi Structure			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi Tag					gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi TabLine				gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi TabLineFill			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi TabLineSel			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi Title				gui=NONE		guibg=NONE		guifg=#ffffff		cterm=NONE		ctermbg=NONE		ctermfg=15
hi Todo					gui=NONE		guibg=#ff6432	guifg=#ffffff		cterm=NONE		ctermbg=9			ctermfg=15
hi Type					gui=NONE		guibg=NONE		guifg=#a5cffc		cterm=NONE		ctermbg=NONE		ctermfg=12
hi Typedef				gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi Underlined			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi VertSplit			gui=NONE		guibg=#424242	guifg=#424242		cterm=NONE		ctermbg=6			ctermfg=6
hi Visual				gui=NONE		guibg=#424242	guifg=#ffffff		cterm=NONE		ctermbg=6			ctermfg=15
hi VisualNOS			gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4
hi WarningMsg			gui=NONE		guibg=#ee3216	guifg=#ffffff		cterm=NONE		ctermbg=1			ctermfg=15
hi WildMenu				gui=NONE		guibg=NONE		guifg=#4192d9		cterm=NONE		ctermbg=NONE		ctermfg=4

" Vim
hi vimOper				gui=NONE		guibg=NONE		guifg=#ffffff		cterm=NONE		ctermbg=NONE		ctermfg=15

" Python
hi pythonStatement		gui=NONE		guibg=NONE		guifg=#c8d686		cterm=NONE		ctermbg=NONE		ctermfg=10
hi pythonInclude		gui=NONE		guibg=NONE		guifg=#c8d686		cterm=NONE		ctermbg=NONE		ctermfg=10
hi pythonFunction		gui=NONE		guibg=NONE		guifg=#96ca2c		cterm=NONE		ctermbg=NONE		ctermfg=2
hi pythonBuiltin		gui=NONE		guibg=NONE		guifg=#96ca2c		cterm=NONE		ctermbg=NONE		ctermfg=2
hi pythonEscape			gui=NONE		guibg=NONE		guifg=#c8d686		cterm=NONE		ctermbg=NONE		ctermfg=10
hi pythonException		gui=NONE		guibg=NONE		guifg=#c8d686		cterm=NONE		ctermbg=NONE		ctermfg=10
hi pythonConditional	gui=NONE		guibg=NONE		guifg=#96ca2c		cterm=NONE		ctermbg=NONE		ctermfg=2
hi pythonOperator		gui=NONE		guibg=NONE		guifg=#c8d686		cterm=NONE		ctermbg=NONE		ctermfg=10
hi pythonRepeat			gui=NONE		guibg=NONE		guifg=#96ca2c		cterm=NONE		ctermbg=NONE		ctermfg=2
hi pythonPreCondit		gui=NONE		guibg=NONE		guifg=#c8d686		cterm=NONE		ctermbg=NONE		ctermfg=10

" Django
hi djangoTagBlock		gui=NONE		guibg=NONE		guifg=#96ca2c		cterm=NONE		ctermbg=NONE		ctermfg=2
hi djangoVarBlock		gui=NONE		guibg=NONE		guifg=#96ca2c		cterm=NONE		ctermbg=NONE		ctermfg=2
hi djangoStatement		gui=NONE		guibg=NONE		guifg=#c8d686		cterm=NONE		ctermbg=NONE		ctermfg=10
hi djangoFilter			gui=NONE		guibg=NONE		guifg=#c8d686		cterm=NONE		ctermbg=NONE		ctermfg=10

" Haskell
hi hsImport				gui=NONE		guibg=NONE		guifg=#9900ff		cterm=NONE		ctermbg=NONE		ctermfg=5
hi hsImportMod			gui=NONE		guibg=NONE		guifg=#9900ff		cterm=NONE		ctermbg=NONE		ctermfg=5
hi hsStructure			gui=NONE		guibg=NONE		guifg=#9900ff		cterm=NONE		ctermbg=NONE		ctermfg=5
hi hsVarSym				gui=NONE		guibg=NONE		guifg=#cc99ff		cterm=NONE		ctermbg=NONE		ctermfg=13
hi hsImportMod			gui=NONE		guibg=NONE		guifg=#cc99ff		cterm=NONE		ctermbg=NONE		ctermfg=13

" JavaScript
hi javaScript			gui=NONE		guibg=NONE		guifg=#e7e1b7		cterm=NONE		ctermbg=NONE		ctermfg=11
hi javaScriptFunction 	gui=NONE		guibg=NONE		guifg=#89725b		cterm=NONE		ctermbg=NONE		ctermfg=3
hi javaScriptBraces 	gui=NONE		guibg=NONE		guifg=#89725b		cterm=NONE		ctermbg=NONE		ctermfg=3
hi javaScriptGlobal 	gui=NONE		guibg=NONE		guifg=#89725b		cterm=NONE		ctermbg=NONE		ctermfg=3
hi javaScriptIdentifier gui=NONE		guibg=NONE		guifg=#89725b		cterm=NONE		ctermbg=NONE		ctermfg=3
hi javaScriptMessage 	gui=NONE		guibg=NONE		guifg=#89725b		cterm=NONE		ctermbg=NONE		ctermfg=3
hi javaScriptStatement 	gui=NONE		guibg=NONE		guifg=#89725b		cterm=NONE		ctermbg=NONE		ctermfg=3
hi javaScriptMember 	gui=NONE		guibg=NONE		guifg=#89725b		cterm=NONE		ctermbg=NONE		ctermfg=3
hi javaScriptDeprecated	gui=NONE		guibg=NONE		guifg=#89725b		cterm=NONE		ctermbg=NONE		ctermfg=3
hi javaScriptException 	gui=NONE		guibg=NONE		guifg=#89725b		cterm=NONE		ctermbg=NONE		ctermfg=3
