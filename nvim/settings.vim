" -/ Plugin Settings /----------------------------------------------

" ## handy function to find project root based on given file
function! s:findProjectRoot(lookFor)
  let pathMaker='%:p'
  while(len(expand(pathMaker)) > len(expand(pathMaker.':h')))
    let pathMaker=pathMaker.':h'
    let fileToCheck=expand(pathMaker).'/'.a:lookFor
    if filereadable(fileToCheck)||isdirectory(fileToCheck)
      return expand(pathMaker)
    endif
  endwhile
  return 0
endfunction


" ----------------------------------------------------------------------------
" ## golden-ratio
let g:golden_ratio_exclude_nonmodifiable = 1
let g:golden_ratio_wrap_ignored = 0
let g:golden_ratio_ignore_horizontal_splits = 1


" ----------------------------------------------------------------------------
" ## codi.vim
let g:codi#rightalign = 0
let g:codi#aliases = {
      \ 'javascript.jsx': 'javascript',
      \ }


" ----------------------------------------------------------------------------
" ## auto-pairs
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsMapCR = 0 " https://www.reddit.com/r/neovim/comments/4st4i6/making_ultisnips_and_deoplete_work_together_nicely/d6m73rh/


" ----------------------------------------------------------------------------
" ## ale
let g:ale_javascript_eslint_executable = 'standard'
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '-'
" Don't lint on insert/exit/text
let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0


" ----------------------------------------------------------------------------
" ## neomake
" -- Settings derived from / see this link, also, for custom makers:
" -- https://github.com/rstacruz/vimfiles/blob/master/plugin/plugins/neomake.vim
let g:neomake_serialize = 1
let g:neomake_verbose = 1
let g:neomake_open_list = 0
let g:neomake_logfile='/tmp/neomake_error.log' " display errors / write in logs
let g:neomake_highlight_lines = 0
let g:neomake_highlight_columns = 0
" texthl options: NeomakeErrorMsg, DiffDelete, Todo, NeomakeWarningMsg, Error, ErrorMsg, WarningMsg
let g:neomake_error_sign = {
            \ 'text': '✖',
            \ 'texthl': 'ErrorMsg'
            \ }
let g:neomake_warning_sign = {
            \ 'text': '⚠',
            \ 'texthl': 'WarningMsg'
            \ }

" let g:neomake_scss_enabled_makers = ['scss-lint']
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']

function s:packageRoot()
  return <SID>findProjectRoot('package.json')
endfunction

function! s:getHigherStandardBin()
  return expand(<SID>packageRoot()).'/node_modules/.bin/higher-standard'
endfunction

function! s:getEslintrc()
  return expand(<SID>packageRoot()).'/.eslintrc.json'
endfunction

" function! s:eslint()
"   let g:neomake_javascript_enabled_makers = ['eslint']
"   let g:neomake_javascript_eslint_maker = {
"         \   'exe': expand(<SID>packageRoot()).'/node_modules/.bin/eslint',
"         \   'args': ['-f', 'compact'],
"         \   'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
"         \   '%W%f: line %l\, col %c\, Warning - %m'
"         \ }
"   let g:neomake_jsx_enabled_makers = ['eslint']
"   let g:neomake_jsx_eslint_maker =
"         \ g:neomake_javascript_eslint_maker
" endfunction

function! s:standard()
  let g:neomake_javascript_enabled_makers = ['standard']
  let g:neomake_javascript_standard_maker = {
        \ 'args': ['-f', 'compact', '--parser', 'babel-eslint', '-v'],
        \ 'errorformat': '  %f:%l:%c: %m'
        \ }
  let g:neomake_jsx_enabled_makers = ['standard']
  let g:neomake_jsx_standard_maker =
        \ g:neomake_javascript_standard_maker
endfunction

" function! s:higherstandard()
"   let g:neomake_javascript_enabled_makers = ['higherstandard']
"   let g:neomake_javascript_higherstandard_maker = {
"         \ 'exe': <SID>getHigherStandardBin(),
"         \ 'args': ['-f', 'compact', '--parser', 'babel-eslint', '-v'],
"         \ 'errorformat': '  %f:%l:%c: %m'
"         \ }
"   let g:neomake_jsx_enabled_makers = ['higherstandard']
"   let g:neomake_jsx_higherstandard_maker =
"         \ g:neomake_javascript_higherstandard_maker
" endfunction

" if findfile(<SID>getEslintrc(), '.;') ==# ''
"   " no eslintrc found, so it's either higher-standard or standard
"   if findfile(<SID>getHigherStandardBin(), '.;') ==# ''
"     " no higher-standard found, so we use standard
"     call <SID>standard()
"   else
"     " found higher-standard, so we use it
"     call <SID>higherstandard()
"   endif
" else
"   " found eslintrc, so we use eslint
"   call <SID>eslint()
" endif

" do the lintings!
" au! BufEnter * nested Neomake
" au! BufWritePost * nested Neomake


" ----------------------------------------------------------------------------
" ## vim-airline
let g:airline#extensions#neomake#enabled = 1
let g:airline_theme = 'base16_ocean'
" let g:airline#extensions#tabline#left_alt_sep = '░'
" let g:airline_left_sep = '█▓░'
" let g:airline_right_sep = '░▓█'
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#cm_call_signature#enabled = 1
if exists('g:airline_extensions')
  let g:airline_extensions = add(g:airline_extensions, 'cm_call_signature')
endif


" ----------------------------------------------------------------------------
" ## vim-better-javascript-completion
let g:vimjs#casesensistive = 1
" Enabled by default. flip the value to make completion matches case insensitive

let g:vimjs#smartcomplete = 0
" Disabled by default. Enabling this will let vim complete matches at any location
" e.g. typing 'ocument' will suggest 'document' if enabled.

let g:vimjs#chromeapis = 0
" Disabled by default. Toggling this will enable completion for a number of Chrome's JavaScript extension APIs


" ----------------------------------------------------------------------------
" ## vim-javascript-syntax
let g:JSHintHighlightErrorLine = 1
let javascript_enable_domhtmlcss = 1
let loaded_matchit = 1
let g:js_indent_log = 1
let g:used_javascript_libs = 'underscore,chai,react,flux,mocha,redux,lodash,angularjs,angularui,enzyme,ramda,d3'


" ----------------------------------------------------------------------------
" ## vim-jsx
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 0


" ----------------------------------------------------------------------------
" ## vim-pretty-jsx
let g:vim_jsx_pretty_colorful_config = 1
let g:vim_jsx_pretty_enable_jsx_highlight = 1


" ----------------------------------------------------------------------------
" ## vim-javascript
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_conceal = 0
" let g:javascript_conceal_function = "ƒ"
" let g:javascript_conceal_this = "@"
" let g:javascript_conceal_return = "⇚"

" https://github.com/davidosomething/dotfiles/blob/master/vim/ftplugin/javascript.vim#L8
let b:match_words = '\<function\>:\<return\>,'
  \ . '\<do\>:\<while\>,'
  \ . '\<switch\>:\<case\>:\<default\>,'
  \ . '\<if\>:\<else\>,'
  \ . '\<try\>:\<catch\>:\<finally\>'


" ----------------------------------------------------------------------------
" ## scss
let s:match_done = '<CR>:nohlsearch<CR>'
let s:matches = '\(#\|\.\|@\|\h\|&:\).\+\s*{'
execute 'nmap <silent><buffer> [[ ?' . escape(s:matches, '|?') . s:match_done
execute 'omap <silent><buffer> [[ ?' . escape(s:matches, '|?') . s:match_done
execute 'nmap <silent><buffer> ]] /' . escape(s:matches, '|') . s:match_done
execute 'omap <silent><buffer> ]] /' . escape(s:matches, '|') . s:match_done


" ----------------------------------------------------------------------------
" ## elm
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_syntastic_show_warnings = 1
let g:elm_make_show_warnings = 1
let g:elm_setup_keybindings = 0
let g:elm_jump_to_error = 1
let g:elm_make_output_file = "elm.js"
let g:elm_browser_command = "open %URL%"


" ----------------------------------------------------------------------------
" ## vim-flow
let g:flow#enable = 0 " disable the `flow on :w' feature
let g:flow#autoclose = 1


" ----------------------------------------------------------------------------
" ## vim-json
let g:vim_json_syntax_conceal = 0


" ----------------------------------------------------------------------------
" ## fastfold
let g:fastfold_savehook = 1


" ----------------------------------------------------------------------------
" ## godown-vim
" should the preview be shown automatically when a markdown buffer is opened
let g:godown_autorun = 0
" the port to run the Godown server on
let g:godown_port = 1337


" ----------------------------------------------------------------------------
" ## JSDoc
" https://github.com/heavenshell/vim-jsdoc#configuration
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_enable_es6 = 1
let g:jsdoc_access_descriptions=2
let g:jsdoc_additional_descriptions=1


" ----------------------------------------------------------------------------
" ## rainbow_parentheses.vim
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]


" ----------------------------------------------------------------------------
" ## neoterm
let g:neoterm_position='horizontal'
let g:neoterm_run_tests_bg = 1
let g:neoterm_focus_when_tests_fail = 1
let g:neoterm_raise_when_tests_fail = 1
let g:neoterm_close_when_tests_succeed = 1


" ----------------------------------------------------------------------------
" ## vim-test
function! SplitStrategy(cmd)
  belowright new | call termopen(a:cmd) | startinsert
endfunction

let g:test#custom_strategies = {'terminal_split': function('SplitStrategy')}
let g:test#strategy = 'terminal_split'

if filereadable(expand(<SID>packageRoot()).'/node_modules/babel/register.js')
  " babel 5
  let g:test#javascript#mocha#options = "--compilers js:babel/register --colors --full-trace --timeout 15000 -R dot"
elseif filereadable(expand(<SID>packageRoot()).'/node_modules/babel-register/lib/node.js')
  " babel 6
  let g:test#javascript#mocha#options = "--compilers js:babel-register --colors --timeout 15000 --es_staging --opts ".expand(<SID>packageRoot())."/test/mocha.opts"
else
  " no babel
  let g:test#javascript#mocha#options = "--colors --full-trace --timeout 15000 -R dot"
endif

" to debug nock stuff in tests, add `DEBUG=nock.* ` before the `expand`, below
if filereadable(expand(<SID>packageRoot()).'/node_modules/.bin/mocha')
  let test#javascript#mocha#executable = "NODE_ENV=test ".expand(<SID>packageRoot())."/node_modules/.bin/mocha"
else
  let test#javascript#mocha#executable = "NODE_ENV=test mocha"
end

let g:test#javascript#mocha#file_pattern = ".test.js"

let test#ruby#rspec#options = '-f d'
let test#ruby#bundle_exec = 1


" ----------------------------------------------------------------------------
" ## list-toggle
let g:lt_location_list_toggle_map = '<F3>'
let g:lt_quickfix_list_toggle_map = '<F4>'


" ----------------------------------------------------------------------------
" ## incsearch.vim
" :h g:incsearch#auto_nohlsearch
let g:incsearch#auto_nohlsearch = 1
let g:incsearch#is_stay = 1


" ----------------------------------------------------------------------------
" ## vim-lua-ftplugin
let g:lua_check_syntax = 0
let g:lua_complete_omni = 1
let g:lua_complete_dynamic = 0
let g:lua_define_completion_mappings = 0


" ----------------------------------------------------------------------------
" ## vim-markdown
let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'bash=sh', 'sh', 'scss', 'zsh']
let g:vim_markdown_frontmatter=1


" ----------------------------------------------------------------------------
" ## quick-scope
let g:qs_enable = 0


if has('nvim')
  " ----------------------------------------------------------------------------
  " ## deoplete
  let g:deoplete#enable_at_startup = 0
  let g:deoplete#enable_ignore_case = 0
  " let g:deoplete#enable_camel_case = 1
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#enable_refresh_always = 0
  let g:deoplete#file#enable_buffer_path = 1
  let g:deoplete#auto_complete_start_length = 2

  " DEBUGGING:
  " let g:deoplete#enable_debug = 1
  " let g:deoplete#enable_profile = 1
  " call deoplete#enable_logging('DEBUG', expand('~/.config/nvim/deoplete.log'))

  let g:deoplete#sources = {}
  let g:deoplete#sources._ = ['file', 'buffer', 'vim', 'member', 'dictionary', 'nsnip', 'neosnippet', 'ultisnips', 'ternjs', 'omni']

  " TODO: find a way to check if deoplete exists before calling these:
  " call deoplete#custom#set('buffer', 'mark', 'buffer')
  " call deoplete#custom#set('ternjs', 'mark', '')
  " call deoplete#custom#set('omni', 'mark', 'omni')
  " call deoplete#custom#set('file', 'mark', 'file')
  " call deoplete#custom#set('_', 'matchers', ['matcher_fuzzy'])

  " we don't want the completion menu to auto pop-up when we are in text files
  let g:deoplete#lock_buffer_name_pattern = '\v(\.md|\.txt|\.git\/COMMIT_EDITMSG)'

  let g:deoplete#omni#functions = {}
  let g:deoplete#omni#functions.javascript = [
    \ 'tern#Complete'
  \]
  " \ 'jspc#omni'
  let g:deoplete#omni#functions['javascript.jsx'] = [
    \ 'tern#Complete',
  \]
  " \ 'jspc#omni'
  let g:deoplete#omni#functions.lua = 'xolox#lua#omnifunc'
  let g:deoplete#omni#functions.css = 'csscomplete#CompleteCSS'
  let g:deoplete#omni#functions.scss = 'csscomplete#CompleteCSS'
  let g:deoplete#omni#functions.sass = 'csscomplete#CompleteCSS'
  let g:deoplete#omni#functions.html = 'htmlcomplete#CompleteTags'
  let g:monster#completion#rcodetools#backend = 'async_rct_complete'

  let g:echodoc_enable_at_startup	= 1

  " NOTE: additional settings found in autocommands.vim and keys.vim
else
  " ----------------------------------------------------------------------------
  " ## completor.vim
  let g:completor_css_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'
  let g:completor_html_omni_trigger = '.*$'
endif


" ----------------------------------------------------------------------------
" ## nvim-completion-manager
" " for python completions
" let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'jedi')
" " language specific completions on markdown file
" let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'mistune')

" " utils, optional
" let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'psutil')
" let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'setproctitle')


" ----------------------------------------------------------------------------
" ## ternjs
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:tern#filetypes = [
      \ 'jsx',
      \ 'javascript',
      \ 'javascript.jsx',
      \ 'vue'
      \ ]
let g:tern_show_argument_hints = 'on_hold' "on_move
let g:tern_show_signature_in_pum = '0' " disables full signature type on autocomplete
let g:tern_request_timeout = 1


" ----------------------------------------------------------------------------
" ## FZF
let g:fzf_buffers_jump = 1
let g:fzf_filemru_bufwrite = 1
let g:fzf_layout = { 'down': '~25%' }
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit',
      \ 'enter': 'vsplit'
      \ }

" let g:fzf_colors =
"       \ { 'fg':      ['fg', 'Normal'],
"       \ 'bg':      ['bg', 'Normal'],
"       \ 'hl':      ['fg', 'Comment'],
"       \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"       \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"       \ 'hl+':     ['fg', 'Statement'],
"       \ 'info':    ['fg', 'PreProc'],
"       \ 'prompt':  ['fg', 'Conditional'],
"       \ 'pointer': ['fg', 'Exception'],
"       \ 'marker':  ['fg', 'Keyword'],
"       \ 'spinner': ['fg', 'Label'],
"       \ 'header':  ['fg', 'Comment'] }

" Search term using rg
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
" command! -bang -nargs=* Search call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" show a preview of the file:
" https://github.com/metakirby5/.dots/blob/master/base/.vimrc#L273

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)


" ----------------------------------------------------------------------------
" ## ack.vim
if executable("ag")
  " Note we extract the column as well as the file and line number
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m

  " Have the silver searcher ignore all the same things as wilgignore
  let b:ag_command = 'ag %s -i --nogroup'
  let g:ag_prg = 'ag %s -i --nogroup'

  for i in split(&wildignore, ",")
    let i = substitute(i, '\*/\(.*\)/\*', '\1', 'g')
    let b:ag_command = b:ag_command . ' --ignore "' . substitute(i, '\*/\(.*\)/\*', '\1', 'g') . '"'
  endfor

  let b:ag_command = b:ag_command . ' --hidden -g ""'
  let g:ctrlp_user_command = b:ag_command
endif

" set grepprg=ag\ --column\ --noheading\ --color=always
" let &grepprg = 'command ag --column'
" let g:ackprg="ag --column --vimgrep --color=always"
" let g:ag_prg="ag --column --vimgrep --color=always"


" ----------------------------------------------------------------------------
" ## gist.vim
let g:gist_open_url = 1
let g:gist_default_private = 1


" ----------------------------------------------------------------------------
" ## vim-search-pulse
" FIXME: pulse isn't working
" let g:vim_search_pulse_disable_auto_mappings = 1
" let g:vim_search_pulse_color_list = ['red', 'white']
let g:vim_search_pulse_duration = 150


" ----------------------------------------------------------------------------
" ## vim-esearch
" disabled vim-esearch for now.. useful, but lots of cognitive load
if !exists('g:esearch')
  let g:esearch = {}
  let g:esearch.adapter = 'rg'
  let g:esearch.backend = 'nvim'
  let g:esearch.out = 'win'
  let g:esearch.batch_size = 1000
  let g:esearch.use = ['visual', 'hlsearch', 'last']
endif

" ----------------------------------------------------------------------------
" ## ultisnips
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips', 'replisnips']
let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'

" better key bindings for UltiSnipsExpandTrigger
" Use tab to expand snippet and move to next target. Shift tab goes back.
" <C-tab> lists available snippets for the file

" Disable built-in <C-x><C-k> to be able to go backward
" inoremap <C-x><C-k> <NOP>
" let g:UltiSnipsExpandTrigger='<C-j>'
" let g:UltiSnipsListSnippets='<C-s>'
" let g:UltiSnipsJumpForwardTrigger='<C-j>'
" let g:UltiSnipsJumpBackwardTrigger='<C-k>'

" ----------------------------------------------------------------------------
" ## neosnippet
" Set snippet directory
" let g:neosnippet#snippets_directory='~/.config/nvim/replisnips/, ~/.config/nvim/plugged/vim-snippets/snippets'

" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1
" let g:neosnippet#expand_word_boundary = 1

" ----------------------------------------------------------------------------
" ## neoformat
" autocmd BufWritePre *.js silent Neoformat
" let g:neoformat_enabled_javascript = ['prettier']
" let g:neoformat_javascript_prettier = {
"         \ 'exe': 'prettier',
"         \ 'args': ['--trailing-comma es5', '--stdin'],
"         \ 'stdin': 1,
"         \ }
