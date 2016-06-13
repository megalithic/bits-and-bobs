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
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#neomake#enabled = 1
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

" ----------------------------------------------------------------------------
" ## neomake
" -- Settings derived from:
" -- https://github.com/rstacruz/vimfiles/blob/master/plugin/plugins/neomake.vim
" --
let g:neomake_airline = 1
let g:neomake_verbose = 0
let g:neomake_serialize = 1
let g:neomake_error_sign = { 'text': '☓', 'texthl': 'Error' }
let g:neomake_warning_sign = { 'text': '◦', 'texthl': 'Error' }
let g:neomake_yaml_enabled_makers = ['yamllint']
let g:neomake_scss_enabled_makers = ['scsslint']
let g:neomake_scss_scsslint_args = ['-c', globpath(&rtp, 'misc/scss-lint.yml')]
let g:neomake_javascript_enabled_makers = ['standard']
let g:neomake_javascript_standard_maker = {
      \ 'args': ['-f', 'compact', '--parser', 'babel-eslint', '-v'],
      \ 'errorformat': '  %f:%l:%c: %m'
      \ }
let g:neomake_jsx_enabled_makers = ['standard']
let g:neomake_jsx_standard_maker = g:neomake_javascript_standard_maker
let g:neomake_json_enabled_makers = ['jsonlint']

" do the lintings!
au BufWritePost *.js silent! Neomake standard|redraw
au BufWritePost *.scss,*.scss.css,*.sass silent! Neomake scsslint|redraw
au BufWritePost *.yml,*.yaml silent! Neomake yamllint|redraw
au BufWritePost *.json silent! Neomake jsonlint|redraw

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
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" ----------------------------------------------------------------------------
" ## vim-lua-ftplugin
let g:lua_check_syntax = 0
let g:lua_complete_omni = 1
let g:lua_complete_dynamic = 0
let g:lua_define_completion_mappings = 0
let g:deoplete#omni#functions_lua = 'xolox#lua#omnifunc'

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
" ## supertab
" handy stuff: https://github.com/ervandew/supertab/issues/53
let g:SuperTabDefaultCompletionTypeDiscovery = [ "&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>" ]
let g:SuperTabDefaultCompletionType = 'context'

" ----------------------------------------------------------------------------
" ## deoplete
let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_ignore_case = 1
" let g:deoplete#enable_refresh_always = 1
" let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#auto_completion_start_length = 2
" let g:deoplete#max_list = 100
" let g:deoplete#disable_auto_complete = 1
" let g:deoplete#enable_debug = 1

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer', 'member', 'file', 'dictionary', 'ultisnips', 'omni']

" let g:deoplete#sources={}
" let g:deoplete#sources_ = []
" let g:deoplete#sources_md = ['dictionary', 'file', 'member']
" let g:deoplete#sources_pandoc = ['dictionary', 'file', 'member']
" let g:deoplete#sources_vim = ['buffer', 'member', 'file', 'ultisnips']
" let g:deoplete#sources_txt = ['buffer','dictionary', 'file', 'member']
" let g:deoplete#sources_mmd = ['dictionary', 'file', 'member']
" let g:deoplete#sources_ghmarkdown = ['dictionary', 'file', 'member']
" let g:deoplete#sources_javascript = ['buffer', 'member', 'file', 'omni']
" let g:deoplete#sources_ruby = ['buffer', 'member', 'file']
" let g:deoplete#sources_css = ['buffer', 'member', 'file', 'omni']
" let g:deoplete#sources_scss = ['buffer', 'member', 'file', 'omni']
" let g:deoplete#sources_html = ['buffer', 'member', 'file', 'omni']

" let g:deoplete#sources={}
" let g:deoplete#sources._    = ['buffer', 'file']
" let g:deoplete#sources.vim  = ['buffer', 'member', 'file']
" let g:deoplete#sources.javascript = ['buffer', 'member', 'file', 'omni']
" let g:deoplete#sources['javascript.jsx'] = ['buffer', 'member', 'file', 'omni']
" let g:deoplete#sources.ruby = ['buffer', 'member', 'file']
" let g:deoplete#sources.css  = ['buffer', 'member', 'file', 'omni']
" let g:deoplete#sources.scss = ['buffer', 'member', 'file', 'omni']
" let g:deoplete#sources.html = ['buffer', 'member', 'file', 'omni']

" ----------------------------------------------------------------------------
" ## tern_for_vim
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" ----------------------------------------------------------------------------
" ## ternjs
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1
let g:tern_request_timeout = 1
" let g:tern_map_keys = 1

" ----------------------------------------------------------------------------
" ## FZF
let g:fzf_buffers_jump = 1
let g:fzf_filemru_bufwrite = 1
let g:fzf_layout = { 'down': '~30%' }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'enter': 'vsplit'
  \ }

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
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
