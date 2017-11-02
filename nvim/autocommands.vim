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

  " No formatting on o key newlines
  autocmd BufNewFile,BufEnter * set formatoptions-=o

  " ----------------------------------------------------------------------------
  " ## Always put me back a the last known cursor position
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute 'normal! g`"zvzz' |
      " \   execute 'normal g`\"' |
        \ endif

  " ----------------------------------------------------------------------------
  " ## Toggle certain accoutrements when entering and leaving a buffer & window
  " NOTE: the syntax highlighting fails when using FZF and BufEnter
  " FIXME: we really want to still be able to flip between syntax highlighting
  " on and off.
  au WinEnter,BufEnter * silent set number relativenumber syntax=on " cul
  au WinLeave,BufLeave * silent set nonumber norelativenumber syntax=off " nocul

  " ----------------------------------------------------------------------------
  " ## Automagically update remote homeassistant files upon editing locally
  au BufWritePost ~/.dotfiles/private/homeassistant/* silent! :MirrorPush ha

  " ----------------------------------------------------------------------------
  " ## Toggle colorcolumn when in insert mode for visual 80char indicator
  au InsertEnter * set colorcolumn=80
  au InsertLeave * set colorcolumn=""
  " au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>81v.\+', -1)

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
  au BufWrite * silent if &ft!~?'markdown'|:call DeleteTrailingWS()|endif

  " ----------------------------------------------------------------------------
  " ## Terminal
  if has('nvim')
    " Automatically go into insert mode when entering terminal window
    au BufEnter * if &buftype == 'terminal' | :startinsert | endif
    au BufEnter * if &buftype == 'term' | :startinsert | endif
    au BufWinEnter,WinEnter,BufEnter term://* startinsert
  endif

  " ----------------------------------------------------------------------------
  " ## Deoplete
  " NOTE: some of these have been moved to settings.vim#deoplete and
  " keys.vim#deoplete
  " au InsertLeave,CompleteDone,CursorMovedI * if pumvisible() == 0 | pclose | endif

  " au VimEnter * call deoplete#enable_logging('DEBUG', expand('~/.config/nvim/deoplete.log'))
  " au VimEnter * call deoplete#custom#set('_', 'converters',
  "       \ ['converter_auto_paren', 'converter_remove_overlap'])
  " au VimEnter * call deoplete#custom#set('vim', 'converters',
  "       \ ['add_vim_versions'])
  " au VimEnter * call deoplete#custom#set('_', 'matchers', ['matcher_fuzzy'])
augroup END

" -/ Filetypes/Syntax /-------------------------------------------------------
augroup ft_javascript
  au!
  " au BufRead *.js set filetype=javascript
  " au BufRead *.es6 set filetype=javascript
  " au BufRead *.jsx set filetype=javascript

  au FileType javascript highlight xmlAttrib cterm=italic
  au BufRead,BufNewFile .{babel,eslint,stylelint,jshint,jscs}*rc,\.tern-*,*.json set ft=json
  au BufNewFile,BufRead .tern-project set ft=json
  au FileType javascript iabbrev class== className=
  " au BufWritePre *.js Neoformat
  au BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync

  " elm
  au BufWritePost *.elm :ElmMake
  au FileType elm nmap <buffer> <Leader>D <Plug>(elm-show-docs)
  au FileType elm nmap <buffer> <Leader>E <Plug>(elm-error-detail)
  " au FileType elm set tabstop=4 softtabstop=4 shiftwidth=4
augroup END

augroup ft_scss
  au!
  " make sure `complete` works as expected for CSS class names whithout
  " messing with motions (eg. '.foo-bar__baz') and we make sure all
  " delimiters (_,-,$,%,.) are treated as word separators outside insert mode
  au InsertEnter,BufLeave * setl iskeyword=@,48-57,192-255,\@,\$,%,-,_
  au InsertLeave,BufEnter * setl iskeyword=@,48-57,192-255

  " https://github.com/rstacruz/vimfiles/blob/master/plugin/plugins/css3-syntax.vim
  au FileType css,css.scss,sass,scss setl iskeyword+=-
  " au FileType scss set iskeyword+=-
  au FileType css,css.scss,sass,scss setl formatoptions+=croql
  au BufEnter,BufNewFile,BufRead,BufReadPost *.scss set ft=scss.css
  " au BufEnter,BufNewFile,BufRead,BufReadPost *.scss.css set ft=sass
augroup END

augroup ft_markdown
  au!
  " Markdown turn off lazyredraw
  au BufNewFile,BufRead,BufReadPost *.{md,mdwn,mkd,mkdn,mark*} set nolazyredraw ft=ghmarkdown
  au FileType markdown,text,html setlocal spell complete+=kspell
  au FileType markdown,text,html hi SpellBad guibg=#ff2929 guifg=#ffffff" ctermbg=224

  au FileType markdown set tw=80
augroup END

augroup ft_ruby
  au!
  au FileType ruby setl iskeyword+=_
augroup END

augroup ft_haml
  au!
  au BufNewFile,BufRead,BufReadPost *.html set ft=haml
augroup END

augroup ft_ssh
  au!
  au BufNewFile,BufRead */ssh/config  setf sshconfig
  au BufNewFile,BufRead ssh_config,*/.dotfiles/private/ssh/config  setf sshconfig
augroup END

augroup ft_python
  au!
  au FileType python
         \   let python_highlight_all = 1
         \ | set cc=80
         \ | highlight OverLength ctermbg=red ctermfg=white guibg=#592929
         \ | match OverLength /\%81v.\+/
         \ | map <leader>ii i import ipdb;ipdb.set_trace()<ESC>
         \ | set autoindent
         \ | set smartindent
         \ | set textwidth=79
augroup END

augroup ft_misc
  au!
  au FileType javascript,javascript.jsx,lisp,clojure,scheme,sass,scss,scss.css RainbowParentheses

  au BufNewFile,BufRead *.conf set ft=conf
  au BufNewFile,BufRead *.fish set ft=fish

  au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
augroup END

augroup completions
  au!
  " Extreme info on omnicompletions, must read more:
  " https://github.com/davidosomething/dotfiles/blob/7fcd48209c8f116ccc4fb96beffdc315837fe876/vim/plugin/completion.vim
  au FileType * setl omnifunc=syntaxcomplete#Complete
  au FileType html,markdown setl omnifunc=htmlcomplete#CompleteTags
  au FileType css,scss,sass,less,scss.css,sass.css setl omnifunc=csscomplete#CompleteCSS noci

  au FileType coffee setl omnifunc=javascriptcomplete#CompleteJS
  au FileType javascript,javascript.jsx,jsx setl omnifunc=javascriptcomplete#CompleteJS " default
  au FileType javascript,javascript.jsx,jsx setl completefunc=jspc#omni " jspc
  au FileType javascript,javascript.jsx,jsx setl omnifunc=tern#Complete " tern

  au FileType python setl omnifunc=pythoncomplete#Complete
  au FileType xml setl omnifunc=xmlcomplete#CompleteTags
  au FileType ruby setl omnifunc=rubycomplete#Complete
augroup END


" https://github.com/fortes/dotfiles/blob/master/symlinks/config/nvim/init.vim
" Don't need to automake in supported languages
augroup automake
  autocmd!
  " JavaScript and Typescript lint via language servers
  autocmd BufWritePost *.sh,*.less,*.css,*.vim,*.vimrc,*.txt,*.md make!
augroup END

augroup LanguageClientConfig
  autocmd!

  " <leader>ld to go to definition
  autocmd FileType javascript,javascript.jsx,python,typescript,json,css,less,html nnoremap <buffer> <leader>ld :call LanguageClient_textDocument_definition()<cr>
  " <leader>lf to autoformat document
  autocmd FileType javascript,javascript.jsx,python,typescript,json,css,less,html nnoremap <buffer> <leader>lf :call LanguageClient_textDocument_formatting()<cr>
  " <leader>lh for type info under cursor
  autocmd FileType javascript,javascript.jsx,python,typescript,json,css,less,html nnoremap <buffer> <leader>lh :call LanguageClient_textDocument_hover()<cr>
  " <leader>lr to rename variable under cursor
  autocmd FileType javascript,javascript.jsx,python,typescript,json,css,less,html nnoremap <buffer> <leader>lr :call LanguageClient_textDocument_rename()<cr>
  " <leader>lc to switch omnifunc to LanguageClient
  autocmd FileType javascript,javascript.jsx,python,typescript,json,css,less,html nnoremap <buffer> <leader>lc :setlocal omnifunc=LanguageClient#complete<cr>
  " <leader>ls to fuzzy find the symbols in the current document
  autocmd FileType javascript,javascript.jsx,python,typescript,json,css,less,html nnoremap <buffer> <leader>ls :call LanguageClient_textDocument_documentSymbol()<cr>

  " Use as omnifunc by default
  autocmd FileType javascript,javascript.jsx,python,typescript,json,css,less,html setlocal omnifunc=LanguageClient#complete
augroup END

let g:LanguageClient_serverCommands = {}

if executable('pyls')
  let g:LanguageClient_serverCommands.python = ['pyls']
endif

if executable('javascript-typescript-stdio')
  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
  let g:LanguageClient_serverCommands['javascript.jsx'] = ['javascript-typescript-stdio']
  let g:LanguageClient_serverCommands.typescript = ['javascript-typescript-stdio']
  let g:LanguageClient_serverCommands.html = ['html-languageserver', '--stdio']
  let g:LanguageClient_serverCommands.css = ['css-languageserver', '--stdio']
  let g:LanguageClient_serverCommands.less = ['css-languageserver', '--stdio']
  let g:LanguageClient_serverCommands.scss = ['css-languageserver', '--stdio']
  let g:LanguageClient_serverCommands.sass = ['css-languageserver', '--stdio']
  let g:LanguageClient_serverCommands.json = ['json-languageserver', '--stdio']
endif
