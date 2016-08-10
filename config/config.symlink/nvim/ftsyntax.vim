" -/ Filetypes/Syntax /-------------------------------------------------------
augroup ft_javascript
  au!
  au BufEnter,BufNewFile,BufRead,BufReadPost *.js set ft=javascript.jsx

  " make `gf` search for .js files
  au FileType javascript,javascript.jsx setl suffixesadd=.js
  au FileType javascript,javascript.jsx setl suffixesadd=.jsx
  au FileType javascript,javascript.jsx setl path+=js,scripts

  au BufRead,BufNewFile .{babel,eslint,stylelint,jshint}*rc,\.tern-*,*.json set ft=json
  au BufNewFile,BufRead .tern-project set ft=json

  " js-beautify
  au FileType javascript vnoremap <buffer>  <c-b> :call RangeJsBeautify()<cr>
  au FileType json vnoremap <buffer> <c-b> :call RangeJsonBeautify()<cr>
  au FileType jsx vnoremap <buffer> <c-b> :call RangeJsxBeautify()<cr>
  au FileType html vnoremap <buffer> <c-b> :call RangeHtmlBeautify()<cr>
  au FileType css vnoremap <buffer> <c-b> :call RangeCSSBeautify()<cr>

  " elm" Elm vim
  au BufWritePost *.elm :ElmMake
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
  au FileType css,css.scss,sass,scss setl formatoptions+=croql
  au BufEnter,BufNewFile,BufRead,BufReadPost *.scss set ft=sass
  au BufEnter,BufNewFile,BufRead,BufReadPost *.scss.css set ft=sass
augroup END

augroup ft_markdown
  au!
  " Markdown turn off lazyredraw
  au BufNewFile,BufRead,BufReadPost *.{md,mdwn,mkd,mkdn,mark*} set nolazyredraw ft=markdown
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

augroup ft_misc
  au!
  au FileType javascript,javascript.jsx,lisp,clojure,scheme,sass,scss RainbowParentheses

  au BufNewFile,BufRead *.conf set ft=conf

  au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
augroup END

augroup completions
  au!
  " Extreme info on omnicompletions, must read more:
  " https://github.com/davidosomething/dotfiles/blob/7fcd48209c8f116ccc4fb96beffdc315837fe876/vim/plugin/completion.vim
  au FileType * setl omnifunc=syntaxcomplete#Complete
  au FileType html,markdown setl omnifunc=htmlcomplete#CompleteTags
  au FileType css,scss,sass,less setl omnifunc=csscomplete#CompleteCSS

  au FileType coffee setl omnifunc=javascriptcomplete#CompleteJS
  au FileType javascript,javascript.jsx,jsx setl omnifunc=javascriptcomplete#CompleteJS " default
  au FileType javascript,javascript.jsx,jsx setl completefunc=jspc#omni " jspc
  au FileType javascript,javascript.jsx,jsx setl omnifunc=tern#Complete " tern
  " au FileType javascript,javascript.jsx,jsx let g:SuperTabDefaultCompletionType = "<c-x><c-o>" " supertab / tern

  au FileType python setl omnifunc=pythoncomplete#Complete
  au FileType xml setl omnifunc=xmlcomplete#CompleteTags
  au FileType ruby setl omnifunc=rubycomplete#Complete
augroup END
