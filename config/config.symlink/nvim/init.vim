" =============================================================================
"
"   ┌┬┐┌─┐┌─┐┌─┐┬  ┬┌┬┐┬ ┬┬┌─┐
"   │││├┤ │ ┬├─┤│  │ │ ├─┤││   :: DOTFILES > vimrc
"   ┴ ┴└─┘└─┘┴ ┴┴─┘┴ ┴ ┴ ┴┴└─┘
"   Brought to you by: Seth Messer / @megalithic
"
" =============================================================================
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" -/ Plugins #plugins /--------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

  " ---------------------------------------------------------------------------
  " ## Interface
  Plug 'snooc/base16-vim'
  Plug 'mhartington/oceanic-next'
  Plug 'joshdick/onedark.vim'
  Plug 'megalithic/golden-ratio'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'benekastah/neomake', { 'on': ['Neomake'] }

  " ---------------------------------------------------------------------------
  " ## JavaScript, et al
  Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'jelera/vim-javascript-syntax', { 'for': ['javascript', 'javascript.jsx'] }
  " Plug 'gavocanov/vim-js-indent'
  Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'sheerun/vim-json', { 'for': ['json'] }
  Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm i -g tern' }
  Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm i' }
  Plug 'kchmck/vim-coffee-script', { 'for': ['json'] }

  " ----------------------------------------------------------------------------
  " ## SCSS, CSS, et al
  Plug 'othree/csscomplete.vim', { 'for': ['css', 'scss', 'sass'] }
  Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss', 'sass'] }
  Plug 'cakebaker/scss-syntax.vim', { 'for': ['css', 'scss', 'sass'] }
  Plug 'othree/svg-properties-syntax.vim'
  Plug 'kewah/vim-cssfmt', { 'on':  ['Cssfmt', 'CssfmtVisual'] }
  Plug 'stephenway/postcss.vim', { 'for': ['css', 'scss', 'sass'] }

  " ----------------------------------------------------------------------------
  " ## HAML, HTML, XML, Markdown, YAML, et al
  Plug 'othree/html5.vim', { 'for': ['html'] }
  Plug 'othree/xml.vim', { 'for': ['xml'] }
  Plug 'tpope/vim-markdown', { 'for': ['markdown', 'md', 'mdown'] }
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'ingydotnet/yaml-vim', { 'for': ['yaml'] }
  Plug 'tpope/vim-haml', { 'for': ['haml', 'sass', 'scss'] }

  " ----------------------------------------------------------------------------
  " ## Ruby, Rails, et al
  Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }
  Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
  Plug 'tpope/vim-bundler', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }

  " ----------------------------------------------------------------------------
  " ## Misc, Other, et al
  Plug 'tpope/vim-git'
  Plug 'tpope/vim-fugitive'
  Plug 'jreybert/vimagit'
  Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
  Plug 'tejr/vim-tmux', { 'for': ['tmux'] }
  Plug 'honza/dockerfile.vim', { 'for': ['dockerfile', 'docker'] }
  Plug 'ElmCast/elm-vim', { 'for': ['elm'] }
  Plug 'xolox/vim-misc' | Plug 'xolox/vim-lua-ftplugin', { 'for': ['lua'] }

  " ----------------------------------------------------------------------------
  " ## Utilities
  Plug 'tpope/vim-commentary'
  Plug 'sickill/vim-pasta'
  Plug 'Chiel92/vim-autoformat'
  Plug 'jordwalke/VimAutoMakeDirectory'
  Plug 'Raimondi/delimitMate'
  Plug 'tpope/vim-surround'
  " - {Visual}S<arg> surrounds selection
  " - cs/ds<arg1><arg2> change / delete
  " - ys<obj><arg> surrounds text object
  " - yss<arg> for entire line
  Plug 'tpope/vim-repeat'
  Plug 'janko-m/vim-test'
  Plug 'Valloric/MatchTagAlways', { 'for': ['html', 'erb'] }
  Plug 'cohama/lexima.vim'
  Plug 'luochen1990/rainbow'
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'tpope/vim-ragtag', { 'for': ['html', 'xml', 'erb'] }
  Plug 'docunext/closetag.vim'
  Plug 'tpope/vim-endwise'
  Plug 'zenbro/mirror.vim'

  " ----------------------------------------------------------------------------
  " ## Code Navigation
  Plug 'ap/vim-readdir'
  Plug 'christoomey/vim-tmux-navigator' " needed for tmux/hotkey integration with vim
  Plug 'christoomey/vim-tmux-runner' " needed for tmux/hotkey integration with vim
  Plug 'haya14busa/incsearch.vim'
  Plug 'unblevable/quick-scope' " highlights f/t type of motions
  Plug 'jonmorehouse/vim-nav'
  Plug 'EinfachToll/DidYouMean'
  Plug 'mileszs/ack.vim'
  Plug 'ervandew/supertab'
  function! HandleRemotePluginUpdates(arg)
    UpdateRemotePlugins
  endfunction
  Plug 'shougo/deoplete.nvim', { 'do': function('HandleRemotePluginUpdates') }
  Plug 'Konfekt/FastFold' " deoplete wants this for some reason :/
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'FelikZ/ctrlp-py-matcher'
  Plug 'kopischke/vim-fetch' " open file at column/line number

  " ----------------------------------------------------------------------------
  " ## Text Objects, et al
  Plug 'kana/vim-operator-user'
  " provide ai and ii for indent blocks
  " provide al and il for current line
  " provide a_ and i_ for underscores
  " provide a- and i-
  Plug 'kana/vim-textobj-user'
        \| Plug 'kana/vim-textobj-indent' " Indent text object (vii)
        \| Plug 'kana/vim-textobj-line' " Line text object (vil)
        \| Plug 'kana/vim-textobj-entire' " Entire buffer text object (vae)
        \| Plug 'nelstrom/vim-textobj-rubyblock' " Ruby block text object (vir)
        \| Plug 'kana/vim-textobj-function' " Function text object (vaf)
        \| Plug 'glts/vim-textobj-comment' " Comment text object (vac)
  Plug 'wellle/targets.vim' " Improved targets line cin) next parens
  " ^- https://github.com/wellle/targets.vim/blob/master/cheatsheet.md

call plug#end()

" Enable built-in matchit plugin
runtime macros/matchit.vim


" -/ Main Settings #msettings /---------------------------------------------

" -----------------------------------------------------------------------------
" ## UI
set background=dark
" let g:onedark_terminal_italics = 1
" colorscheme onedark
colorscheme base16-ocean

" change vim cursor depending on the mode
if has('nvim')
  set termguicolors
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

  let g:python_host_prog = '/usr/local/bin/python2'
  let g:python3_host_prog = '/usr/local/bin/python3'
  " let g:python_host_skip_check = 1
  " let g:python3_host_skip_check = 1
endif

set re=1 " Updated vim regex engine

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

set synmaxcol=500 " turn off syntax highlight beyond 500 chars
set showcmd " show incomplete commands
set ruler " show the cursor position all the time
set scrolloff=5
set sidescroll=1
set sidescrolloff=10
" set cul " turn on cursorline highlighting -- needed for linenumber HL too
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:⚋
set diffopt=filler " Add vertical spaces to keep right and left aligned.
set diffopt+=iwhite " Ignore whitespace changes.
set noerrorbells
set novisualbell
set number relativenumber "relativenumber number
set splitbelow
set splitright
set noshowmode
set noshowcmd

" -----------------------------------------------------------------------------
" ## Behavior
" Swaps / Backups / Sessions / History
set undodir=/tmp
set undofile
set undoreload=500
set undolevels=500
set nobackup
set nowritebackup
set noswapfile
set sessionoptions-=options " Do not save settings and mappings to sessions

" -----------------------------------------------------------------------------
" ## Folding
set foldmethod=indent   "fold based on indent
set foldnestmax=5      "deepest fold is 5 levels
set nofoldenable        "dont fold by default
set foldlevel=99
set foldlevelstart=0
set fcs=fold:-
let ruby_fold = 1
let javascript_fold = 1

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

" -----------------------------------------------------------------------------
" ## Completions
set ofu=syntaxcomplete#Complete " Set omni-completion method.
set completeopt=longest,menuone,preview
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d
" set complete-=i "don't complete in included files

" -----------------------------------------------------------------------------
" ## Ignores
set wildmode=list:longest
set wildmode=longest:full,full
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/smarty/*,*/vendor/*,*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/expert/*,*/solr/*,*/dist/*,*/bower_components/*,*/cf/*
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
set lazyredraw "may be the cause of lots of issues

" -----------------------------------------------------------------------------
" ## Mode changes speedups
set noesckeys
set notimeout
set ttimeout
set ttimeoutlen=10
set timeoutlen=10

" -----------------------------------------------------------------------------
" ## Misc
set matchtime=3
set showbreak=↪
set report=0 " Show all changes.
set hidden
set shiftround
set formatoptions=qorn1 " automatic formating.
set shortmess=atI " don't show the intro message when starting vim.
set matchpairs+=<:>
set virtualedit+=block
set magic
set mat=2
set re=1
set tm=500
set dictionary+=/usr/share/dict/words
set spellfile=~/.vim/spell/en.utf-8.add
let loaded_matchparen = 0 " this turns on pair matching highlight (is slow with this on)

" if more than 1 files are passed to vim as arg, open them in vertical splits
if argc() > 1
  silent vertical all
endif

" -----------------------------------------------------------------------------
" ## Enable per-folder vim settings
set exrc
set secure " disable unsafe commands in local .vimrc files


" -/ Plugin Settings #psettings /----------------------------------------------
" ## vim-readdir
" let g:loaded_netrw = 1
" let g:loaded_netrwPlugin = 1

" ## golden-ratio
let g:golden_ratio_exclude_nonmodifiable = 1
let g:golden_ratio_wrap_ignored = 0
let g:golden_ratio_ignore_horizontal_splits = 1

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

" ## neomake
" -- Settings derived from:
" -- https://github.com/rstacruz/vimfiles/blob/master/plugin/plugins/neomake.vim
" --
let g:neomake_airline = 1
let g:neomake_verbose = 0
let g:neomake_serialize = 1

let g:neomake_error_sign = {
      \ 'text': '☓',
      \ 'texthl': 'Error',
      \ }

let g:neomake_warning_sign = {
      \ 'text': '◦',
      \ 'texthl': 'Error',
      \ }

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


" Check for lint errors on write
au BufRead,BufWritePost,BufEnter *.js silent! Neomake standard|redraw
au BufWritePost *.scss,*.scss.css,*.sass silent! Neomake scsslint|redraw
au BufWritePost *.yml,*.yaml silent! Neomake yamllint|redraw


" ## rainbow
let g:rainbow_conf = {
      \ 'separately' : { 'agsv' : 0 }
      \ }
let g:rainbow_active = 1

" ## vim-test
function! SplitStrategy(cmd)
  botright new | call termopen(a:cmd) | startinsert
endfunction
let g:test#custom_strategies = {'terminal_split': function('SplitStrategy')}
let g:test#strategy = 'terminal_split'

" let g:test#preserve_screen = 1
let g:test#javascript#mocha#options = "--colors --compilers js:babel/register --timeout 15000 --delay"
let g:test#javascript#mocha#file_pattern = ".test.js"

" ## listtoggle
let g:lt_location_list_toggle_map = '<F3>'
let g:lt_quickfix_list_toggle_map = '<F4>'

" ## incsearch.vim
" :h g:incsearch#auto_nohlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" ## vim-lua-ftplugin
let g:lua_check_syntax = 0
let g:lua_complete_omni = 1
let g:lua_complete_dynamic = 0
let g:lua_define_completion_mappings = 0
let g:deoplete#omni#functions_lua = 'xolox#lua#omnifunc'

" ## vim-markdown
let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'bash=sh', 'sh', 'scss', 'zsh']
let g:vim_markdown_frontmatter=1

" ## vim-javascript-syntax
let g:JSHintHighlightErrorLine = 1
let javascript_enable_domhtmlcss = 1
let loaded_matchit = 1
let g:js_indent_log = 1
let g:used_javascript_libs = 'underscore,chai,react,flux,mocha,redux,lodash,angular,enzyme'

" ## vim-jsx
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 0

" ## quick-scope
let g:qs_enable = 0

" handy stuff: https://github.com/ervandew/supertab/issues/53
let g:SuperTabDefaultCompletionTypeDiscovery = [
      \ "&completefunc:<c-x><c-u>",
      \ "&omnifunc:<c-x><c-o>",
      \ ]
let g:SuperTabDefaultCompletionType = 'context'

" ## deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
" let g:deoplete#auto_completion_start_length = 2
let g:deoplete#max_list = 10

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

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

" ## ternjs
" let g:tern_show_argument_hints = 'on_hold'
" let g:tern_show_signature_in_pum = 1
" let g:tern_request_timeout = 1

" ## FZF
set rtp+=~/.fzf
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '~30%' }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'enter': 'vsplit'
  \ }
" function! s:buflist()
"     redir => ls
"     silent ls
"     redir END
"     return split(ls, '\n')
" endfunction
" function! s:bufopen(e)
"     execute 'buffer' matchstr(a:e, '^[ 0-9]*')
" endfunction

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
      \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
      \ 'AcceptSelection("t")': ['<c-t>'],
      \ 'AcceptSelection("v")': ['<cr>', '<RightMouse>'],
      \ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
      \ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
      \ 'PrtHistory(-1)':       ['<c-n>'],
      \ 'PrtHistory(1)':        ['<c-p>'],
      \ 'ToggleFocus()':        ['<c-tab>'],
      \}

" ## ack.vim
set grepprg=ag\ --nogroup\ --line-numbers\ --column\ --noheading
let &grepprg = 'command ag --nogroup --nocolor --line-numbers --column'
let g:ackprg="ag --column --nogroup --line-numbers --vimgrep"
let g:agprg="ag --column --nogroup --line-numbers --vimgrep"
" https://github.com/akalyaev/dotfiles/blob/master/vimrc#L207
let g:agprg = 'ag --nogroup --nocolor --column --smart-case'

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

" ## ternjs
autocmd FileType javascript,javascript.jsx nnoremap <silent> <buffer> gb :TernDef<CR>

" ## ultisnips
" better key bindings for UltiSnipsExpandTrigger
" Use tab to expand snippet and move to next target. Shift tab goes back.
" <C-tab> lists available snippets for the file
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" -/ Custom Functions #cfunctions /--------------------------------------------
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
  " force spell when doing a git commit
  if bufname("%") == "COMMIT_EDITMSG"
    let b:deoplete_disable_auto_complete=1
    let g:deoplete#enable_at_startup = 0
    let b:deoplete_ignore_sources = ['buffer']
    let g:deoplete_ignore_sources = ['buffer']
    let g:deoplete#ignore_sources = {'buffer'}
    call deoplete#disable()
    set spell
    set spelllang=en
  endif
endfunction

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
function! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunction

function! QuickfixToggle()
  if gettabvar(tabpagenr(), 'quickfix_window', 0)
    if t:quickfix_window == winnr()
      " jump back to the previous window if inside the quickfix
      " window
      wincmd p
    endif
    cclose
    let t:quickfix_window = 0
  else
    copen
    let t:quickfix_window = winnr()
  endif
endfu
nnoremap <silent> <F3> :call QuickfixToggle()<cr>

function! LocationListToggle()
  if getwinvar(winnr(), 'locationlist_window', 0)
    lclose
    let w:locationlist_window = 0
  else
    " prevent errors on empty loclist
    if !empty(getloclist(0))
      lopen
      let w:locationlist_window = 1
    else
      echomsg "LocList is empty"
    endif
  endif
endfu
nnoremap <silent> <F4> :call LocationListToggle()<cr>

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

" Pulse the cursorline when focus is regained
function! s:Pulse()
  setlocal cursorline
  redraw
  sleep 100m

  setlocal nocursorline
  redraw
  sleep 100m

  setlocal cursorline
  redraw
  sleep 100m

  setlocal nocursorline
  redraw
endfunction
" autocmd FocusGained * call s:Pulse()


" -/ Autocommands #autocommands /----------------------------------------------
augroup Misc
  autocmd!
  autocmd! BufWritePost init.vim,vimrc.local,.vimrc so $MYVIMRC
augroup END

augroup UnSyntaxInactiveGroup
  autocmd!
  autocmd BufEnter,WinEnter * set syntax=ON
  autocmd BufEnter,WinEnter * set number
  " autocmd BufEnter,WinEnter * set cursorline

  autocmd BufLeave,WinLeave * set syntax=OFF
  autocmd BufLeave,WinLeave * set nonumber norelativenumber
  " autocmd BufLeave,WinLeave * set nocursorline
augroup END

augroup RestoreCursorPosition
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute 'normal! g`"zvzz' |
      " \   execute 'normal g`\"' |
        \ endif
augroup END

" Automagically push file to remote location for mirror.vim projects
autocmd BufWrite ~/.dotfiles/private/homeassistant/* :MirrorPush

" Treat buffers from stdin as scratch.
" autocmd StdinReadPost * :set buftype=nofile
"
augroup ColorColumnGroup
  " Color Column (only on insert)
  if exists("&colorcolumn")
    autocmd InsertEnter * set colorcolumn=80
    autocmd InsertLeave * set colorcolumn=""
  endif
augroup END

augroup GitGroup
  autocmd!
  autocmd Filetype gitcommit setl spell textwidth=72

  " Handles tpope/fugitive auto-commands
  autocmd BufNewFile,BufRead .git/index setlocal nolist
  autocmd BufReadPost fugitive://* set bufhidden=delete

  autocmd BufReadCmd *.git/index exe BufReadIndex()
  autocmd BufEnter *.git/index silent normal gg0j
  autocmd BufEnter *.git/COMMIT_EDITMSG exe BufEnterCommit()
augroup END

" FIXME: this may be breaking auto rename of irc buffers, etc
" Automatic rename of tmux window
if exists('$TMUX') && !exists('$NORENAME')
  au BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
  au VimLeave * call system('tmux set-window automatic-rename on')
endif

augroup HighlightGroup
  autocmd!
  " http://vim.wikia.com/wiki/Highlight_unwanted_spaces
  autocmd BufNewFile,BufRead,InsertLeave * silent! match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * silent! match ExtraWhitespace /\s\+\%#\@<!$/

  " Delete trailing whitespace on write
  autocmd BufWrite * silent call DeleteTrailingWS()
augroup END

" -/ Filetypes #ftypes /-------------------------------------------------------
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

  " omnicompletion
  au FileType javascript,jsx,javascript.jsx setlocal omnifunc=javascriptcomplete#CompleteJS " default
  au FileType javascript,jsx,javascript.jsx setlocal completefunc=jspc#omni " jspc
  au FileType javascript,jsx,javascript.jsx setlocal omnifunc=tern#Complete " tern

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

  " omnicompletion
  au FileType css,scss,sass,less setlocal omnifunc=csscomplete#CompleteCSS
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

  autocmd BufNewFile,BufRead *.conf set filetype=conf

  " autocmd FileType json autocmd BufWritePre <buffer> %!python -m json.tool
  au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

  """"""" omnicompletions
  " Extreme info on omnicompletions, must read more:
  " https://github.com/davidosomething/dotfiles/blob/7fcd48209c8f116ccc4fb96beffdc315837fe876/vim/plugin/completion.vim
  au FileType * setlocal omnifunc=syntaxcomplete#Complete
  au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  au FileType python setlocal omnifunc=pythoncomplete#Complete
  au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  au FileType ruby setlocal omnifunc=rubycomplete#Complete
augroup END


" -/ Highlighting #highlights /------------------------------------------------
hi IncSearchCursor ctermfg=0 ctermbg=9 guifg=#000000 guibg=#FF0000
hi Search gui=underline term=underline guibg=#afaf87 guifg=#333333
hi Errors ctermbg=red guibg=red ctermfg=white guifg=white term=bold gui=bold
hi Comment cterm=italic term=italic gui=italic
" hi ColorColumn ctermbg=bg ctermfg=235 cterm=NONE guibg=bg guifg=#262626 gui=NONE
" hi signColumn ctermbg=bg ctermfg=230 cterm=NONE guibg=bg guifg=#ffffd7 gui=NONE
" hi LineNr ctermbg=bg ctermfg=137 cterm=NONE guibg=bg guifg=#af875f gui=NONE
" hi ColorColumn ctermbg=bg ctermfg=235 cterm=NONE guibg=bg guifg=#262626 gui=NONE
" hi signColumn ctermbg=bg ctermfg=230 cterm=NONE guibg=bg guifg=#ffffd7 gui=NONE
" hi CursorLine ctermbg=235 ctermfg=NONE cterm=NONE guibg=#262626 guifg=NONE gui=NONE
hi LineNr guibg=bg guifg=#665F59 gui=NONE
hi CursorLineNr ctermbg=bg ctermfg=223 cterm=NONE guibg=bg guifg=#af875f gui=bold
hi qfLineNr ctermbg=bg ctermfg=95 cterm=NONE guibg=bg guifg=#875f5f gui=NONE

" example of just for base16-ocean
" au ColorScheme base16-ocean highlight Normal ctermbg=160

match ErrorMsg 'debugger'
match ErrorMsg 'binding.pry'

au BufEnter *.js syn match ErrorMsg /console.log/
au BufEnter *.js syn match ErrorMsg /debugger/
au Filetype coffee syn match ErrorMsg /console.log/
au BufEnter *.rb syn match ErrorMsg /binding.pry/

" Highlight VCS conflict markers
" match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'


" -/ Keybindings #bindings /------------------------------------------------
let mapleader=","
let maplocalleader="\\"

" ## Deoplete
" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()

" ## CtrlP
" let g:ctrlp_map = '<leader>m'
" let g:ctrlp_cmd = 'CtrlP'

" ## FZF
" Search files really fast
nnoremap <silent> <Leader>a :Ag<CR>
" search open buffers
nnoremap <silent> <Leader>m :Files<CR>
" nnoremap <silent> <A-i> :History:<CR>
" nnoremap <silent> <A-e> :Buffers<CR>
" " Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" ## Commenting
nmap <leader>c :Commentary<cr>
vmap <leader>c :Commentary<cr>

" ## vim-plug
noremap <F5> :PlugUpdate<cr>
map <F5> :PlugUpdate<cr>
noremap <S-F5> :PlugClean!<cr>
map <S-F5> :PlugClean!<cr>

" ## QuickScope
nnoremap <expr> <silent> f Quick_scope_selective('f')
nnoremap <expr> <silent> F Quick_scope_selective('F')
nnoremap <expr> <silent> t Quick_scope_selective('t')
nnoremap <expr> <silent> T Quick_scope_selective('T')
vnoremap <expr> <silent> f Quick_scope_selective('f')
vnoremap <expr> <silent> F Quick_scope_selective('F')
vnoremap <expr> <silent> t Quick_scope_selective('t')
vnoremap <expr> <silent> T Quick_scope_selective('T')

" ## Fugitive
nnoremap <leader>H :Gbrowse<cr>
vnoremap <leader>H :Gbrowse<cr>
nnoremap <leader>gb :Gblame<cr>

" ## Ag / Ack
nnoremap <leader>a :Ack!<space>
" immediately ag/ack/grep for word under cursor
map <leader>/ :execute "Ack! " . expand("<cword>") <CR>

" ## Testing vim-test
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>T :TestNearest<CR>
" nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" ## Gist/Github
" Send visual selection to gist.github.com as a private, filetyped Gist
" Requires the gist command line too (brew install gist)
vnoremap <leader>G :Gist -p<cr>

" ## Surround
vmap [ S]
vmap ( S)
vmap { S}
vmap ' S'
vmap " S"

" ## Code Formatting
map <leader>pj :%!python -m json.tool<CR>
map <leader>px :%!xmllint % --format<CR>

" ## Quick edit of certain files
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>ez :vsplit ~/.zshrc<cr>
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>

" ## Motions
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" ## Buffers
" Switch between last two buffers
nnoremap <C-,><C-,> <C-^>

" ## Splits with vim-tmux-navigator
" let g:tmux_navigator_no_mappings = 1
" let g:tmux_navigator_save_on_switch = 1
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>

nnoremap <C-o> :vnew<cr>:e<space><c-d>


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

" ## Search / Substitutions / Replacements / incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

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

" ## CamelCaseMotion overrides
" ref: https://github.com/martin-svk/dot-files/blob/master/neovim/init.vim
" Use CamelCaseMotion instead of default motions
" map <silent> w <Plug>CamelCaseMotion_w
" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_e
" map <silent> ge <Plug>CamelCaseMotion_ge
" sunmap w
" sunmap b
" sunmap e
" sunmap ge

" Fix the cw at the end of line bug default vim has special treatment (:help cw)
nmap cw ce
nmap dw de

" ## Copy/Paste
" noremap <leader>y "*y
" noremap <leader>yy "*Y
" "don't move the cursor after pasting
" "(by jumping to back start of previously changed text)
" noremap p p`[
" noremap P P`[
" nnoremap Y y$
" vmap <silent><leader>y "xy
" map <silent><leader>p "xp
" vmap <silent> <expr> p <sid>Repl()

" " Go to end of text you've just pasted
" vnoremap <silent> y y`]
" vnoremap <silent> p p`]
" nnoremap <silent> p p`]

" ## Convenience rebindings
" semicolon is easier to hit than colon
" nnoremap ; : " this rebinding breaks quick-scope repeated movement
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
map <TAB> %
silent! unmap [%
silent! unmap ]%
noremap <tab> %
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
nnoremap <leader>G mqHmwgg=G`wzt`q
" Format entire file
nmap <leader>fef ggVG=

" ## Terminal
if has('nvim')
  " Quickly open a shell below current window
  nnoremap <leader>sh :below 10sp term://$SHELL<cr>

  tnoremap <ESC> <C-\><C-n>
  tnoremap ,<ESC> <ESC>

  " Automatically go into insert mode when entering terminal window
  augroup terminal_insert
    autocmd!
    autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
    autocmd BufWinEnter,WinEnter term://* startinsert
  augroup END
endif

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

" ## Code-Folding
" - `za` toggles current fold open/close
" - `zc` closes current fold; or parent, if current is already closed
" - `zj` navigates down to top of next fold
" - `zk` navigates up to bottom of previous fold
" Refs
" - http://vimcasts.org/episodes/how-to-fold/
" - https://www.linux.com/learn/vim-tips-folding-fun
" - sjl's fold setup: https://bitbucket.org/sjl/dotfiles/src/9bead8a9b4350c57f8a24a8119607a83a9592afe/vim/vimrc?at=default&fileviewer=file-view-default
" nnoremap <Space> za


" -/ Abbreviations #abbrev /------------------------------------------------
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
