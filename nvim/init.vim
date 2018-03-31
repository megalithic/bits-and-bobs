" =============================================================================
"
"   ┌┬┐┌─┐┌─┐┌─┐┬  ┬┌┬┐┬ ┬┬┌─┐
"   │││├┤ │ ┬├─┤│  │ │ ├─┤││   :: DOTFILES > vimrc
"   ┴ ┴└─┘└─┘┴ ┴┴─┘┴ ┴ ┴ ┴┴└─┘
"   Brought to you by: Seth Messer / @megalithic
"
" =============================================================================

" vim: set fdm=marker fdl=2 ft=vim sts=2 sw=2 ts=2:

" Automatically download vim-plug, if not present
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" -/ Plugins /--------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

  " ---------------------------------------------------------------------------
  " ## Interface
  Plug 'trevordmiller/nova-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'megalithic/golden-ratio' " vertical split layout manager

  " ---------------------------------------------------------------------------
  " ## JavaScript, et al
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'jsx'] }
  Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx', 'jsx', 'js'] }
  Plug 'flowtype/vim-flow', { 'for': ['javascript', 'javascript.jsx', 'jsx'], 'do': 'npm install -g flow-bin' }
  Plug 'elzr/vim-json', { 'for': ['json'] }
  Plug 'ElmCast/elm-vim', { 'for': ['elm'] }
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'reasonml-editor/vim-reason-plus', { 'for': ['reason'] }

  " ----------------------------------------------------------------------------
  " ## SCSS, CSS, et al
  Plug 'othree/csscomplete.vim', { 'for': ['css', 'scss', 'sass'] } " css completion
  Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss', 'sass'] } " css3-specific syntax
  Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass'] }

  " ----------------------------------------------------------------------------
  " ## HAML, HTML, XML, Markdown, YAML, et al
  Plug 'othree/html5.vim', { 'for': ['html', 'haml'] }
  Plug 'tpope/vim-markdown', { 'for': ['markdown', 'md', 'mdown'] }
  Plug 'jtratner/vim-flavored-markdown', { 'for': ['markdown'] }
  Plug 'martin-svk/vim-yaml', { 'for': ['yaml'] }
  Plug 'tpope/vim-haml', { 'for': ['haml'] }
  Plug 'tyru/markdown-codehl-onthefly.vim', { 'for': ['markdown', 'md', 'mdown'] }
  Plug 'othree/xml.vim', { 'for': ['xml'] }

  " ----------------------------------------------------------------------------
  " ## Ruby, Rails, et al
  Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }
  Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
  Plug 'shougo/vimproc.vim', { 'do': 'make' } | Plug 'osyo-manga/vim-monster', { 'for': ['ruby'], 'do': 'gem install fastri rcodetools' }
  Plug 'tpope/vim-bundler', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
  Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' } " rspec commands and highlight

  " ----------------------------------------------------------------------------
  " ## Git, shell
  Plug 'tpope/vim-git'
  Plug 'tpope/vim-rhubarb' " git :Gbrowse support
  Plug 'tpope/vim-fugitive' " git tools integrated into vim
  Plug 'keith/gist.vim', { 'do': 'chmod -HR 0600 ~/.netrc' }
  Plug 'xolox/vim-misc' | Plug 'xolox/vim-lua-ftplugin', { 'for': ['lua'] } " all the luas
  Plug 'tmux-plugins/vim-tmux', { 'for': ['tmux'] }
  Plug 'vim-scripts/fish.vim',   { 'for': 'fish' }

  " ----------------------------------------------------------------------------
  " ## Utilities
  Plug 'tpope/vim-eunuch'
  Plug 'janko-m/vim-test', {'on': ['TestFile', 'TestLast', 'TestNearest', 'TestSuite', 'TestVisit'] } " tester for js and ruby
  Plug 'w0rp/ale'
  Plug 'tpope/vim-commentary' " (un)comment code
  Plug 'sickill/vim-pasta' " context-aware pasting
  Plug 'jordwalke/VimAutoMakeDirectory' " auto-makes the dir for you if it doesn't exist in the path
  Plug 'tpope/vim-surround' " surrounds things with things
  " -- {Visual}S<arg> surrounds selection
  " -- cs/ds<arg1><arg2> change / delete
  " -- ys<obj><arg> surrounds text object
  " -- yss<arg> for entire line
  Plug 'tpope/vim-repeat' " repeats plugin-execution mappings as well, with `.`
  Plug 'Valloric/MatchTagAlways', { 'for': ['html', 'xml', 'erb'] } " highlights the opening/closing tags for the block you're in
  Plug 'jiangmiao/auto-pairs'
  Plug 'cohama/lexima.vim' " auto-closes many delimiters and can repeat with a `.`
  Plug 'junegunn/rainbow_parentheses.vim' " nicely colors nested pairs of [], (), {}
  Plug 'tpope/vim-ragtag', { 'for': ['html', 'xml', 'erb'] } " a set of mappings for several langs: html, xml, erb, php, more
  Plug 'docunext/closetag.vim' " will auto-close the opening tag as soon as you type </
  Plug 'tpope/vim-endwise'
  Plug 'zenbro/mirror.vim' " allows mirror'ed editing of files locally, to a specified ssh location via ~/.mirrors
  Plug 'sbdchd/neoformat'

  " ----------------------------------------------------------------------------
  " ## Code Navigation
  Plug 'christoomey/vim-tmux-navigator' " needed for tmux/hotkey integration with vim
  Plug 'christoomey/vim-tmux-runner' " needed for tmux/hotkey integration with vim
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'unblevable/quick-scope' " highlights f/t type of motions, for quick horizontal movements
  Plug 'EinfachToll/DidYouMean'
  Plug 'haya14busa/is.vim'
  Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' } " :substitute preview
  Plug 'Konfekt/FastFold'
  " Plug 'mattn/emmet-vim'

  Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'autozimu/LanguageClient-neovim', {
  "   \ 'branch': 'next',
  "   \ 'do': 'bash install.sh',
  "   \ }

  " Plug 'roxma/nvim-completion-manager', { 'do': ':UpdateRemotePlugins' }
  " Plug 'roxma/nvim-cm-tern',  {'do': 'npm install', 'for': ['javascript']}
  " Plug 'roxma/ncm-elm-oracle', { 'for': ['elm'] }
  " Plug 'roxma/ncm-rct-complete', { 'for': ['ruby', 'erb'] }

  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/echodoc.vim'
  Plug 'pbogut/deoplete-elm'
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'mhartington/nvim-typescript', { 'do': 'npm install -g typescript' }

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Plug 'epilande/vim-es2015-snippets'
  " Plug 'epilande/vim-react-snippets'
  " Plug 'SirVer/ultisnips'

  " ----------------------------------------------------------------------------
  " ## Text Objects, et al
  Plug 'kana/vim-operator-user'
  " -- provide ai and ii for indent blocks
  " -- provide al and il for current line
  " -- provide a_ and i_ for underscores
  " -- provide a- and i-
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-indent' " Indent text object (vii)
  Plug 'kana/vim-textobj-line' " Line text object (vil)
  Plug 'kana/vim-textobj-entire' " Entire buffer text object (vae)
  Plug 'nelstrom/vim-textobj-rubyblock' " Ruby block text object (vir)
  Plug 'kana/vim-textobj-function' " Function text object (vaf)
  Plug 'glts/vim-textobj-comment' " Comment text object (vac)
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'wellle/targets.vim' " Improved targets line cin) next parens
  " ^--- https://github.com/wellle/targets.vim/blob/master/cheatsheet.md

call plug#end()

" Enable built-in matchit plugin
runtime macros/matchit.vim


" -/ General Settings /---------------------------------------------

" -----------------------------------------------------------------------------
" ## UI
syntax enable

if has('nvim')
  " let ayucolor="light"  " for light version of theme
  " let ayucolor="dark"   " for dark version of theme
  " let ayucolor="mirage" " for mirage version of theme
  " let g:jellybeans_overrides = {
  "       \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
  "       \}
  " let g:oceanic_next_terminal_italic = 1
  " let g:oceanic_next_terminal_bold = 1


  set termguicolors
  set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

  colorscheme nova

  set background=dark

  let os=substitute(system('uname'), '\n', '', '')
  if os == 'Darwin' || os == 'Mac'
    let g:python3_host_prog='/usr/local/bin/python3'
  elseif os == 'Linux'
    let g:python3_host_prog='/usr/bin/python3'
  endif

  let g:python3_host_skip_check = 1
else
  colorscheme nova

  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
endif

if has('termguicolors')
  " Don't need this in xterm-256color, but do need it inside tmux.
  " (See `:h xterm-true-color`.)
  if &term =~# 'tmux-256color'
    let &t_8f="\e[38;2;%ld;%ld;%ldm"
    let &t_8b="\e[48;2;%ld;%ld;%ldm"
  endif
endif

set re=1 " Updated vim regex engine

" function! s:statusline_expr()
"   let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
"   let ro  = "%{&readonly ? '[RO] ' : ''}"
"   let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
"   let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
"   let sep = ' %= '
"   let pos = ' %-12(%l : %c%V%) '
"   let pct = ' %P'

"   return '[%n] %F %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
" endfunction
" let &statusline = s:statusline_expr()

filetype plugin on
filetype indent on

" -----------------------------------------------------------------------------
" ## Layout
set linebreak
set textwidth=79 " will auto wrap content when set
set nowrap " `on` is 'wrap'
set wrapscan

" :Hardwrap    -  turns on hardwrapping
" :Nohardwrap  -  turns it off
command! Hardwrap set fo=want tw=80 nowrap
command! Nohardwrap set fo=croq wrap linebreak nolist

set synmaxcol=400 " turn off syntax highlight beyond 500 chars
set showcmd " show incomplete commands
set ruler " show the cursor position all the time
set signcolumn=auto
set scrolloff=5
set sidescroll=1
set sidescrolloff=10
set scroll=3
set lazyredraw "may be the cause of lots of issues
set ttyfast

" NOTE: also handled in autocommands.vim
" set cul " turn on cursorline highlighting -- needed for linenumber HL too

set listchars=tab:▸\ ,eol:¬,extends:›,precedes:‹,trail:·,nbsp:⚋
set fillchars=vert:│
set diffopt=filler " Add vertical spaces to keep right and left aligned.
set diffopt+=iwhite " Ignore whitespace changes.
set noerrorbells
set novisualbell
set number relativenumber
set splitbelow
set splitright
set noshowmode
set noshowcmd

" -----------------------------------------------------------------------------
" ## Behavior
" Swaps / Backups / Sessions / History
set undofile
set undodir=~/tmp/nvim/undo
set undolevels=1000
set undoreload=1000
set nobackup
set nowritebackup
set noswapfile
set sessionoptions-=options " Do not save settings and mappings to sessions
set autowriteall " saves buffers as you create or switch

" -----------------------------------------------------------------------------
" ## Folding
if has('folding')
  if has('windows')
    " let &fillchars='vert: '           " less cluttered vertical window separators
  endif
  set foldmethod=indent               " not as cool as syntax, but faster
  set foldlevelstart=99               " start unfolded
endif
" set nofoldenable        "dont fold by default
" set foldmethod=indent   "fold based on indent
" set foldnestmax=5      "deepest fold is 5 levels
" set foldlevel=99
" set foldlevelstart=0
" set fcs=fold:-
let ruby_fold = 2
let javascript_fold = 2

" -----------------------------------------------------------------------------
" ## Indentions
set smartindent
set cindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" -----------------------------------------------------------------------------
" ## Grepping / Searching
set ignorecase
set smartcase
set showmatch
set gdefault " assume the /g flag is on in :s substitutions
set hlsearch

" -----------------------------------------------------------------------------
" ## Completions
set omnifunc=syntaxcomplete#Complete " Set omni-completion method.
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d
" set completeopt=menu,menuone,longest,noinsert
set completeopt=menu,menuone
set completeopt-=preview
set completeopt+=noselect " @mhartington
" set completeopt+=noinsert " me.. :(
" set complete-=i "don't complete in included files

" -----------------------------------------------------------------------------
" ## Ignores
set wildmode=list:longest
set wildmode=longest:full,full
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/expert/*,*/solr/*,*/dist/*,*/bower_components/*,*/cf/*
set wildignore+=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildignore+=*.aux,*.out,*.toc                " latex intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " vim swap files
set wildignore+=*.ds_store                       " osx
set wildignore+=*.luac                           " lua byte code
set wildignore+=migrations                       " django migrations
set wildignore+=*.pyc                            " python byte code
set wildignore+=*.orig                           " merge resolution files
set wildignore+=classes
set wildignore+=lib

" -----------------------------------------------------------------------------
" ## Clipboard
if empty($SSH_CONNECTION) && has('clipboard')
  set clipboard=unnamed  " Use clipboard register

  " Share X windows clipboard. NOT ON NEOVIM -- neovim automatically uses
  " system clipboard when xclip/xsel/pbcopy are available.
  if has('nvim') && !has('mac')
    set clipboard=unnamedplus
  elseif has('unnamedplus')
    set clipboard+=unnamedplus
  endif
endif

" if has("clipboard")                   " If the feature is available
"   set clipboard=unnamed               " copy to the system clipboard
"   " add system clipboard support
"   " set clipboard+=unnamed

"   if has("unnamedplus")
"     set clipboard+=unnamedplus
"   endif
" endif

" -----------------------------------------------------------------------------
" ## File handling
set autowrite
set fileformats=unix,mac,dos
set fileformat=unix
setglobal fenc=utf-8    " Default file encoding for new files
set enc=utf-8           " Internal encoding used by buffers, help and commands
set enc=utf8           " Internal encoding used by buffers, help and commands
set tenc=utf-8          " Terminal encoding used for terminal display
set tenc=utf8          " Terminal encoding used for terminal display
" set guifont=DroidSansMono_Nerd_Font:h11

" -----------------------------------------------------------------------------
" ## Mode changes speedups
set notimeout
set ttimeout
set ttimeoutlen=2
set timeoutlen=2
" set timeout timeoutlen=500 ttimeoutlen=100

" -----------------------------------------------------------------------------
" ## Misc
set matchtime=3
set showbreak=↪
set report=0 " Show all changes.
set hidden
set shiftround
set formatoptions=qorn1 " automatic formating.
set shortmess=catI " don't show the intro message when starting vim.
set matchpairs+=<:>
set virtualedit+=block
set magic
set mat=2
set re=1
set tm=500
set dictionary+=/usr/share/dict/words
set nospell             " Disable spellchecking by default
set spelllang=en_us,en_gb
set spellfile=~/.config/nvim/spell/en.utf-8.add
let loaded_matchparen = 0 " this turns on pair matching highlight (is slow with this on)

" if more than 1 files are passed to vim as arg, open them in vertical splits
if argc() > 1
  silent vertical all
endif

" -----------------------------------------------------------------------------
" ## Enable per-folder vim settings
set exrc
set secure " disable unsafe commands in local .vimrc files


" -/ Abbreviations/Spelling /------------------------------------------------
" Autocorrect my common typos in insert-mode
iab Connectiosn Connections
iab Cound Could
iab SOme Some
iab THat That
iab THe The
iab THere There
iab THerefore Therefore
iab THese These
iab THis This
iab THose Those
iab WHen When
iab connectiosn connections
iab cound could
iab functino function
iab indentatino indentation
iab optiosn options
iab taht that
iab teh the
iab itinirary itinerary
iab itinarary itinerary
iab acheivement achievement
iab acheivements achievements
iab acheivment achievement
iab acheivments achievements
iab dashbaord dashboard
iab Dashbaord Dashboard
iab dashbarod dashboard
iab Dashbarod Dashboard
iab canavs canvas


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
" ## auto-pairs
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsMapCR = 0 " https://www.reddit.com/r/neovim/comments/4st4i6/making_ultisnips_and_deoplete_work_together_nicely/d6m73rh/


" ----------------------------------------------------------------------------
" ## linting (neomake/ale)
let g:ale_enabled = 1
let g:ale_linter_aliases = {'javascript.jsx': 'javascript', 'jsx': 'javascript'}
let g:ale_fixer_aliases = {'javascript.jsx': 'javascript', 'jsx': 'javascript'}
let g:ale_javascript_prettier_use_local_config = 1

let g:ale_linters = {}
let g:ale_linters['javascript'] = ['prettier', 'eslint']
let g:ale_linters['jsx'] = ['prettier', 'eslint']
let g:ale_linters['css'] = ['prettier']
let g:ale_linters['json'] = ['prettier']

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['jsx'] = ['prettier']
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
let g:ale_typescript_prettier_options = '--single-quote --trailing-comma es5 --arrow-parens always --bracket-spacing'
let g:ale_jsx_prettier_options = '--single-quote --trailing-comma es5 --arrow-parens always --bracket-spacing'

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '~'

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1


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
" ## nvim-typescript
" let g:nvim_typescript#max_completion_detail=100
" let g:nvim_typescript#completion_mark=''
" " let g:nvim_typescript#default_mappings=1
" " let g:nvim_typescript#type_info_on_hold=1
" let g:nvim_typescript#javascript_support=1
" let g:nvim_typescript#vue_support=1
" let g:nvim_typescript#kind_symbols = {
"     \ 'keyword': 'keyword',
"     \ 'class': '',
"     \ 'interface': '',
"     \ 'script': 'script',
"     \ 'module': '',
"     \ 'local class': 'local class',
"     \ 'type': '',
"     \ 'enum': '',
"     \ 'enum member': '',
"     \ 'alias': '',
"     \ 'type parameter': 'type param',
"     \ 'primitive type': 'primitive type',
"     \ 'var': '',
"     \ 'local var': '',
"     \ 'property': '',
"     \ 'let': '',
"     \ 'const': '',
"     \ 'label': 'label',
"     \ 'parameter': 'param',
"     \ 'index': 'index',
"     \ 'function': '',
"     \ 'local function': 'local function',
"     \ 'method': '',
"     \ 'getter': '',
"     \ 'setter': '',
"     \ 'call': 'call',
"     \ 'constructor': '',
"     \}


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
let test#ruby#rspec#options = '-f d'
let test#ruby#bundle_exec = 1


" ----------------------------------------------------------------------------
" ## list-toggle
let g:lt_location_list_toggle_map = '<F3>'
let g:lt_quickfix_list_toggle_map = '<F4>'


" ----------------------------------------------------------------------------
" ## incsearch.vim
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
let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ts=typescript', 'tsx=typescript', 'ruby', 'sass', 'xml', 'html', 'bash=sh', 'sh', 'scss', 'zsh']
let g:vim_markdown_frontmatter=1


" ----------------------------------------------------------------------------
" ## quick-scope
let g:qs_enable = 0


" ----------------------------------------------------------------------------
" ## deoplete
let g:deoplete#enable_at_startup = 1


" ----------------------------------------------------------------------------
" ## nvim-completion-manager
let g:cm_smart_enable=0


" ----------------------------------------------------------------------------
" ## languageclient
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
      \ 'typescript',
      \ 'javascript.jsx',
      \ 'vue'
      \ ]
let g:tern_show_argument_hints = 'on_hold' "on_move
let g:tern_show_signature_in_pum = '1' " disables full signature type on autocomplete
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


" ----------------------------------------------------------------------------
" ## UTILS

" Rename current file or even move it to another location
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
" nnoremap <leader>r :call RenameFile()<cr>

" Used by Fugitive
function! BufReadIndex()
  " Use j/k in status
  setlocal nohlsearch
  nnoremap <buffer> <silent> j :call search('^#\t.*','W')<Bar>.<CR>
  nnoremap <buffer> <silent> k :call search('^#\t.*','Wbe')<Bar>.<CR>
endfunction

" Used by Fugitive
function! BufEnterCommit()
  " Start in insert mode for commit
  normal gg0
  if getline('.') == ''
    start
  end

  let b:deoplete_disable_auto_complete=1
  let b:deoplete_ignore_sources = ['buffer']
  set spell
  set spelllang=en
endfunction

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
function! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunction

" prevent replacing paste buffer on paste:
" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction

" QuickScope, used in conjunction with keybinding overrides
function! Quick_scope_selective(movement)
  let needs_disabling = 0
  if !g:qs_enable
    QuickScopeToggle
    redraw
    let needs_disabling = 1
  endif

  let letter = nr2char(getchar())

  if needs_disabling
    QuickScopeToggle
  endif

  return a:movement . letter
endfunction

" ---------------
" Quick spelling fix (first item in z= list)
function! QuickSpellingFix()
  if &spell
    normal 1z=
  else
    " Enable spelling mode and do the correction
    set spell
    normal 1z=
    set nospell
  endif
endfunction
command! QuickSpellingFix call QuickSpellingFix()

" Run current file
function! RunCurrentFile() abort
  if &filetype ==? 'ruby'
    let l:command = 'ruby %'
  elseif &filetype ==? 'sh'
    let l:command = 'sh %'
  elseif &filetype ==? 'js'
    let l:command = 'node %'
  else
    echom "Can't run current file (unsupported filetype: " . &filetype . ')'
  endif

  if exists('command')
    execute ':terminal ' . l:command
  endif
endfunction


" -/ Autocommands /----------------------------------------------
augroup vimrcEx
  au!

  " auto save on focuslost
  " au FocusLost * :wa

  " ----------------------------------------------------------------------------
  " ## Auto-source vim config files
  " autocmd BufWritePost *.vim,*.vimrc so $MYVIMRC

  " ----------------------------------------------------------------------------
  " ## Handle window resizing
  au VimResized * execute "normal! \<c-w>="

  " ----------------------------------------------------------------------------
  " ## Handle auto-closing of quickfix buffer
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif

  " No formatting on o key newlines
  au BufNewFile,BufEnter * set formatoptions-=o

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
  " Delete trailing whitespace on write
  au BufWrite * silent if &ft!~?'markdown'|:call DeleteTrailingWS()|endif


"   " ----------------------------------------------------------------------------
"   " ## Deoplete
"   " NOTE: some of these have been moved to settings.vim#deoplete and
"   " keys.vim#deoplete
"   " au InsertLeave,CompleteDone,CursorMovedI * if pumvisible() == 0 | pclose | endif

"   " au VimEnter * call deoplete#enable_logging('DEBUG', expand('~/.config/nvim/deoplete.log'))
"   " au VimEnter * call deoplete#custom#set('_', 'converters',
"   "       \ ['converter_auto_paren', 'converter_remove_overlap'])
"   " au VimEnter * call deoplete#custom#set('vim', 'converters',
"   "       \ ['add_vim_versions'])
"   " au VimEnter * call deoplete#custom#set('_', 'matchers', ['matcher_fuzzy'])
augroup END

" " -/ Filetypes/Syntax /-------------------------------------------------------
augroup ft_javascript
  au!
  au BufRead *.jsx set filetype=javascript
  au FileType javascript highlight xmlAttrib cterm=italic
  au BufRead,BufNewFile .{babel,eslint,prettier,stylelint,jshint,jscs}*rc,\.tern-*,*.json set ft=json
  au BufNewFile,BufRead .tern-project set ft=json
  au FileType javascript iabbrev class== className=

  " autocmd BufWritePost,BufEnter * Neomake
  " au BufWritePre client/**/*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync

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
  au BufEnter,BufNewFile,BufRead,BufReadPost *.scss,*.css set ft=scss.css
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
  " autocmd BufWritePost *.sh,*.scss,*.less,*.css,*.vim,*.vimrc,*.txt,*.md make!
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


" -/ Keybindings /------------------------------------------------
let mapleader=","
let maplocalleader="\\"

nnoremap <c-s> :source $MYVIMRC<cr>

" Toggle fold at current position.
" (Using s-tab to avoid collision between <tab> and <C-i>).
nnoremap <s-tab> za

" ----------------------------------------------------------------------------
" ## Autoformat
nnoremap <F3> :Neoformat<CR>

" ----------------------------------------------------------------------------
" ## Autoformat
nnoremap <F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" ----------------------------------------------------------------------------
" ## Tabbing for completions:
if has('nvim')
  " deoplete ---
  " autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

  " ---
  " deoplete + neosnippets
  " ---
  " Ref: https://github.com/mhartington/dotfiles/blob/master/config/nvim/init.vim#L512
  " imap <C-k> <Plug>(neosnippet_expand_or_jump)
  " smap <C-k> <Plug>(neosnippet_expand_or_jump)
  " xmap <C-k> <Plug>(neosnippet_expand_target)

  " https://www.reddit.com/r/neovim/comments/4st4i6/making_ultisnips_and_deoplete_work_together_nicely/d6m73rh/
  " imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  " imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
  " inoremap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>"

  " ---
  " nvim-completion-manager
  " ---
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

  let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
  inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
endif


" ----------------------------------------------------------------------------
" ## FZF
nnoremap <silent> <leader>m <esc>:FZF<cr>
nnoremap <leader>a <esc>:Rg<space>
nnoremap <silent> <leader>A  <esc>:exe('Rg '.expand('<cword>'))<cr>

" Backslash as shortcut to ag
nnoremap \ :Rg<SPACE>

" " Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')

function! s:fzf_root()
  let path = finddir(".git", expand("%:p:h").";")
  return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
endfunction

function! s:git_grep_handler(line)
  let parts = split(a:line, ':')
  let [f, l] = parts[0 : 1]
  exe 'e +' . l . ' `git rev-parse --show-toplevel`/'
        \. substitute(f, ' ', '\\ ', 'g')
endfunction

command! -nargs=+ GGrep call fzf#run({
      \ 'source':
      \ '(cd "$(git rev-parse --show-toplevel)" && git grep --color=always -niI --untracked "<args>")',
      \ 'sink': function('<sid>git_grep_handler'),
      \ 'options': '--ansi --multi',
      \ })

" ----------------------------------------------------------------------------
" ## Commenting
nmap <leader>c :Commentary<cr>
vmap <leader>c :Commentary<cr>

" ----------------------------------------------------------------------------
" ## vim-plug
noremap <F5> :PlugUpdate<cr>
map <F5> :PlugUpdate<cr>
noremap <S-F5> :PlugClean!<cr>
map <S-F5> :PlugClean!<cr>

" ----------------------------------------------------------------------------
" ## QuickScope
nnoremap <expr> <silent> f Quick_scope_selective('f')
nnoremap <expr> <silent> F Quick_scope_selective('F')
nnoremap <expr> <silent> t Quick_scope_selective('t')
nnoremap <expr> <silent> T Quick_scope_selective('T')
vnoremap <expr> <silent> f Quick_scope_selective('f')
vnoremap <expr> <silent> F Quick_scope_selective('F')
vnoremap <expr> <silent> t Quick_scope_selective('t')
vnoremap <expr> <silent> T Quick_scope_selective('T')

" ----------------------------------------------------------------------------
" ## Fugitive
nnoremap <leader>H :Gbrowse<cr>
vnoremap <leader>H :Gbrowse<cr>
nnoremap <leader>gb :Gblame<cr>

" ----------------------------------------------------------------------------
" ## Testing vim-test
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>T :TestNearest<CR>
" nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
" ref: https://github.com/Dkendal/dot-files/blob/master/nvim/.config/nvim/init.vim

" ----------------------------------------------------------------------------
" ## Gist/Github
" Send visual selection to gist.github.com as a private, filetyped Gist
" Requires the gist command line too (brew install gist)
vnoremap <leader>G :Gist -po<cr>

" ----------------------------------------------------------------------------
" ## Surround
vmap [ S]
vmap ( S)
vmap { S}
vmap ' S'
vmap " S"

" ----------------------------------------------------------------------------
" ## Splits with vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1
" nnoremap <silent> <BS>  :TmuxNavigateLeft<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>
nnoremap <C-o> :vnew<cr>:e<space><c-d>
nnoremap <C-t> :tabe<cr>:e<space><c-d>

if(has('nvim'))
  tnoremap <C-w>h <C-\><C-n><C-w><C-h>
  tnoremap <C-w>j <C-\><C-n><C-w><C-j>
  tnoremap <C-w>k <C-\><C-n><C-w><C-k>
  tnoremap <C-w>l <C-\><C-n><C-w><C-l>
endif

inoremap <C-w>h <ESC><C-w><C-h>
inoremap <C-w>j <ESC><C-w><C-j>
inoremap <C-w>k <ESC><C-w><C-k>
inoremap <C-w>l <ESC><C-w><C-l>

" ----------------------------------------------------------------------------
" ## Code Formatting
map <leader>pj :%!python -m json.tool<CR>
map <leader>px :%!xmllint % --format<CR>

" ----------------------------------------------------------------------------
" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<cr>

" ----------------------------------------------------------------------------
" ## Quick edit of certain files
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>ez :vsplit ~/.zshrc<cr>
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>

" ## Motions
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Kill arrow keys
nnoremap <Left> <nop>
nnoremap <Right> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>

" this always does annoying things for some reason, so stop it
noremap K <nop>

" stop changing casing when in visual mode
vnoremap u <nop>

" ## Writing / quitting
nnoremap <silent> <leader>w :w<cr>
nnoremap <leader>q :q<cr>
" Sudo write (,W)
noremap <silent><leader>W :w !sudo tee %<CR>

" ## Vim process management
" background VIM
vnoremap <c-z> <esc>zv`<ztgv

nnoremap / /\v
vnoremap / /\v

" clear incsearch term
nnoremap  <silent><ESC> :syntax sync fromstart<cr>:nohlsearch<cr>:redrawstatus!<cr><ESC>

" Start substitute on current word under the cursor
nnoremap ,s :%s///gc<Left><Left><Left>

" Start search on current word under the cursor
nnoremap ,/ /<CR>

" Start reverse search on current word under the cursor
nnoremap ,? ?<CR>

" Keep search matches in the middle of the window.
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv
vnoremap <silent> n nzzzv
vnoremap <silent> N Nzzzv

" Keep search matches jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Search and replace word under cursor (,*)
" nnoremap <leader>fr :%s/\<<C-r><C-w>\>//<Left>
nnoremap <leader>fr :%s#\<<C-r>=expand("<cword>")<CR>\>#
" Use word under cursor into lhs of a substitute (for quick search and replace)
nnoremap <leader>r :%s/\<<C-r>=expand("<cword>")<CR>\>/

" Faster sort
vnoremap ,s :!sort<CR>

" ## Yank/Paste
" More logical Y (default was alias for yy)
nnoremap Y y$
" Don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc
" After block yank and paste, move cursor to the end of operated text and don't override register
vnoremap y y`]
vnoremap p "_dP`]
nnoremap p p`]
" Yank and paste from clipboard
nnoremap ,y "+y
vnoremap ,y "+y
nnoremap ,yy "+yy
nnoremap ,p "+p

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

" Fix the cw at the end of line bug default vim has special treatment (:help cw)
nmap cw ce
nmap dw de

" ## Convenience rebindings
noremap  <Leader>; :!
noremap  <Leader>: :<Up>

" remap q for recording to Q
nnoremap Q q
nnoremap q <Nop>


" allow deleting selection without updating the clipboard (yank buffer)
vnoremap x "_x
vnoremap X "_X

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_

" make the tab key match bracket pairs
silent! unmap [%
silent! unmap ]%
map <tab> %
noremap <tab> %
nnoremap <tab> %
vnoremap <tab> %
" Better mark jumping (line + col)
nnoremap ' <nop>
" Remap VIM 0 to first non-blank character
map 0 ^

" ## Selections
" reselect pasted content:
nnoremap gV `[v`]
" select all text in the file
nnoremap <leader>v ggVG
" Easier linewise reselection of what you just pasted.
nnoremap <leader>V V`]
" duplicate whatever’s selected, to the next line
vmap D y'>p

" ## Indentions
" Indent/dedent/autoindent what you just pasted.
nnoremap <lt>> V`]<
nnoremap ><lt> V`]>
nnoremap =- V`]=
" Reindent the whole document and keep the cursor in the same location
nnoremap <C-=> mqHmwgg=G`wzt`q
nnoremap <leader>= mqHmwgg=G`wzt`q
nnoremap <leader>G mqHmwgg=G`wzt`q
" Format entire file
nmap <leader>fef ggVG=

" ## Misc (organize this please!)
" Insert newline below
nnoremap <cr><cr> o<ESC>
" push newline
nnoremap <S-CR>   mzO<Esc>j`z
nnoremap <C-CR>   mzo<Esc>k`z
" spawn newline
inoremap <S-CR>     <C-O>O
inoremap <C-CR>     <C-O>o

" Toggle 'keep current line in the center of the screen' mode
nnoremap <leader>C :let &scrolloff=999-&scrolloff<cr>
"
" gi already moves to 'last place you exited insert mode', so we'll map gI to
" something similar: move to last change
nnoremap gI `.

" Make D behave
nnoremap D d$

" Delete a line and not keep it in a register
nnoremap X Vx

" Insert Mode Completion
inoremap <c-f> <c-x><c-f>
inoremap <c-]> <c-x><c-]>

" Redraw my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

" Select (charwise) the contents of the current line, excluding indentation.
" Great for pasting Python lines into REPLs.
nnoremap vv ^vg_

" ## Join and Split Lines
" Keep the cursor in place while joining lines
nnoremap J mzJ`z
" Split line (sister to [J]oin lines above)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Insert mode movements
" Ctrl-e: Go to end of line
inoremap <c-e> <esc>A
" Ctrl-a: Go to begin of line
inoremap <c-a> <esc>I

nnoremap <F8> RunCurrentFile()

" jump between each ALE marker (error/warning/etc)
nmap <silent> <leader>ej :ALENext<cr>
nmap <silent> <leader>ek :ALEPrevious<cr>

" https://github.com/hkupty/dotfiles/blob/master/nvim/nvim/keybindings.vim
nmap <leader>S :exec "let cft=&ft \| edit scratchpad \| let &ft=cft"<CR>


" -/ Highlighting /------------------------------------------------
function! s:after_colorscheme()
  " Make spelling problems easier to read.
  hi clear SpellBad
  hi clear SpellCap
  hi clear SpellLocal
  hi clear SpellRare

  hi SpellBad cterm=underline
  hi SpellCap cterm=underline
  hi SpellLocal cterm=underline
  hi SpellRare cterm=underline

  hi link ALEWarningSign Question
  hi ALEErrorSign guifg=#DF8C8C
  hi ALEWarningSign guifg=#F2C38F

  " Fix splits
  hi VertSplit ctermbg=NONE guibg=NONE

  " Make conceal look better.
  hi Conceal cterm=bold ctermbg=NONE ctermfg=67

  hi Comment cterm=italic
  hi htmlArg cterm=italic
  hi xmlAttrib cterm=italic
  hi Type cterm=italic
  hi Normal ctermbg=none
  hi Comment cterm=italic term=italic gui=italic

  hi Search gui=underline term=underline cterm=underline ctermfg=232 ctermbg=230 guibg=#afaf87 guifg=#333333
  hi IncSearchCursor ctermfg=232 ctermbg=214 guifg=232 guibg=214
  hi Errors ctermbg=red guibg=red ctermfg=white guifg=white term=bold gui=bold
  " hi ColorColumn ctermbg=bg ctermfg=235 cterm=NONE guibg=bg guifg=#262626 gui=NONE
  " hi signColumn ctermbg=bg ctermfg=230 cterm=NONE guibg=bg guifg=#ffffd7 gui=NONE
  " hi LineNr ctermbg=bg ctermfg=137 cterm=NONE guibg=bg guifg=#af875f gui=NONE
  hi ColorColumn ctermbg=black ctermfg=235 cterm=NONE guibg=#444444 guifg=#262626 gui=NONE
  " hi signColumn ctermbg=bg ctermfg=230 cterm=NONE guibg=bg guifg=#ffffd7 gui=NONE
  " hi CursorLine ctermbg=235 ctermfg=NONE cterm=NONE guibg=#262626 guifg=NONE gui=NONE

  hi LineNr guibg=#3C4C55 guifg=#937f6e gui=NONE
  hi CursorLineNr ctermbg=black ctermfg=223 cterm=NONE guibg=#333333 guifg=#db9c5e gui=bold
  hi qfLineNr ctermbg=black ctermfg=95 cterm=NONE guibg=black guifg=#875f5f gui=NONE

  " ref: https://github.com/aslijiasheng/jacksonvimrc/blob/0a3421a10282bafffa1c660c40cc61b1a44671a1/vimrc/jackson/plugin.vim#L846
  hi Pmenu    gui=NONE    guifg=#c5c8c6 guibg=#373b41
  hi PmenuSel gui=reverse guifg=#c5c8c6 guibg=#373b41
  hi PmenuSbar ctermbg=255

  hi VendorPrefix guifg=#00ffff gui=bold
  match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/

  " Highlight VCS conflict markers
  match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
endfunction

augroup after_colorscheme
  au!
  call s:after_colorscheme()
  au ColorScheme * call s:after_colorscheme()
augroup END


" a wealth of solid neovim info: https://github.com/justinmk/config/blob/master/.config/nvim/init.vim
