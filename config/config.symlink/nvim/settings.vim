" -/ Plugin Settings /----------------------------------------------

" ## vim-readdir
" let g:loaded_netrw = 1
" let g:loaded_netrwPlugin = 1

" ----------------------------------------------------------------------------
" ## golden-ratio
let g:golden_ratio_exclude_nonmodifiable = 1
let g:golden_ratio_wrap_ignored = 0
let g:golden_ratio_ignore_horizontal_splits = 1

" ----------------------------------------------------------------------------
" ## vim-airline
let g:airline_theme='base16_ocean' "'base16_ocean'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '⭡'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.crypt = '⭤'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.modified = '✭'
let g:airline_symbols.space = "\ua0"
let g:airline_powerline_fonts = 0
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#neomake#enabled = 1

" disable unused extensions (performance)
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#capslock#enabled   = 0
let g:airline#extensions#csv#enabled        = 0
let g:airline#extensions#ctrlspace#enabled  = 0
let g:airline#extensions#eclim#enabled      = 0
let g:airline#extensions#hunks#enabled      = 0
let g:airline#extensions#nrrwrgn#enabled    = 0
let g:airline#extensions#promptline#enabled = 0
let g:airline#extensions#taboo#enabled      = 0
let g:airline#extensions#tagbar#enabled     = 0
let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

" ----------------------------------------------------------------------------
" ## vim-javascript
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

" ----------------------------------------------------------------------------
" ## vim-flow
let g:flow#autoclose = 1

" ----------------------------------------------------------------------------
" ## vim-json
let g:vim_json_syntax_conceal = 0

" ----------------------------------------------------------------------------
" ## godown-vim
" should the preview be shown automatically when a markdown buffer is opened
let g:godown_autorun = 1
" the port to run the Godown server on
let g:godown_port = 1337

" ----------------------------------------------------------------------------
" ## neomake
" -- Settings derived from:
" -- https://github.com/rstacruz/vimfiles/blob/master/plugin/plugins/neomake.vim
" --
let g:neomake_airline = 1
let g:neomake_serialize = 1
let g:neomake_verbose = 0
" let g:neomake_list_height = 10
let g:neomake_open_list = 0
let g:neomake_error_sign = { 'text': '☓', 'texthl': 'Error' }
let g:neomake_warning_sign = { 'text': '◦', 'texthl': 'Error' }
let g:neomake_javascript_enabled_makers = ['standard']
let g:neomake_javascript_standard_maker = {
      \ 'args': ['-f', 'compact', '--parser', 'babel-eslint', '-v'],
      \ 'errorformat': '  %f:%l:%c: %m'
      \ }
let g:neomake_jsx_enabled_makers = ['standard']
let g:neomake_jsx_standard_maker = g:neomake_javascript_standard_maker

" do the lintings!
au! BufReadPost,BufWritePost {*.js,*.rb} Neomake | redraw

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
let g:test#preserve_screen = 1
let g:test#javascript#mocha#options = "--colors --compilers js:babel/register --timeout 15000 --delay"
let g:test#javascript#mocha#file_pattern = ".test.js"

" ----------------------------------------------------------------------------
" ## list-toggle
let g:lt_location_list_toggle_map = '<F3>'
let g:lt_quickfix_list_toggle_map = '<F4>'

" ----------------------------------------------------------------------------
" ## incsearch.vim
" :h g:incsearch#auto_nohlsearch
let g:incsearch#auto_nohlsearch = 1

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
" ## Supertab
" let g:SuperTabDefaultCompletionType    = '<C-n>'
" let g:SuperTabCrMapping                = 0
" handy stuff: https://github.com/ervandew/supertab/issues/53
" let g:SuperTabDefaultCompletionTypeDiscovery = [ "&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>" ]
" let g:SuperTabDefaultCompletionType = 'context'
" let g:SuperTabDefaultCompletionType = '<c-n>'

" ----------------------------------------------------------------------------
" ## deoplete
" set completeopt+=noinsert
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#disable_auto_complete = 0
let g:deoplete#enable_debug = 1

" let g:deoplete#enable_refresh_always = 1
" let g:deoplete#enable_prefetch = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#enable_ignore_case = 'ignorecase'
let g:deoplete#auto_completion_start_length = 0
let g:min_pattern_length = 0

" we don't want the completion menu to auto pop-up when we are in text files
let g:deoplete#lock_buffer_name_pattern = '\v(\.md|\.txt|\.git\/COMMIT_EDITMSG)'

let g:deoplete#omni#functions = get(g:, 'deoplete#omni#functions', {})
let g:deoplete#omni#functions.javascript = 'tern#Complete'
let g:deoplete#omni#functions.lua = 'xolox#lua#omnifunc'
" let g:deoplete#omni#functions.['javascript.jsx'] = 'tern#Complete'

let g:monster#completion#rcodetools#backend = "async_rct_complete"

let g:deoplete#omni_patterns = get(g:, 'deoplete#omni_patterns', {})
let g:deoplete#omni_patterns.javascript = '[^. \t]\.\%(\h\w*\)\?'
" let g:deoplete#omni_patterns.['javascript.jsx'] = '[^. \t]\.\%(\h\w*\)\?'

let g:deoplete#omni#input_patterns = get(g:, 'deoplete#omni#input_patterns', {})
let g:deoplete#omni#input_patterns.html = '<[^>]*'
let g:deoplete#omni#input_patterns.xml = '<[^>]*'
let g:deoplete#omni#input_patterns.md = '<[^>]*'
let g:deoplete#omni#input_patterns.css = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni#input_patterns.scss = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni#input_patterns.sass = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni#input_patterns.go = '[^.[:digit:] *\t]\.\w*'
let g:deoplete#omni#input_patterns.ruby = ['[^. *\t]\.\w*', '\h\w*::']
let g:deoplete#omni#input_patterns.coffee = '\h\w*\|[^. \t]\.\w*'
" let g:deoplete#omni#input_patterns.javascript = '[^. \t]\.\%(\h\w*\)\?'
" let g:deoplete#omni#input_patterns['javascript.jsx'] = '[^. \t]\.\%(\h\w*\)\?'
let g:deoplete#omni#input_patterns.javascript = '[^. \t]\.\w*'
let g:deoplete#omni#input_patterns["javascript.jsx"] = '[^. \t]\.\w*'

let g:deoplete#keyword_patterns = get(g:, 'deoplete#keyword_patterns', {})
" let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'
let g:deoplete#keyword_patterns.default = '\h\w*'
let g:deoplete#keyword_patterns.html = '</\?\%([[:alnum:]_:-]\+\s*\)\?\%(/\?>\)\?\|&\h\%(\w*;\)\?\|\h[[:alnum:]_:-]*'

let g:deoplete#sources = get(g:, 'deoplete#sources', {})
let g:deoplete#sources._ = ['buffer', 'vim', 'member', 'file', 'dictionary', 'ultisnips', 'neosnippet', 'ternjs', 'omni']

call deoplete#custom#set('_', 'matchers', ['matcher_fuzzy'])
call deoplete#custom#set('_', 'converters', ['converter_remove_paren'])
call deoplete#custom#set('_', 'disabled_syntaxes', ['Comment', 'String'])

" ----------------------------------------------------------------------------
" ## tern_for_vim
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" ----------------------------------------------------------------------------
" ## ternjs
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_argument_hints = 1
let g:tern_show_signature_in_pum = 1
let g:tern_request_timeout = 1
" let g:tern_map_keys = 1

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
" please confirm these!
" let g:fzf_colors = {
"       \ 'fg':      ['fg', 'Normal'],
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

" ----------------------------------------------------------------------------
" ## ctrlp
let g:ctrlp_match_window = 'bottom,order:btt'    " Order matching files top to bottom
let g:ctrlp_switch_buffer=0            " open files in new buffers
let g:ctrlp_working_path_mode = 'ra'   " Our working path is our VCS project or the current directory
let g:ctrlp_mru_files = 1              " Enable Most Recently Used files feature
let g:ctrlp_mruf_relative = 1          " Show only MRU files in the working directory
let g:ctrlp_jump_to_buffer = 2         " Jump to tab AND buffer if already open
let g:ctrlp_open_new_file = 'v'        " open selections in a vertical split
let g:ctrlp_open_multiple_files = 'vr' " opens multiple selections in vertical splits to the right
let g:ctrlp_arg_map = 0
let g:ctrlp_dotfiles = 0               " do not show (.) dotfiles in match list
let g:ctrlp_showhidden = 0             " do not show hidden files in match list
let g:ctrlp_split_window = 0
let g:ctrlp_max_height = 20            " restrict match list to a maxheight of 40
let g:ctrlp_use_caching = 0            " don't cache, we want new list immediately each time
let g:ctrlp_max_files = 0              " no restriction on results/file list
let g:ctlrp_clear_cache_on_exit = 1
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|gitkeep)$',
      \ 'file': '\v\.(exe|so|dll|log|gif|jpg|jpeg|png|psd|DS_Store|ctags|gitattributes)$'
      \ }
let g:ctrlp_user_command = 'ag %s -i -l --nocolor --nogroup --hidden -g ""'
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': ['<c-e>', '<c-space>', '<2-LeftMouse>'],
      \ 'AcceptSelection("v")': ['<cr>', '<RightMouse>', 'gv'],
      \ 'PrtSelectMove("j")':   ['<c-j>', '<c-n>', '<down>', '<s-tab>'],
      \ 'PrtSelectMove("k")':   ['<c-k>', '<c-p>', '<up>', '<tab>'],
      \ 'ToggleFocus()':        ['<c-tab>'],
      \}

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
" let g:UltiSnipsUsePythonVersion = 3
" let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'
" let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips']
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsListSnippets = "<c-tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ----------------------------------------------------------------------------
" ## neosnippet
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#expand_word_boundary = 1
" imap <C-k> <Plug>(neosnippet_expand_or_jump)
" smap <C-k> <Plug>(neosnippet_expand_or_jump)
" xmap <C-k> <Plug>(neosnippet_expand_target)
" Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.config/repos/github.com/Shougo/neosnippet-snippets/neosnippets, ~/Github/ionic-snippets, ~/.config/repos/github.com/matthewsimo/angular-vim-snippets/snippets'
