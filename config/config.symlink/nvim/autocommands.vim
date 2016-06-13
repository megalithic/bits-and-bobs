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
  " ## Handle auto-closing of quickfix buffer
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif

  " ----------------------------------------------------------------------------
  " ## Always put me back a the last known cursor position
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute 'normal! g`"zvzz' |
      " \   execute 'normal g`\"' |
        \ endif

  " ----------------------------------------------------------------------------
  " ## Toggle certain accoutrements when entering and leaving a buffer & window
  " NOTE: the syntax highlighting fails when using FZF
  " FIXME: we really want to still be able to flip between syntax highlighting
  " on and off.
  au WinEnter,BufRead * set syntax=ON
  au BufEnter,WinEnter * set number "relativenumber
  au WinLeave * set syntax=OFF
  au BufLeave,WinLeave * set nonumber "norelativenumber

  " ----------------------------------------------------------------------------
  " ## Automagically update remote homeassistant files upon editing locally
  au BufWrite ~/.dotfiles/private/homeassistant/* :MirrorPush

  " ----------------------------------------------------------------------------
  " ## Toggle colorcolumn when in insert mode for visual 80char indicator
  au InsertEnter * set colorcolumn=80
  au InsertLeave * set colorcolumn=""

  " ----------------------------------------------------------------------------
  " ## Manage GIT related scenarios
  au Filetype gitcommit setl spell textwidth=72
  au BufNewFile,BufRead .git/index setlocal nolist
  au BufReadPost fugitive://* set bufhidden=delete
  au BufReadCmd *.git/index exe BufReadIndex()
  au BufEnter *.git/index silent normal gg0j
  au BufEnter *.git/COMMIT_EDITMSG exe BufEnterCommit()
  au Filetype gitcommit exe BufEnterCommit()

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

  " ----------------------------------------------------------------------------
  " ## Debug deoplete
  " autocmd VimEnter * call deoplete#enable_logging('DEBUG', expand('~/.config/nvim/deoplete.log'))
  " autocmd VimEnter * call deoplete#custom#set('_', 'converters',
  "       \ ['converter_auto_paren', 'converter_remove_overlap'])
  " autocmd VimEnter * call deoplete#custom#set('vim', 'converters',
  "       \ ['add_vim_versions'])
  " autocmd VimEnter * call deoplete#custom#set('_', 'matchers', ['matcher_fuzzy'])
augroup END
