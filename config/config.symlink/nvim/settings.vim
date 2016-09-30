" -/ Plugin Settings /----------------------------------------------

" ## vim-readdir
" let g:loaded_netrw = 1
" let g:loaded_netrwPlugin = 1

" ## codi
let g:codi#use_buffer_dir = 0

" ----------------------------------------------------------------------------
" ## nvimux
let g:nvimux_quickterm_provider = ''
let g:nvimux_new_term = ''
let g:nvimux_close_term = ''

let g:nvimux_custom_bindings = [
      \['s', ':NvimuxHorizontalSplit<CR>', ['n', 'v', 'i', 't']],
      \['v', ':NvimuxVerticalSplit<CR>', ['n', 'v', 'i', 't']],
      \['!', ':IronPromptRepl<CR>', ['n', 'v', 'i', 't']],
      \['$', ':call ToggleRepl()<CR>', ['n', 'v', 'i', 't']],
      \['<C-$>', ':call AggrToggleRepl()<CR>', ['n', 'v', 'i', 't']]
      \]

let g:nvimux_prefix = '<C-a>'
let g:nvimux_no_neoterm = 1
let g:nvimux_open_term_by_default = 1

"au VimEnter * if &columns > 200 => set vertical else set horizontal
let g:nvimux_quickterm_direction = 'botright'
let g:nvimux_quickterm_orientation = 'vertical'
let g:nvimux_quickterm_scope = 't'
let g:nvimux_quickterm_size = '80'

" ----------------------------------------------------------------------------
" ## golden-ratio
let g:golden_ratio_exclude_nonmodifiable = 1
let g:golden_ratio_wrap_ignored = 0
let g:golden_ratio_ignore_horizontal_splits = 1

" ----------------------------------------------------------------------------
" ## lightline
" let g:lightline = {
"       \ 'colorscheme': 'seoul256',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
"       \ },
"       \ 'component': {
"       \   'readonly': '%{&readonly?"⭤":""}',
"       \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
"       \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
"       \ },
"       \ 'component_visible_condition': {
"       \   'readonly': '(&filetype!="help"&& &readonly)',
"       \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
"       \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
"       \ }
"       \ }
let g:lightline = {
      \ 'colorscheme': 'base16_ocean',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'fugitive', 'filename' ] ],
      \   'right': [
      \     [ 'neomake', 'lineinfo' ],
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
      \   'buffercurrent': 'lightline#buffer#buffercurrent2',
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename',
      \   'mode': 'LightLineMode',
      \   'neomake': 'neomake#statusline#LoclistStatus',
      \   'bufferbefore': 'lightline#buffer#bufferbefore',
      \   'bufferafter': 'lightline#buffer#bufferafter',
      \   'bufferinfo': 'lightline#buffer#bufferinfo',
      \ },
      \ 'component_type': {
      \   'neomake': 'error',
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
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
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
" ## vim-javascript
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

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
let g:flow#autoclose = 1

" ----------------------------------------------------------------------------
" ## vim-json
let g:vim_json_syntax_conceal = 0

" ----------------------------------------------------------------------------
" ## godown-vim
" should the preview be shown automatically when a markdown buffer is opened
let g:godown_autorun = 0
" the port to run the Godown server on
let g:godown_port = 1337

" ----------------------------------------------------------------------------
" ## neomake
" -- Settings derived from:
" -- https://github.com/rstacruz/vimfiles/blob/master/plugin/plugins/neomake.vim
" --
" let g:neomake_airline = 1
let g:neomake_serialize = 1
let g:neomake_verbose = 0
" let g:neomake_list_height = 10
let g:neomake_open_list = 0
let g:neomake_logfile='/tmp/neomake_error.log' " display errors / write in logs
let g:neomake_error_sign = { 'text': '☓', 'texthl': 'Error' }
let g:neomake_warning_sign = { 'text': '>', 'texthl': 'Error' }

" let g:neomake_elixir_credo_maker = {
"       \ 'exe': 'mix',
"       \ 'args': ['credo'],
"       \ 'append_file': 0,
"       \ 'errorformat':
"       \   '%E┃ [%t] %. %m.,%Z┃       %f:%l%.%#'
"       \ }

" let g:neomake_elixir_diaylze_maker = {
"       \ 'exe': 'mix',
"       \ 'args': [
"       \   'dialyze',
"       \   '--no-check',
"       \   '--unmatched-returns',
"       \   '--error-handling',
"       \   '--race-conditions',
"       \   '--underspecs'
"       \  ],
"       \ 'errorformat':
"       \   '%f:%l:%m'
"       \ }

" let g:neomake_elixir_enabled_makers = ['mix', 'credo', 'diaylze']
" let g:neomake_elixir_mix_maker = {
"       \ 'args': ['compile'],
"       \ 'errorformat':
"       \   '** %s %f:%l: %m,' .
"       \   '%f:%l: warning: %m'
"       \ }

let g:neomake_scss_enabled_checkers = ['scss-lint']

let g:neomake_ruby_rubocop_exe = 'bundle'
let g:neomake_ruby_rubocop_args = ['exec', 'rubocop']
let g:neomake_ruby_enabled_makers = ['rubocop', 'mri']

let g:neomake_javascript_enabled_makers = ['standard']
let g:neomake_javascript_standard_maker = {
      \ 'args': ['-f', 'compact', '--parser', 'babel-eslint', '-v'],
      \ 'errorformat': '  %f:%l:%c: %m'
      \ }
let g:neomake_jsx_enabled_makers = ['standard']
let g:neomake_jsx_standard_maker = g:neomake_javascript_standard_maker

" do the lintings!
" au! BufWritePost * Neomake | redraw
augroup AutoNeomake
  autocmd!
  autocmd BufWritePost * call s:neomake()
augroup END

function! s:neomake()
  Neomake
  call lightline#update()
endfunction
" au! BufReadPost,BufWritePost {*.js,*.rb,*.elm} Neomake | redraw

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
let g:test#strategy = 'terminal_split' " neoterm
let g:neoterm_position = "vertical"
let g:test#preserve_screen = 1
let g:test#javascript#mocha#options = "-A --compilers js:babel/register --colors --full-trace --timeout 15000"
let g:test#javascript#mocha#file_pattern = ".test.js"
let test#elixir#exunit#options = '--trace'
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
" ## vim-javascript-syntax
let g:JSHintHighlightErrorLine = 1
let javascript_enable_domhtmlcss = 1
let loaded_matchit = 1
let g:js_indent_log = 1
let g:used_javascript_libs = 'underscore,chai,react,flux,mocha,redux,lodash,angular,enzyme'

" ----------------------------------------------------------------------------
" ## vim-jsx
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 0

" ----------------------------------------------------------------------------
" ## quick-scope
let g:qs_enable = 0

" ----------------------------------------------------------------------------
" ## deoplete
set completeopt-=preview
" set completeopt+=noinsert
let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_refresh_always = 0
" let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#auto_completion_start_length = 3
let g:deoplete#enable_smart_case = 1
" let g:deoplete#enable_debug = 0

let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer', 'vim', 'member', 'file', 'dictionary', 'ultisnips', 'omni']
let g:deoplete#sources.javascript = ['buffer', 'vim', 'member', 'file', 'dictionary', 'ultisnips', 'ternjs', 'omni']
let g:deoplete#sources['javascript.jsx'] = ['buffer', 'vim', 'member', 'file', 'dictionary', 'ultisnips', 'ternjs', 'omni']
call deoplete#custom#set('buffer', 'mark', 'buffer')
call deoplete#custom#set('ternjs', 'mark', '')
call deoplete#custom#set('omni', 'mark', 'omni')
call deoplete#custom#set('file', 'mark', 'file')
function! Preview_func()
  if &pvw
    setlocal nonumber norelativenumber
    endif
endfunction

autocmd WinEnter * call Preview_func()


let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.javascript = '[^. \t]\.\%(\h\w*\)\?'
let g:deoplete#omni_patterns['javascript.jsx'] = '[^. \t]\.\%(\h\w*\)\?'
let g:deoplete#omni_patterns.elm = '\.'
let g:deoplete#omni_patterns.html = ''
let g:deoplete#omni_patterns.html = '<[^>]*'
let g:deoplete#omni_patterns.xml = '<[^>]*'
let g:deoplete#omni_patterns.md = '<[^>]*'
let g:deoplete#omni_patterns.css = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni_patterns.scss = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni_patterns.sass = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni_patterns.go = '[^.[:digit:] *\t]\.\w*'
let g:deoplete#omni_patterns.ruby = ['[^. *\t]\.\w*', '\h\w*::']

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
let g:monster#completion#rcodetools#backend = 'async_rct_complete'

" ----------------------------------------------------------------------------
" ## tern_for_vim
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" ----------------------------------------------------------------------------
" ## ternjs
let g:tern_show_argument_hints = 'on_hold' "on_move; default is 0
let g:tern_show_signature_in_pum = 1
let g:tern_request_timeout = 1
" " let g:tern_map_keys = 1

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
" ## webapi-vim / gist-vim
let g:gist_put_url_to_clipboard_after_post  = 1
let g:gist_show_privates                    = 1
let g:gist_post_private                     = 1
" detect filetype if vim failed autodetection
let g:gist_detect_filetype                  = 1
" :w! updates a Gist, not plain :w
let g:gist_update_on_write                  = 2
if has('macunix')
  let g:gist_clip_command = 'pbcopy'
endif

" ----------------------------------------------------------------------------
" ## ultisnips
" better key bindings for UltiSnipsExpandTrigger
" Use tab to expand snippet and move to next target. Shift tab goes back.
" <C-tab> lists available snippets for the file
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips']

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
