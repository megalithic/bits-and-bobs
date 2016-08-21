" -/ Highlighting /------------------------------------------------
function! s:after_colorscheme()
  " Make spelling problems easier to read.
  hi clear SpellBad
  hi clear SpellCap
  hi clear SpellLocal
  hi clear SpellRare

  hi SpellBad cterm=underline
  hi SpellCap cterm=underline
  hi SpellLocal cterm=underline
  hi SpellRare cterm=underline

  " Make conceal look better.
  hi Conceal cterm=bold ctermbg=NONE ctermfg=67

  hi Comment cterm=italic term=italic gui=italic
  hi Search gui=underline term=underline cterm=underline ctermfg=232 ctermbg=230 guibg=#afaf87 guifg=#333333
  hi IncSearchCursor ctermfg=232 ctermbg=214 guifg=232 guibg=214
  hi Errors ctermbg=red guibg=red ctermfg=white guifg=white term=bold gui=bold
  " hi ColorColumn ctermbg=bg ctermfg=235 cterm=NONE guibg=bg guifg=#262626 gui=NONE
  " hi signColumn ctermbg=bg ctermfg=230 cterm=NONE guibg=bg guifg=#ffffd7 gui=NONE
  " hi LineNr ctermbg=bg ctermfg=137 cterm=NONE guibg=bg guifg=#af875f gui=NONE
  " hi ColorColumn ctermbg=bg ctermfg=235 cterm=NONE guibg=bg guifg=#262626 gui=NONE
  " hi signColumn ctermbg=bg ctermfg=230 cterm=NONE guibg=bg guifg=#ffffd7 gui=NONE
  " hi CursorLine ctermbg=235 ctermfg=NONE cterm=NONE guibg=#262626 guifg=NONE gui=NONE
  hi LineNr guibg=bg guifg=#665F59 gui=NONE
  hi CursorLineNr ctermbg=bg ctermfg=223 cterm=NONE guibg=bg guifg=#af875f gui=bold
  hi qfLineNr ctermbg=bg ctermfg=95 cterm=NONE guibg=bg guifg=#875f5f gui=NONE
  hi TermCursor ctermfg=red

  " ref: https://github.com/aslijiasheng/jacksonvimrc/blob/0a3421a10282bafffa1c660c40cc61b1a44671a1/vimrc/jackson/plugin.vim#L846
  hi Pmenu    gui=NONE    guifg=#c5c8c6 guibg=#373b41
  hi PmenuSel gui=reverse guifg=#c5c8c6 guibg=#373b41
  hi PmenuSbar ctermbg=255

  hi VendorPrefix guifg=#00ffff gui=bold
  match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/

  " Highlight VCS conflict markers
  match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
endfunction


augroup after_colorscheme
  au!
  call s:after_colorscheme()
  au ColorScheme * call s:after_colorscheme()
augroup END

