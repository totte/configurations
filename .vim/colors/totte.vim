" Vim color file
" Author: Hans 'Totte' Tovetjärn 
" Contact: totte@tott.es
" Source: https://github.com/hwt/cfg
" Palette:  HEX     NUM
" --------- ------- ---
" black     #000000 008
" ...       #161616 000
" ...       #242424 010
" ...       #424242 011
" ...       #868686 012
" ...       #aaaaaa 014
" ...       #dddddd 007
" white     #ffffff 015
" sand      #e1d487 003
" brown     #b39577 009
" red       #ee3216 001
" magenta   #f85892 005 
" violet    #ac7eff 013
" blue      #4192d9 004
" cyan      #8fbfdc 006
" green     #afd240 002

hi clear
set background=dark
syntax reset
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="totte"

hi Boolean            gui=NONE      guibg=NONE    guifg=#ac7eff cterm=NONE ctermbg=NONE ctermfg=NONE
hi cDefine            gui=NONE      guibg=NONE    guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
hi Character          gui=NONE      guibg=NONE    guifg=#e1d487 cterm=NONE ctermbg=NONE ctermfg=NONE
hi cInclude           gui=NONE      guibg=NONE    guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
hi ColorColumn        gui=NONE      guibg=NONE    guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
hi Comment            gui=NONE      guibg=NONE    guifg=#868686 cterm=NONE ctermbg=NONE ctermfg=NONE
hi Conceal            gui=NONE      guibg=NONE    guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
hi Conditional        gui=NONE      guibg=NONE    guifg=#b39577 cterm=NONE ctermbg=NONE ctermfg=NONE
hi Constant           gui=NONE      guibg=NONE    guifg=#ac7eff cterm=NONE ctermbg=NONE ctermfg=NONE
hi Cursor             gui=NONE      guibg=#ffffff guifg=#161616 cterm=NONE ctermbg=NONE ctermfg=NONE
hi CursorColumn       gui=NONE      guibg=#242424 guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
hi CursorLine         gui=NONE      guibg=#242424 guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
hi Debug              gui=NONE      guibg=NONE    guifg=#868686 cterm=NONE ctermbg=NONE ctermfg=NONE
hi Define             gui=NONE      guibg=NONE    guifg=#8fbfdc cterm=NONE ctermbg=NONE ctermfg=NONE
hi Delimiter          gui=NONE      guibg=NONE    guifg=#868686 cterm=NONE ctermbg=NONE ctermfg=NONE
hi DiffAdd            gui=NONE      guibg=#afd240 guifg=#ffffff cterm=NONE ctermbg=NONE ctermfg=NONE
hi DiffChange         gui=NONE      guibg=#4192d9 guifg=#ffffff cterm=NONE ctermbg=NONE ctermfg=NONE
hi DiffDelete         gui=NONE      guibg=#ee3216 guifg=#ffffff cterm=NONE ctermbg=NONE ctermfg=NONE
hi DiffText           gui=NONE      guibg=NONE    guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
hi Directory          gui=NONE      guibg=NONE    guifg=#afd240 cterm=NONE ctermbg=NONE ctermfg=NONE
hi Error              gui=NONE      guibg=#ee3216 guifg=#ffffff cterm=NONE ctermbg=NONE ctermfg=NONE
hi ErrorMsg           gui=NONE      guibg=#ee3216 guifg=#b39577 cterm=NONE ctermbg=NONE ctermfg=NONE
hi Exception          gui=NONE      guibg=NONE    guifg=#afd240 cterm=NONE ctermbg=NONE ctermfg=NONE
hi Float              gui=NONE      guibg=NONE    guifg=#ac7eff cterm=NONE ctermbg=NONE ctermfg=NONE
hi FoldColumn         gui=NONE      guibg=#424242 guifg=#868686 cterm=NONE ctermbg=NONE ctermfg=NONE
hi Folded             gui=NONE      guibg=#424242 guifg=#868686 cterm=NONE ctermbg=NONE ctermfg=NONE
hi Function           gui=NONE      guibg=NONE    guifg=#afd240 cterm=NONE ctermbg=NONE ctermfg=NONE
hi Identifier         gui=NONE      guibg=NONE    guifg=#b39577 cterm=NONE ctermbg=NONE ctermfg=NONE
hi Ignore             gui=NONE      guibg=NONE    guifg=#868686 cterm=NONE ctermbg=NONE ctermfg=NONE
hi IncSearch          gui=NONE      guibg=#4192d9 guifg=#ffffff cterm=NONE ctermbg=NONE ctermfg=NONE
hi Keyword            gui=NONE      guibg=NONE    guifg=#b39577 cterm=NONE ctermbg=NONE ctermfg=NONE
hi Label              gui=NONE      guibg=NONE    guifg=#e1d487 cterm=NONE ctermbg=NONE ctermfg=NONE
hi LineNr             gui=NONE      guibg=NONE    guifg=#424242 cterm=NONE ctermbg=NONE ctermfg=NONE
hi Macro              gui=NONE      guibg=NONE    guifg=#e1d487 cterm=NONE ctermbg=NONE ctermfg=NONE
hi MatchParen         gui=NONE      guibg=#424242 guifg=#ffffff cterm=NONE ctermbg=NONE ctermfg=NONE
hi ModeMsg            gui=NONE      guibg=NONE    guifg=#ffffff cterm=NONE ctermbg=NONE ctermfg=NONE
hi MoreMsg            gui=NONE      guibg=NONE    guifg=#ffffff cterm=NONE ctermbg=NONE ctermfg=NONE
hi NonText            gui=NONE      guibg=NONE    guifg=#424242 cterm=NONE ctermbg=NONE ctermfg=NONE
hi Normal             gui=NONE      guibg=#161616 guifg=#ffffff cterm=NONE ctermbg=NONE ctermfg=NONE
hi Number             gui=NONE      guibg=NONE    guifg=#ac7eff cterm=NONE ctermbg=NONE ctermfg=NONE
hi Operator           gui=NONE      guibg=NONE    guifg=#b39577 cterm=NONE ctermbg=NONE ctermfg=NONE
hi Pmenu              gui=NONE      guibg=#424242 guifg=#161616 cterm=NONE ctermbg=NONE ctermfg=NONE
hi PmenuSel           gui=NONE      guibg=#424242 guifg=#868686 cterm=NONE ctermbg=NONE ctermfg=NONE
hi PmenuSbar          gui=NONE      guibg=NONE    guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
hi PmenuThumb         gui=NONE      guibg=NONE    guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
hi PreCondit          gui=NONE      guibg=NONE    guifg=#afd240 cterm=NONE ctermbg=NONE ctermfg=NONE
hi PreProc            gui=NONE      guibg=NONE    guifg=#afd240 cterm=NONE ctermbg=NONE ctermfg=NONE
hi Question           gui=NONE      guibg=NONE    guifg=#8fbfdc cterm=NONE ctermbg=NONE ctermfg=NONE
hi Repeat             gui=NONE      guibg=NONE    guifg=#b39577 cterm=NONE ctermbg=NONE ctermfg=NONE
hi Search             gui=NONE      guibg=#4192d9 guifg=#ffffff cterm=NONE ctermbg=NONE ctermfg=NONE
hi SignColumn         gui=NONE      guibg=NONE    guifg=#afd240 cterm=NONE ctermbg=NONE ctermfg=NONE
hi Special            gui=NONE      guibg=NONE    guifg=#b39577 cterm=NONE ctermbg=NONE ctermfg=NONE
hi SpecialChar        gui=NONE      guibg=NONE    guifg=#b39577 cterm=NONE ctermbg=NONE ctermfg=NONE
hi SpecialComment     gui=NONE      guibg=NONE    guifg=#868686 cterm=NONE ctermbg=NONE ctermfg=NONE
hi SpecialKey         gui=NONE      guibg=NONE    guifg=#424242 cterm=NONE ctermbg=NONE ctermfg=NONE
if has("spell")
    hi SpellBad       gui=undercurl guibg=NONE    guifg=NONE cterm=NONE ctermbg=NONE ctermfg=NONE
    hi SpellCap       gui=undercurl guibg=NONE    guifg=NONE cterm=NONE ctermbg=NONE ctermfg=NONE
    hi SpellLocal     gui=undercurl guibg=NONE    guifg=NONE cterm=NONE ctermbg=NONE ctermfg=NONE
    hi SpellRare      gui=undercurl guibg=NONE    guifg=NONE cterm=NONE ctermbg=NONE ctermfg=NONE
endif
hi Statement          gui=NONE      guibg=NONE    guifg=#b39577 cterm=NONE ctermbg=NONE ctermfg=NONE
hi StatusLine         gui=NONE      guibg=#424242 guifg=#ffffff cterm=NONE ctermbg=NONE ctermfg=NONE
hi StatusLineNC       gui=NONE      guibg=#424242 guifg=#424242 cterm=NONE ctermbg=NONE ctermfg=NONE
hi StorageClass       gui=NONE      guibg=NONE    guifg=#b39577 cterm=NONE ctermbg=NONE ctermfg=NONE
hi String             gui=NONE      guibg=NONE    guifg=#e1d487 cterm=NONE ctermbg=NONE ctermfg=NONE
hi Structure          gui=NONE      guibg=NONE    guifg=#8fbfdc cterm=NONE ctermbg=NONE ctermfg=NONE
hi Tag                gui=NONE      guibg=NONE    guifg=#b39577 cterm=NONE ctermbg=NONE ctermfg=NONE
hi TabLine            gui=NONE      guibg=NONE    guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
hi TabLineFill        gui=NONE      guibg=NONE    guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
hi TabLineSel         gui=NONE      guibg=NONE    guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
hi Title              gui=NONE      guibg=NONE    guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
hi Todo               gui=NONE      guibg=#4192d9 guifg=#ffffff cterm=NONE ctermbg=NONE ctermfg=NONE
hi Type               gui=NONE      guibg=NONE    guifg=#8fbfdc cterm=NONE ctermbg=NONE ctermfg=NONE
hi Typedef            gui=NONE      guibg=NONE    guifg=#8fbfdc cterm=NONE ctermbg=NONE ctermfg=NONE
hi Underlined         gui=underline guibg=NONE    guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
hi User1              gui=NONE      guibg=#424242 guifg=#ffffff cterm=NONE ctermbg=NONE ctermfg=NONE
hi User2              gui=NONE      guibg=#424242 guifg=#868686 cterm=NONE ctermbg=NONE ctermfg=NONE
hi User3              gui=NONE      guibg=#424242 guifg=#ee3216 cterm=NONE ctermbg=NONE ctermfg=NONE
hi User4              gui=NONE      guibg=NONE    guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
hi User5              gui=NONE      guibg=NONE    guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
hi User6              gui=NONE      guibg=NONE    guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
hi User7              gui=NONE      guibg=NONE    guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
hi User8              gui=NONE      guibg=NONE    guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
hi User9              gui=NONE      guibg=NONE    guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
hi VertSplit          gui=NONE      guibg=#424242 guifg=#424242 cterm=NONE ctermbg=NONE ctermfg=NONE
hi Visual             gui=NONE      guibg=#424242 guifg=#ffffff cterm=NONE ctermbg=NONE ctermfg=NONE
hi VisualNOS          gui=NONE      guibg=#424242 guifg=#ffffff cterm=NONE ctermbg=NONE ctermfg=NONE
hi WarningMsg         gui=NONE      guibg=#ee3216 guifg=#ffffff cterm=NONE ctermbg=NONE ctermfg=NONE
hi WildMenu           gui=NONE      guibg=NONE    guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE

" HTML
hi htmlEndTag         gui=NONE      guibg=NONE    guifg=#afd240 cterm=NONE ctermbg=NONE ctermfg=NONE
hi htmlScriptTag      gui=NONE      guibg=NONE    guifg=#afd240 cterm=NONE ctermbg=NONE ctermfg=NONE
hi htmlSpecialTagName gui=NONE      guibg=NONE    guifg=#afd240 cterm=NONE ctermbg=NONE ctermfg=NONE
hi htmlTag            gui=NONE      guibg=NONE    guifg=#afd240 cterm=NONE ctermbg=NONE ctermfg=NONE
hi htmlTagName        gui=NONE      guibg=NONE    guifg=#afd240 cterm=NONE ctermbg=NONE ctermfg=NONE

" pytest.vim
hi GreenBar           gui=NONE      guibg=#afd240 guifg=#ffffff cterm=NONE ctermbg=NONE ctermfg=NONE
hi RedBar             gui=NONE      guibg=#ee3216 guifg=#ffffff cterm=NONE ctermbg=NONE ctermfg=NONE

" indent_guides.vim
hi IndentGuidesEven   gui=NONE      guibg=#161616 guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
hi IndentGuidesOdd    gui=NONE      guibg=#242424 guifg=NONE    cterm=NONE ctermbg=NONE ctermfg=NONE
