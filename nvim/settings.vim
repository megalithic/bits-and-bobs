" -/ Plugin Settings /----------------------------------------------

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
" ## nvimux
" let g:nvimux_prefix = '<C-a>'
" let g:nvimux_open_term_by_default = 'true'
" let g:nvimux_new_window_buffer = 'single'
" let g:nvimux_quickterm_direction = 'botright'
" let g:nvimux_quickterm_orientation = 'vertical'
" let g:nvimux_quickterm_scope = 't'
" let g:nvimux_quickterm_size = '80'

" if exists('$TMUX')
"   function! TmuxOrSplitSwitch(wincmd, tmuxdir)
"     let previous_winnr = winnr()
"     silent! execute "wincmd " . a:wincmd
"     if previous_winnr == winnr()
"       call system("tmux select-pane -" . a:tmuxdir)
"       redraw!
"     endif
"   endfunction

"   let g:tmux_navigator_no_mappings = 1
"   let g:tmux_navigator_save_on_switch = 1

"   let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
"   let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
"   let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

"   nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
"   nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
"   nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
"   nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
" else
"   map <C-h> <C-w>h
"   map <C-j> <C-w>j
"   map <C-k> <C-w>k
"   map <C-l> <C-w>l
" endif

" let g:nvimux_open_term_by_default = 1
" let g:nvimux_new_window_buffer = 'single'
" let g:nvimux_quickterm_direction = 'botright'
" let g:nvimux_quickterm_orientation = 'vertical'
" let g:nvimux_quickterm_scope = 't'
" let g:nvimux_quickterm_size = '80'

" function! s:escape_ft(ft)
"   return substitute(a:ft, "\\.", "_", "")
" endfunction

" let g:iron_repl_open_cmd = "topleft vspl"

" function! SetNvimuxConfigOnIronRepl(buf_id, repl_def) abort
"   exec "let t:iron_" . s:escape_ft(a:repl_def.ft) . "_repl = " . a:buf_id
"   call setbufvar(a:buf_id, 'nvimux_buf_orientation', g:iron_repl_open_cmd)
" endfunction

" function! SetNvimuxConfigOnShell(buf_id, repl_def) abort
"   let orientation = g:nvimux_quickterm_direction . " " . g:nvimux_quickterm_orientation . " " . g:nvimux_quickterm_size . "split"
"   call setbufvar(a:buf_id, 'nvimux_buf_orientation', orientation)
" endfunction

" let g:iron_new_repl_hooks = ['SetNvimuxConfigOnIronRepl']
" let g:iron_new_sh_repl_hooks = ['SetNvimuxConfigOnShell']
" let g:iron_debug = 1

" let g:nvimux_custom_bindings = [
"   \['s', ':NvimuxHorizontalSplit<CR>', ['n', 'v', 'i', 't']],
"   \['v', ':NvimuxVerticalSplit<CR>', ['n', 'v', 'i', 't']],
"   \['!', ':IronPromptRepl<CR>', ['n', 'v', 'i', 't']],
"   \['$', ':IronRepl<CR>', ['n', 'v', 'i', 't']],
"   \['#', ':IronPromptCommand<CR>', ['n', 'v', 'i', 't']],
"   \['%', ':call ToggleRepl()<CR>', ['n', 'v', 'i', 't']]
" \]

" let g:nvimux_new_term = "call IronStartRepl('sh', 0, 1)"
" let g:iron_repl_open_cmd = 'topleft vertical split'


" ----------------------------------------------------------------------------
" ## auto-pairs
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsMapCR = 0 " https://www.reddit.com/r/neovim/comments/4st4i6/making_ultisnips_and_deoplete_work_together_nicely/d6m73rh/


" ----------------------------------------------------------------------------
" ## ale
let g:ale_enabled = 1
let g:ale_linter_aliases = {'javascript.jsx': 'javascript', 'jsx': 'javascript'}
let g:ale_fixer_aliases = {'javascript.jsx': 'javascript', 'jsx': 'javascript'}

let g:ale_linters = {}
let g:ale_linters['javascript'] = ['prettier_eslint', 'prettier', 'eslint']
let g:ale_linters['jsx'] = ['prettier_eslint', 'prettier', 'eslint']
let g:ale_linters['css'] = ['prettier']

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier_eslint', 'prettier']
let g:ale_fixers['jsx'] = ['prettier_eslint', 'prettier']
let g:ale_fixers['css'] = ['prettier']
let g:ale_fixers['json'] = ['prettier']

" Disable for vendor, node_modules
let g:ale_pattern_options = {
      \  '.*/vendor/*.go': {
      \    'ale_enabled': 0
      \  },
      \  '.*/node_modules/*.js': {
      \    'ale_enabled': 0
      \  },
      \  '.*/public/*.js': {
      \    'ale_enabled': 0
      \  }
      \}

let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --arrow-parens always --bracket-spacing'
let g:ale_jsx_prettier_options = '--single-quote --trailing-comma es5 --arrow-parens always --bracket-spacing'

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '~'

" let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
" let g:ale_completion_enabled = 1


" ----------------------------------------------------------------------------
" ## vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#neomake#enabled = 1
let g:airline_theme = 'nova'
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#cm_call_signature#enabled = 1
if exists('g:airline_extensions')
  let g:airline_extensions = add(g:airline_extensions, 'cm_call_signature')
endif
let g:airline#extensions#ale#enabled = 1


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
  vert new | call termopen(a:cmd) | startinsert
endfunction

let g:test#custom_strategies = {'terminal_split': function('SplitStrategy')}
let g:test#strategy = 'terminal_split'

if expand('%:t') =~ '_spec.js'
  let test#javascript#jest#executable = 'yarn run cypress:run:one'
else
  let test#javascript#jest#executable = 'yarn test'
endif

let g:test#javascript#mocha#file_pattern = ".test.js"
"  `-A` turns on async mode for tests
let g:test#javascript#mocha#options = '-A --compilers js:babel-register --require ignore-styles --require app/javascript/scripts/test-setup.js'

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


" ----------------------------------------------------------------------------
" ## nvim-completion-manager

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Use location list instead of quickfix
let g:LanguageClient_diagnosticsList = 'location'


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

" let g:fzf#proj#project_dir = '~/code'
" let g:fzf#proj#max_proj_depth = 2
" let g:fzf#proj#project#open_new_tab = 0

" let s:project_dir = '~/code'
" let s:project_cmd = "find ".s:project_dir." -maxdepth 3 -name '.git' -printf '%h\n'"
" let s:TYPE = {'dict': type({}), 'funcref': type(function('call')), 'string': type('')}
" let s:edited_cmd = "git status --porcelain"
" let s:diff_master_cmd = "git diff master..HEAD --name-only"

" function! s:grep_files(arg, path, bang)
"   call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" ' . shellescape(a:arg) . ' ' . shellescape(a:path), 1, a:bang)
" endfunction

" function! s:pre_grep(tests, bang)
"   call inputsave()
"   let query = input("search " . (a:tests ? "all" : "code") . " → ")
"   call inputrestore()
"   call s:grep_files(query, a:tests ? "." : "src/", a:bang)
" endfunction

" function! s:open(args)
"   let [_, fname] = a:args
"   if fname =~ " "
"     let [_, fname] = split(fname, ' ')
"   endif
"   exec "silent edit" fname
" endfunction

" function! s:go_to(args)
"   let [data, fname] = a:args
"   exec "tcd" fname
"   exec "silent edit" fname
" endfunction

" function! s:select_projects(bang)
"   return fzf#run(fzf#wrap('projects',{
"    \ 'source':  s:project_cmd,
"    \ 'dir':     s:project_dir,
"    \ 'sink*':   function('s:go_to'),
"    \ 'options': '+m --prompt="Projects → " --header-lines=0 --expect=ctrl-e --tiebreak=index'}, a:bang))
" endfunction

" function! s:git_files(cmd, bang)
"   return fzf#run(fzf#wrap('edited',{
"    \ 'source':  a:cmd,
"    \ 'dir':     getcwd(-1, 0),
"    \ 'sink*':   function('s:open'),
"    \ 'options': '+m --prompt="Files → " --header-lines=0 --expect=ctrl-e --tiebreak=index'}, a:bang))
" endfunction

" command! -bar -bang Grep      call s:pre_grep(0, <bang>0)
" command! -bar -bang GrepAll   call s:pre_grep(1, <bang>0)
" command! -bar -bang Projects  call s:select_projects(<bang>0)
" command! -bar -bang Gstatus   call s:git_files(s:edited_cmd, <bang>0)
" command! -bar -bang Gdiff     call s:git_files(s:diff_master_cmd, <bang>0)


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
" ## vim-minisnip
let g:minisnip_dir = '~/.dotfiles/config/nvim/snippets'
set dictionary=~/.dotfiles/config/nvim/snippets/index.txt


" ----------------------------------------------------------------------------
" ## prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0

" single quotes over double quotes
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'

" put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'false'

" none|es5|all
let g:prettier#config#trailing_comma = 'all'

" avoid/always
let g:prettier#config#arrow_parens = 'always'

" flow|babylon|typescript|postcss
let g:prettier#config#parser = 'flow'


" ----------------------------------------------------------------------------
" ## neoformat
" autocmd BufWritePre *.js silent Neoformat
" let g:neoformat_enabled_javascript = ['prettier']
" let g:neoformat_javascript_prettier = {
"         \ 'exe': 'prettier',
"         \ 'args': ['--trailing-comma es5', '--stdin'],
"         \ 'stdin': 1,
"         \ }
