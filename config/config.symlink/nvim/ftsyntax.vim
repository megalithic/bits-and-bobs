" -/ Filetypes/Syntax /-------------------------------------------------------
augroup ft_javascript
  au!
  au BufNewFile,BufRead,BufReadPost *.js set filetype=javascript.jsx
  au BufNewFile,BufRead,BufReadPost *.json set filetype=json
  au FileType javascript,javascript.jsx let b:vcm_tab_complete = 'omni'

  " make `gf` search for .js files
  au FileType javascript,javascript.jsx setlocal suffixesadd=.js
  au FileType javascript,javascript.jsx setlocal suffixesadd=.jsx
  au FileType javascript,javascript.jsx setlocal path+=js,scripts

  " Expands 'class=' to 'className='
  au FileType javascript.jsx iabbrev class== className=

  autocmd BufRead,BufNewFile .{babel,eslint,stylelint,jshint}*rc,\.tern-*,*.json set ft=json

  " js-beautify
  autocmd FileType javascript vnoremap <buffer>  <c-b> :call RangeJsBeautify()<cr>
  autocmd FileType json vnoremap <buffer> <c-b> :call RangeJsonBeautify()<cr>
  autocmd FileType jsx vnoremap <buffer> <c-b> :call RangeJsxBeautify()<cr>
  autocmd FileType html vnoremap <buffer> <c-b> :call RangeHtmlBeautify()<cr>
  autocmd FileType css vnoremap <buffer> <c-b> :call RangeCSSBeautify()<cr>
augroup END

augroup javascript_shortcuts
  " https://github.com/rstacruz/vimfiles/blob/master/plugin/z-javascript-functions.vim
  au!
  au FileType javascript call <SID>set_js_shortcuts()
augroup END

function! s:set_js_shortcuts()
  inoremap <buffer> @. this.

  imap <buffer> fn<CR> function () {<CR>
  imap <buffer> =><CR> => {<CR>
  imap <buffer> -><CR> () => {<CR>

  imap <buffer> clog( console.log(
  imap <buffer> cerr( console.error(
  imap <buffer> cer( console.error(
  imap <buffer> gebid( document.getElementById(
  imap <buffer> rcc( React.createClass(
  imap <buffer> rcc<CR> React.createClass({<CR>
endfunction

augroup ft_scss
  au!
  " make sure `complete` works as expected for CSS class names whithout
  " messing with motions (eg. '.foo-bar__baz') and we make sure all
  " delimiters (_,-,$,%,.) are treated as word separators outside insert mode
  au InsertEnter,BufLeave * setl iskeyword=@,48-57,192-255,\@,\$,%,-,_
  au InsertLeave,BufEnter * setl iskeyword=@,48-57,192-255

  " https://github.com/rstacruz/vimfiles/blob/master/plugin/plugins/css3-syntax.vim
  au FileType css,css.scss,sass,scss setlocal iskeyword+=-
  au FileType css,css.scss,sass,scss setlocal formatoptions+=croql
  au BufNewFile,BufRead,BufReadPost *.scss set filetype=sass
  au BufNewFile,BufRead,BufReadPost *.scss.css set filetype=sass
augroup END

augroup ft_markdown
  au!
  " Markdown turn off lazyredraw
  au BufNewFile,BufRead,BufReadPost *.{md,mdwn,mkd,mkdn,mark*} set nolazyredraw filetype=markdown
  au BufNewFile,BufRead,BufReadPost *.{md,mdwn,mkd,mkdn,mark*} call deoplete#disable()
  au FileType markdown set tw=80
  au FileType text,markdown let b:vcm_tab_complete = 'dict'
augroup END

augroup ft_ruby
  au!
  au FileType ruby let b:vcm_tab_complete = "tags"
  au FileType ruby setlocal iskeyword+=_
augroup END

augroup ft_haml
  au!
  au BufNewFile,BufRead,BufReadPost *.html set filetype=haml
augroup END

augroup ft_ssh
  au!
  au BufNewFile,BufRead */ssh/config  setf sshconfig
  au BufNewFile,BufRead ssh_config,*/.dotfiles/private/ssh/config  setf sshconfig
augroup END

augroup ft_misc
  au!
  autocmd FileType javascript,javascript.jsx,lisp,clojure,scheme,sass,scss RainbowParentheses

  autocmd BufNewFile,BufRead *.conf set filetype=conf

  " autocmd FileType json autocmd BufWritePre <buffer> %!python -m json.tool
  au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
augroup END

augroup completions
  au!
  " Extreme info on omnicompletions, must read more:
  " https://github.com/davidosomething/dotfiles/blob/7fcd48209c8f116ccc4fb96beffdc315837fe876/vim/plugin/completion.vim
  au FileType * setlocal omnifunc=syntaxcomplete#Complete
  au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  au FileType css,scss,sass,less setlocal omnifunc=csscomplete#CompleteCSS
  au FileType javascript,jsx,javascript.jsx setlocal omnifunc=javascriptcomplete#CompleteJS " default
  au FileType javascript,jsx,javascript.jsx setlocal omnifunc=tern#Complete " tern
  au FileType javascript,jsx,javascript.jsx setlocal completefunc=jspc#omni " jspc
  au FileType python setlocal omnifunc=pythoncomplete#Complete
  au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  au FileType ruby setlocal omnifunc=rubycomplete#Complete
augroup END
