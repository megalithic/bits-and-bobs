" -/ Custom Functions /--------------------------------------------
" _________________________________________________________________


" ----------------------------------------------------------------------------
" ## UTILS

" Tab wrapper
function! TabComplete() abort
  let l:col = col('.') - 1

  if pumvisible()
    return "\<C-n>"
  else
    if !l:col || getline('.')[l:col - 1] !~# '\k'
      return "\<TAB>"
    else
      return "\<C-n>"
    endif
  endif
endfunction

" Manual Tag complete
function! ManualTagComplete() abort
  if pumvisible()
    return g:deoplete#mappings#close_popup()
  else
    return g:deoplete#mappings#manual_complete('tag')
  endif
endfunction

" Manual Tag complete
" function! ExpandSnippet() abort
"   if pumvisible()
"     return g:ulti_expand_or_jump_res
"   else
"     return g:deoplete#mappings#manual_complete('tag')
"   endif
" endfunction

" Used by Fugitive
function! BufReadIndex()
  " Use j/k in status
  setlocal nohlsearch
  nnoremap <buffer> <silent> j :call search('^#\t.*','W')<Bar>.<CR>
  nnoremap <buffer> <silent> k :call search('^#\t.*','Wbe')<Bar>.<CR>
endfunction

" Used by Fugitive
function! BufEnterCommit()
  " Start in insert mode for commit
  normal gg0
  if getline('.') == ''
    start
  end

  let b:deoplete_disable_auto_complete=1
  let b:deoplete_ignore_sources = ['buffer']
  set spell
  set spelllang=en
endfunction

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
function! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunction

" prevent replacing paste buffer on paste:
" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction

" QuickScope, used in conjunction with keybinding overrides
function! Quick_scope_selective(movement)
  let needs_disabling = 0
  if !g:qs_enable
    QuickScopeToggle
    redraw
    let needs_disabling = 1
  endif

  let letter = nr2char(getchar())

  if needs_disabling
    QuickScopeToggle
  endif

  return a:movement . letter
endfunction

" Auto highlight the word under the cursor after a period of no cursor movement
function! AutoHighlightToggle()
  let @/ = ''
  augroup auto_highlight
    au!
    au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
  augroup end
  setl updatetime=1000
  echo 'Highlight current word: ON'
  return 1
endfunction
" TODO: figure out if we want to use this feature or not
" call AutoHighlightToggle()

" ---------------
" Quick spelling fix (first item in z= list)
function! QuickSpellingFix()
  if &spell
    normal 1z=
  else
    " Enable spelling mode and do the correction
    set spell
    normal 1z=
    set nospell
  endif
endfunction
command! QuickSpellingFix call QuickSpellingFix()
