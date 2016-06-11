" -/ Autocommands /----------------------------------------------
augroup vimrcEx
  autocmd!

  " ----------------------------------------------------------------------------
  " ## Auto-source vim config files
  " autocmd BufWritePost *.vim,*.vimrc so $MYVIMRC

  " ----------------------------------------------------------------------------
  " ## Handle window resizing
  autocmd VimResized * execute "normal! \<c-w>="

  " ----------------------------------------------------------------------------
  " ## Always put me back a the last known cursor position
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute 'normal! g`"zvzz' |
      " \   execute 'normal g`\"' |
        \ endif

  " ----------------------------------------------------------------------------
  " ## Toggle certain accoutrements when entering and leaving a buffer & window
  au BufEnter,WinEnter * set syntax=ON
  au BufEnter,WinEnter * set number relativenumber
  au BufLeave,WinLeave * set syntax=OFF
  au BufLeave,WinLeave * set nonumber norelativenumber

  " ----------------------------------------------------------------------------
  " ## Automagically update remote homeassistant files upon editing locally
  au BufWrite ~/.dotfiles/private/homeassistant/* :MirrorPush

  " ----------------------------------------------------------------------------
  " ## Toggle colorcolumn when in insert mode for visual 80char indicator
  au InsertEnter * set colorcolumn=80
  au InsertLeave * set colorcolumn=""

  " ----------------------------------------------------------------------------
  " ## Treat buffers from stdin as scratch.
  " autocmd StdinReadPost * :set buftype=nofile

  " ----------------------------------------------------------------------------
  " ## Manage GIT related scenarios
  au Filetype gitcommit setl spell textwidth=72
  au BufNewFile,BufRead .git/index setlocal nolist
  au BufReadPost fugitive://* set bufhidden=delete
  au BufReadCmd *.git/index exe BufReadIndex()
  au BufEnter *.git/index silent normal gg0j
  au BufEnter *.git/COMMIT_EDITMSG exe BufEnterCommit()

  " ----------------------------------------------------------------------------
  " ## Automagically rename tmux window to current filename
  if exists('$TMUX') && !exists('$NORENAME')
    au BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
    au VimLeave * call system('tmux set-window automatic-rename on')
  endif

  " ----------------------------------------------------------------------------
  " ## Auto-highlighting of things
  " http://vim.wikia.com/wiki/Highlight_unwanted_spaces
  au BufNewFile,BufRead,InsertLeave * silent! match ExtraWhitespace /\s\+$/
  au InsertEnter * silent! match ExtraWhitespace /\s\+\%#\@<!$/
  au BufEnter *.rb syn match error contained "\<binding.pry\>"
  au BufEnter *.rb syn match error contained "\<debugger\>"
  au BufEnter *.js syn match error contained "\<debugger\>"
  au BufEnter *.js syn match error contained "\<console.\>"
  au BufEnter *.coffee syn match error contained "\<debugger\>"
  " Delete trailing whitespace on write
  au BufWrite * silent call DeleteTrailingWS()

  " ----------------------------------------------------------------------------
  " ## Terminal
  if has('nvim')
    " Automatically go into insert mode when entering terminal window
    autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
    autocmd BufWinEnter,WinEnter term://* startinsert
  endif
augroup END
