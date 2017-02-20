" -/ Custom Functions /--------------------------------------------
" _________________________________________________________________


" ----------------------------------------------------------------------------
" ## UTILS

" Rename current file or even move it to another location
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
" nnoremap <leader>r :call RenameFile()<cr>

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

" Run current file
function! RunCurrentFile() abort
  if &filetype ==? 'ruby'
    let l:command = 'ruby %'
  elseif &filetype ==? 'sh'
    let l:command = 'sh %'
  elseif &filetype ==? 'js'
    let l:command = 'node %'
  else
    echom "Can't run current file (unsupported filetype: " . &filetype . ')'
  endif

  if exists('command')
    execute ':terminal ' . l:command
  endif
endfunction
