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
" ## neomake
" -- Settings derived from / see this link, also, for custom makers:
" -- https://github.com/rstacruz/vimfiles/blob/master/plugin/plugins/neomake.vim
let g:neomake_serialize = 0
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

let g:neomake_scss_enabled_makers = ['scss-lint']
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

function! s:eslint()
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_javascript_eslint_maker = {
        \   'exe': expand(<SID>packageRoot()).'/node_modules/.bin/eslint',
        \   'args': ['-f', 'compact'],
        \   'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
        \   '%W%f: line %l\, col %c\, Warning - %m'
        \ }
  let g:neomake_jsx_enabled_makers = ['eslint']
  let g:neomake_jsx_eslint_maker =
        \ g:neomake_javascript_eslint_maker
endfunction

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

function! s:higherstandard()
  let g:neomake_javascript_enabled_makers = ['higherstandard']
  let g:neomake_javascript_higherstandard_maker = {
        \ 'exe': <SID>getHigherStandardBin(),
        \ 'args': ['-f', 'compact', '--parser', 'babel-eslint', '-v'],
        \ 'errorformat': '  %f:%l:%c: %m'
        \ }
  let g:neomake_jsx_enabled_makers = ['higherstandard']
  let g:neomake_jsx_higherstandard_maker =
        \ g:neomake_javascript_higherstandard_maker
endfunction

if findfile(<SID>getEslintrc(), '.;') ==# ''
  " no eslintrc found, so it's either higher-standard or standard
  if findfile(<SID>getHigherStandardBin(), '.;') ==# ''
    " no higher-standard found, so we use standard
    call <SID>standard()
  else
    " found higher-standard, so we use it
    call <SID>higherstandard()
  endif
else
  " found eslintrc, so we use eslint
  call <SID>eslint()
endif

" do the lintings!
" au! BufEnter * nested Neomake
au! BufWritePost * nested Neomake


" ----------------------------------------------------------------------------
" ## lightline
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'fugitive', 'conflicted', 'filename' ],
      \     [ 'readonly', 'modified' ] ],
      \   'right': [
      \     [ 'column', 'lineinfo' ],
      \     [ 'percent' ],
      \     [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'tabline': {
      \   'left': [
      \     [ 'bufferinfo' ],
      \     [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
      \   'right': [ [ 'close' ], ],
      \ },
      \ 'component_expand': {
      \   'buffercurrent': 'lightline#buffer#buffercurrent2'
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'conflicted': 'LightLineConflicted',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename',
      \   'mode': 'LightLineMode',
      \   'bufferbefore': 'lightline#buffer#bufferbefore',
      \   'bufferafter': 'lightline#buffer#bufferafter',
      \   'bufferinfo': 'lightline#buffer#bufferinfo',
      \ },
      \ 'component_type': {
      \ },
      \ }

function! LightLineInfo()
  return expand('⭡ %3l:%-2v')
endfunction

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
  return fnamemodify(expand("%"), ":~:.")
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightLineConflicted()
  if !empty(glob("~/.config/nvim/plugged/vim-conflicted/plugin/conflicted.vim"))
    return ConflictedVersion()
  endif
  return ''
endfunction

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

" disable overwriting the statusline forcibly by other plugins
let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_separator_icon = ''

let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_rotate = 0
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']

let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20


" ----------------------------------------------------------------------------
" ## vim-javascript-syntax
let g:JSHintHighlightErrorLine = 1
let javascript_enable_domhtmlcss = 1
let loaded_matchit = 1
let g:js_indent_log = 1
let g:used_javascript_libs = 'underscore,chai,react,flux,mocha,redux,lodash,angular,enzyme,ramda'


" ----------------------------------------------------------------------------
" ## vim-jsx
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 0


" ----------------------------------------------------------------------------
" ## vim-javascript
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_conceal = 0
" let g:javascript_conceal_function = "ƒ"
" let g:javascript_conceal_this = "@"
" let g:javascript_conceal_return = "⇚"


" ----------------------------------------------------------------------------
" ## elm
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1
let g:elm_make_show_warnings = 1
let g:elm_setup_keybindings = 0
let g:elm_jump_to_error = 1


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
" ## vim-test
function! SplitStrategy(cmd)
  botright new | call termopen(a:cmd) | startinsert
endfunction

let g:test#custom_strategies = {'terminal_split': function('SplitStrategy')}
let g:test#strategy = 'terminal_split'
let g:neoterm_position = "vertical"
let g:test#preserve_screen = 1
let test#ruby#bundle_exec = 1

" if filereadable(expand(<SID>packageRoot()))
"   let test#project_root = expand(<SID>packageRoot())
" endif

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
let test#javascript#mocha#executable = "NODE_ENV=test ".expand(<SID>packageRoot())."/node_modules/.bin/mocha"
let g:test#javascript#mocha#file_pattern = ".test.js"

let test#ruby#rspec#options = '-f d'


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
let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'bash=sh', 'sh', 'scss', 'zsh', 'elm']
let g:vim_markdown_frontmatter=1


" ----------------------------------------------------------------------------
" ## quick-scope
let g:qs_enable = 0

" ----------------------------------------------------------------------------
" ## deoplete
set completeopt-=preview
" set completeopt+=noinsert
let g:echodoc_enable_at_startup	= 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 0
let g:deoplete#file#enable_buffer_path = 1
" let g:deoplete#max_abbr_width = 0
" let g:deoplete#max_menu_width = 0
" let g:deoplete#enable_debug = 0

" let g:deoplete#sources = {}
" let g:deoplete#sources._ = ['file', 'buffer', 'vim', 'member', 'dictionary', 'ultisnips', 'ternjs', 'omni']
" let g:deoplete#sources.javascript = ['file', 'buffer', 'vim', 'member', 'dictionary', 'ultisnips', 'ternjs', 'omni']
" let g:deoplete#sources['javascript.jsx'] = ['file', 'buffer', 'vim', 'member', 'dictionary', 'ultisnips', 'ternjs', 'omni']
call deoplete#custom#set('buffer', 'mark', 'buffer')
call deoplete#custom#set('ternjs', 'mark', '')
call deoplete#custom#set('omni', 'mark', 'omni')
call deoplete#custom#set('file', 'mark', 'file')
" call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
function! Preview_func()
  if &pvw
    setlocal nonumber norelativenumber
    endif
endfunction
autocmd WinEnter * call Preview_func()


" let g:deoplete#omni_patterns = {}
" let g:deoplete#omni_patterns.javascript = '[^. \t]\.\%(\h\w*\)\?'
" let g:deoplete#omni_patterns['javascript.jsx'] = '[^. \t]\.\%(\h\w*\)\?'
" let g:deoplete#omni_patterns.elm = '\.'
" let g:deoplete#omni_patterns.html = ''
" let g:deoplete#omni_patterns.html = '<[^>]*'
" let g:deoplete#omni_patterns.xml = '<[^>]*'
" let g:deoplete#omni_patterns.md = '<[^>]*'
" let g:deoplete#omni_patterns.css = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
" let g:deoplete#omni_patterns.scss = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
" let g:deoplete#omni_patterns.sass = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
" let g:deoplete#omni_patterns.go = '[^.[:digit:] *\t]\.\w*'
" let g:deoplete#omni_patterns.ruby = ['[^. *\t]\.\w*', '\h\w*::']

" we don't want the completion menu to auto pop-up when we are in text files
let g:deoplete#lock_buffer_name_pattern = '\v(\.md|\.txt|\.git\/COMMIT_EDITMSG)'

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
let g:deoplete#omni#functions['javascript.jsx'] = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
let g:deoplete#omni#functions.lua = 'xolox#lua#omnifunc'
let g:deoplete#omni#functions.css = 'csscomplete#CompleteCSS'
let g:deoplete#omni#functions.scss = 'csscomplete#CompleteCSS'
let g:deoplete#omni#functions.html = 'htmlcomplete#CompleteTags'
let g:monster#completion#rcodetools#backend = 'async_rct_complete'

" ----------------------------------------------------------------------------
" ## tern_for_vim
" let g:tern#command = ['node', expand('~').'/lib/tern/bin/tern']
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:tern#filetypes = [
      \ 'jsx',
      \ 'javascript',
      \ 'javascript.jsx',
      \ 'vue'
      \ ]

" ----------------------------------------------------------------------------
" ## ternjs
let g:tern_show_argument_hints = 'on_hold' "on_move; default is 0
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
let g:fzf_files_options =
      \ '--preview "(pygmentize {} || less {}) 2>/dev/null"'

" show a preview of the file:
" https://github.com/metakirby5/.dots/blob/master/base/.vimrc#L273


" ----------------------------------------------------------------------------
" ## ack.vim
set grepprg=ag\ --nogroup\ --line-numbers\ --column\ --noheading
let &grepprg = 'command ag --nogroup --nocolor --line-numbers --column'
let g:ackprg="ag --column --nogroup --line-numbers --vimgrep"
let g:agprg="ag --column --nogroup --line-numbers --vimgrep"
" https://github.com/akalyaev/dotfiles/blob/master/vimrc#L207
let g:agprg = 'ag --nogroup --nocolor --column --smart-case'


" ----------------------------------------------------------------------------
" ## gist.vim
let g:gist_open_url = 1
let g:gist_default_private = 1

" ----------------------------------------------------------------------------
" ## vim-esearch
if !exists('g:esearch')
  let g:esearch = {}
  let g:esearch.adapter = 'ag'
  let g:esearch.backend = 'nvim'
  let g:esearch.out = 'win'
  let g:esearch.batch_size = 1000
  let g:esearch.use = ['visual', 'hlsearch', 'last']
endif

" ----------------------------------------------------------------------------
" ## ultisnips
" better key bindings for UltiSnipsExpandTrigger
" Use tab to expand snippet and move to next target. Shift tab goes back.
" <C-tab> lists available snippets for the file
let g:UltiSnipsUsePythonVersion = 3
" let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'replisnips']

" Disable built-in <C-x><C-k> to be able to go backward
inoremap <C-x><C-k> <NOP>
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsListSnippets='<C-s>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'

" ----------------------------------------------------------------------------
" ## neosnippet
" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1
" let g:neosnippet#expand_word_boundary = 1
" imap <C-k> <Plug>(neosnippet_expand_or_jump)
" smap <C-k> <Plug>(neosnippet_expand_or_jump)
" xmap <C-k> <Plug>(neosnippet_expand_target)
" Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.config/repos/github.com/Shougo/neosnippet-snippets/neosnippets, ~/Github/ionic-snippets, ~/.config/repos/github.com/matthewsimo/angular-vim-snippets/snippets'
