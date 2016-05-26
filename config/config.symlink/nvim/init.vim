" =============================================================================
"
"   ┌┬┐┌─┐┌─┐┌─┐┬  ┬┌┬┐┬ ┬┬┌─┐
"   │││├┤ │ ┬├─┤│  │ │ ├─┤││   :: DOTFILES > vimrc
"   ┴ ┴└─┘└─┘┴ ┴┴─┘┴ ┴ ┴ ┴┴└─┘
"   Brought to you by: Seth Messer / @megalithic
"
" -----------------------------------------------------------------------------
" Table of Contents
" -----------------------------------------------------------------------------
" 1) Plugins / Config #plugins
"   1.1) UI
"   1.2) Utilities
"   1.3) Filetypes
"   1.4) Code Navigation
"     1.4.1) Text objects
" 2) Main Settings #msettings
"   2.1) UI
"   2.2) Behavior
"   2.3) *Needs more work and organizing and documentation
" 3) Plugins Settings #psettings
" 4) Highlighting #highlights
" 5) Custom functions #cfunctions
" 6) Auto Commands #autocommands
"   6.1) Filetypes
"   6.2) Normalization
" 7) Filetypes #ftypes
" 8) Keybindings #bindings
" 9) Abbreviations #abbrev
" =============================================================================

filetype off

" =============================================================================
" Plugins / Config #plugins
" -----------------------------------------------------------------------------
function! LoadPlugs()
  """"" UI ==================================================================
  " Plug 'morhetz/gruvbox'
  " Plug 'junegunn/seoul256.vim'
  " Plug 'Mattias-/base16-vim' " this fork fixes the stinking term color issues
  Plug 'w0ng/vim-hybrid'
  Plug 'kristijanhusak/vim-hybrid-material'
  Plug 'snooc/base16-vim'
  Plug 'megalithic/golden-ratio'
  Plug 'christoomey/vim-tmux-navigator' " needed for tmux/hotkey integration with vim
  Plug 'christoomey/vim-tmux-runner' " needed for tmux/hotkey integration with vim
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'benekastah/neomake', { 'on': ['Neomake'] }
  Plug 'ap/vim-readdir'
  Plug 'tpope/vim-dispatch'

  """"" Filetypes ===========================================================
  "" Functional (JavaScript)
  Plug 'othree/yajs.vim' " { 'tag': '1.6' } fixes weird comment colors
  Plug 'pangloss/vim-javascript'
  Plug 'gavocanov/vim-js-indent'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'mxw/vim-jsx'
  Plug 'othree/jspc.vim'
  Plug 'heavenshell/vim-jsdoc'
  Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
  Plug 'carlitux/deoplete-ternjs'
  Plug 'kchmck/vim-coffee-script'
  " Plug 'tyru/current-func-info.vim'

  Plug 'ElmCast/elm-vim'

  "" Presentation (CSS / SCSS / LESS)
  Plug 'othree/csscomplete.vim'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'othree/svg-properties-syntax.vim'

  "" Structure (HTML / HAML / SLIM)
  Plug 'othree/html5.vim'
  Plug 'othree/xml.vim'

  "" Markdown
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'nelstrom/vim-markdown-folding'

  "" Ruby / Rails
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'
  Plug 'ingydotnet/yaml-vim'

  """"" Utilities ===========================================================
  Plug 'tpope/vim-commentary'
  Plug 'sickill/vim-pasta'
  Plug 'Chiel92/vim-autoformat'
  " Plug 'ciaranm/detectindent' " auto-detect indent settings
  Plug 'jordwalke/VimAutoMakeDirectory'
  Plug 'Raimondi/delimitMate'
  Plug 'tpope/vim-endwise' " automagically add end/endfunction/endif/etc
  Plug 'tpope/vim-surround'
  " - {Visual}S<arg> surrounds selection
  " - cs/ds<arg1><arg2> change / delete
  " - ys<obj><arg> surrounds text object
  " - yss<arg> for entire line
  Plug 'tpope/vim-repeat'
  Plug 'janko-m/vim-test'
  Plug 'Valloric/MatchTagAlways', { 'for': ['html', 'erb'] }
  Plug 'docunext/closetag.vim'
  " Plug 'lukaszb/vim-web-indent' " hasn't been updated in 4y
  Plug 'luochen1990/rainbow'
  Plug 'tpope/vim-ragtag', { 'for': ['html', 'xml', 'erb'] }
  Plug 'rizzatti/dash.vim'

  """"" Code Navigation======================================================
  Plug 'haya14busa/incsearch.vim'
  Plug 'unblevable/quick-scope'
  Plug 'wellle/targets.vim'
  Plug 'EinfachToll/DidYouMean'
  Plug 'ervandew/supertab'
  function! DoUpdateRemotePlugins(arg)
    UpdateRemotePlugins
  endfunction
  Plug 'shougo/deoplete.nvim', { 'do': function('DoUpdateRemotePlugins') }
  Plug 'Konfekt/FastFold'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'FelikZ/ctrlp-py-matcher'
  Plug 'mileszs/ack.vim'
  Plug 'kopischke/vim-fetch'
  Plug 'kana/vim-operator-user'
  " provide ai and ii for indent blocks
  " provide al and il for current line
  " provide a_ and i_ for underscores
  " provide a- and i-
  Plug 'kana/vim-textobj-user'
        \| Plug 'kana/vim-textobj-indent'
        \| Plug 'kana/vim-textobj-line'
        \| Plug 'mattn/vim-textobj-url'
        \| Plug 'kana/vim-textobj-fold'

  """"" Git/Gist ============================================================
  Plug 'tpope/vim-git'
  Plug 'tpope/vim-fugitive'
  Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'

  """"" Snippets ============================================================
  " Snippets information (handy!):
  " https://medium.com/brigade-engineering/sharpen-your-vim-with-snippets-767b693886db
  " Make keybindings play nice with YCM, Supertab, Ultisnips:
  " http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme/22253548#22253548
  " Plug 'SirVer/ultisnips'
  " Plug 'honza/vim-snippets'
  " Plug 'fortes/vim-personal-snippets'
  " Plug 'MarcWeber/vim-addon-mw-utils'
  " Plug 'tomtom/tlib_vim'
  " Plug 'justinj/vim-react-snippets'
  " Plug 'jwhitley/vim-matchit'
endfunction

""""" Install vim-plug Plugins (fail nicely) ====================================
try
  call plug#begin()
  call LoadPlugs()
  call plug#end()
  :catch /^Vim\%((\a\+)\)\=:E117/
  echomsg "Failed to load vim-plug and/or bundles. Perhaps vim-plg isn't installed."
  echomsg "You need to install vim-plug into ~/.vim/autoload: "
  echomsg "   mkdir -p ~/.vim/autoload"
  echomsg "   curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  echomsg "   vim -c ':PlugInstall' -c ':qa!'"
endtry

" Enable built-in matchit plugin
runtime macros/matchit.vim


" =============================================================================
" Main Settings #msettings
" -----------------------------------------------------------------------------
""""" UI ====================================================================
""""""" Theme / Terminal
set background=dark
" let g:gruvbox_italic=1
" let g:gruvbox_contrast_dark="soft"
" colorscheme gruvbox

" colorscheme base16-ocean

let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
let g:enable_bold_font = 1
colorscheme hybrid_material

filetype plugin indent on

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
set t_ut= " improve screen clearing by using the background color (for tmux/256 color stuffs)

" change vim cursor depending on the mode
if has('nvim')
  set termguicolors
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

""""""" Updated vim regex engine
set re=1

""""""" Layout
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
set number "relativenumber / number
" set splitright
set splitbelow
set noshowmode
set noshowcmd

""""" Behavior ==============================================================
""""""" Swaps / Backups / Sessions / History
if !isdirectory($HOME."/tmp") && exists("*mkdir")
  call mkdir($HOME."/tmp", "p", 0700)
endif
set undodir=$HOME/tmp
set undofile
set undoreload=500
set undolevels=500
set nobackup
set nowritebackup
set noswapfile

set sessionoptions-=options " Do not save settings and mappings to sessions

""""""" Folding
set foldmethod=indent   "fold based on indent
set foldnestmax=5      "deepest fold is 5 levels
set nofoldenable        "dont fold by default
set foldlevel=1
set foldlevelstart=0
let ruby_fold = 1
let javascript_fold = 1
set fcs=fold:-

""""""" Indentions / Tabs
set smartindent
set cindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

""""""" Grepping / Searching
set ignorecase
set smartcase
set showmatch
set gdefault " assume the /g flag is on in :s substitutions

""""""" Completions
set ofu=syntaxcomplete#Complete " Set omni-completion method.
set completeopt=longest,menuone,preview
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d
" set complete-=i "don't complete in included files

""""""" Ignores
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

""""""" File handling
set autowrite
set fileformats=unix,mac,dos
set lazyredraw "may be the cause of lots of issues

""""""" Mode change speedups
set noesckeys
set notimeout
set ttimeout
set ttimeoutlen=10
set timeoutlen=10

""""""" Misc (Needs documentation / understanding)
set matchtime=3
set showbreak=↪
set report=0 " Show all changes.
set hidden
set shiftround
" set formatoptions=qrn1 " automatic formating.
set formatoptions-=o " don't start new lines w/ comment leader on pressing 'o'
set formatoptions-=r " don't start new lines w/ comment leader on pressing 'o'
set shortmess=atI " don't show the intro message when starting vim.
set matchpairs+=<:>
let loaded_matchparen = 0 " this turns on pair matching highlight (is slow witht his on)
set virtualedit+=block
set magic
set mat=2
set re=1
set tm=500
set dictionary+=/usr/share/dict/words
set spellfile=~/.vim/spell/en.utf-8.add

if has("clipboard")                   " If the feature is available
  set clipboard=unnamed               " copy to the system clipboard
  " add system clipboard support
  " set clipboard+=unnamed

  if has("unnamedplus")
    set clipboard+=unnamedplus
  endif
endif

""""""" Neovim
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'
" let g:python_host_skip_check = 1
" let g:python3_host_skip_check = 1

" if more than 1 files are passed to vim as arg, open them in vertical splits
if argc() > 1
  silent vertical all
endif

""""""" Per project/folder vim settings
set exrc
set secure " disable unsafe commands in local .vimrc files


" =============================================================================
" Plugin Settings #psettings
" -----------------------------------------------------------------------------
"
""""""" vim-readdir
let g:loaded_netrwPlugin = 1

""""""" golden-ratio
let g:golden_ratio_exclude_nonmodifiable = 1
let g:golden_ratio_wrap_ignored = 0
let g:golden_ratio_ignore_horizontal_splits = 1

""""""" vim-airline
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
" let g:airline_extensions = ['mode','crypt','paste','iminsert','branch','filename','readonly','filetype','fileencoding','fileformat','percentage','line number','column number','whitespace']
let g:airline_mode_map = {
      \ 'n' : 'NORMAL',
      \ 'i' : 'INSERT',
      \ 'R' : 'REPLACE',
      \ 'v' : 'VISUAL',
      \ 'V' : 'V-LINE',
      \ 'c' : 'CMD   ',
      \ '': 'V-BLCK',
      \ }

""""""" neomake
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
" let g:neomake_javascript_standard_maker = {
"   \ 'args': ['-f', 'compact', '--parser', 'babel-eslint', '-v'],
"   \ 'errorformat': '  %f:%l:%c: %m'
"   \ }

" function! neomake#makers#ft#javascript#standard()
"   return {
"         \ 'args': ['-f', 'compact', '--parser', 'babel-eslint', '-v'],
"         \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
"         \ '%W%f: line %l\, col %c\, Warning - %m'
"         \ }
" endfunction
let g:neomake_javascript_standard_maker = {
      \ 'args': ['-f', 'compact', '--parser', 'babel-eslint', '-v'],
      \ 'errorformat': '  %f:%l:%c: %m'
      \ }

let g:neomake_jsx_enabled_makers = ['standard']
let g:neomake_jsx_standard_maker =
      \ g:neomake_javascript_standard_maker

" Check for lint errors on write
au BufRead,BufWritePost,BufEnter *.js silent! Neomake standard|redraw
au BufWritePost *.scss,*.scss.css,*.sass silent! Neomake scsslint|redraw
au BufWritePost *.yml,*.yaml silent! Neomake yamllint|redraw

" function! JscsFix()
"   let l:winview = winsaveview()
"   % ! jscs -x
"   call winrestview(l:winview)
" endfunction
" command JscsFix :call JscsFix()
" noremap <leader>j :JscsFix<CR>

""""""" rainbow
let g:rainbow_conf = {
      \ 'separately' : { 'agsv' : 0 }
      \ }
let g:rainbow_active = 1

""""""" vim-test
let g:test#preserve_screen = 1
let test#strategy = "neovim"
let test#javascript#mocha#options = "--colors --compilers js:babel/register --timeout 30000 --bail --full-trace --delay"
let test#javascript#mocha#file_pattern = ".test.js"

""""""" listtoggle
let g:lt_location_list_toggle_map = '<F3>'
let g:lt_quickfix_list_toggle_map = '<F4>'

""""""" incsearch.vim
" :h g:incsearch#auto_nohlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

""""""" vim-markdown
let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'bash=sh', 'sh', 'scss', 'zsh']
let g:vim_markdown_frontmatter=1

""""""" vim-javascript-syntax
let g:JSHintHighlightErrorLine = 1
let javascript_enable_domhtmlcss = 1
let loaded_matchit = 1
let g:js_indent_log = 1
let g:used_javascript_libs = 'underscore,chai,react,flux,mocha,redux,lodash,angular'

""""""" vim-jsx
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 0

""""""" quick-scope
let g:qs_enable = 0

""""""" supertab
" handy stuff: https://github.com/ervandew/supertab/issues/53
let g:SuperTabDefaultCompletionTypeDiscovery = [
      \ "&completefunc:<c-x><c-u>",
      \ "&omnifunc:<c-x><c-o>",
      \ ]
let g:SuperTabDefaultCompletionType = 'context'

""""""" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

""""""" ternjs
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  let g:tern_request_timeout = 1
endif

""""""" ctrlp
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
let g:ctrlp_working_path_mode = 0
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

""""""" ack.vim
set grepprg=ag\ --nogroup\ --line-numbers\ --column\ --noheading
let &grepprg = 'command ag --nogroup --nocolor --line-numbers --column'
let g:ackprg="ag --column --nogroup --line-numbers --vimgrep"
let g:agprg="ag --column --nogroup --line-numbers --vimgrep"
" https://github.com/akalyaev/dotfiles/blob/master/vimrc#L207
let g:agprg = 'ag --nogroup --nocolor --column --smart-case'

""""""" webapi-vim / gist-vim
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

""""""" ultisnips
" better key bindings for UltiSnipsExpandTrigger
" Use tab to expand snippet and move to next target. Shift tab goes back.
" <C-tab> lists available snippets for the file
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

""""""" deoplete
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" ,<Tab> for regular tab
inoremap <Leader><Tab> <Space><Space>
""""""" ternjs
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" =============================================================================
" Custom Functions #cfunctions
" -----------------------------------------------------------------------------
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
  if bufname("%")=="COMMIT_EDITMSG"
    let b:deoplete_disable_auto_complete=1
    let g:deoplete#enable_at_startup = 0
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

fu! QuickfixToggle()
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

fu! LocationListToggle()
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


" =============================================================================
" Autocommands #autocommands
" -----------------------------------------------------------------------------
augroup UnSyntaxInactiveGroup
  autocmd!
  autocmd BufEnter,WinEnter * set syntax=ON
  autocmd BufEnter,WinEnter * set number
  " autocmd BufEnter,WinEnter * set cursorline

  autocmd BufLeave,WinLeave * set syntax=OFF
  autocmd BufLeave,WinLeave * set nonumber
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

" Delete trailing whitespace on write
autocmd BufWrite * silent call DeleteTrailingWS()

" Treat buffers from stdin as scratch.
autocmd StdinReadPost * :set buftype=nofile

augroup ColorColumnGroup
  " Color Column (only on insert)
  if exists("&colorcolumn")
    autocmd InsertEnter * set colorcolumn=80
    autocmd InsertLeave * set colorcolumn=""
  endif
augroup END

augroup GitGroup
  autocmd!
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
  au BufNewFile,BufRead,InsertLeave * silent! match ExtraWhitespace /\s\+$/
  au InsertEnter * silent! match ExtraWhitespace /\s\+\%#\@<!$/
augroup END

" =============================================================================
" Filetypes / Syntax #ftypes
" -----------------------------------------------------------------------------
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
  if exists('g:plugs["tern_for_vim"]')
    au FileType javascript,jsx,javascript.jsx setlocal omnifunc=tern#Complete " tern
  endif

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

  " enable fugitive with dirvish
  autocmd FileType dirvish call fugitive#detect(@%)

  " autocmd FileType json autocmd BufWritePre <buffer> %!python -m json.tool
  au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

  " Fix slow Ruby editing
  " http://stackoverflow.com/questions/22949067/macvim-quite-slow-when-syntax-is-set-to-ruby
  au Filetype ruby setlocal foldmethod=manual

  """"""" omnicompletions
  " Extreme info on omnicompletions, must read more:
  " https://github.com/davidosomething/dotfiles/blob/7fcd48209c8f116ccc4fb96beffdc315837fe876/vim/plugin/completion.vim
  au FileType * setlocal omnifunc=syntaxcomplete#Complete
  au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  au FileType python setlocal omnifunc=pythoncomplete#Complete
  au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  au FileType ruby setlocal omnifunc=rubycomplete#Complete
augroup END


" =============================================================================
" Highlighting #highlights
" -----------------------------------------------------------------------------
hi IncSearchCursor ctermfg=0 ctermbg=9 guifg=#000000 guibg=#FF0000
hi clear Search
hi Search gui=underline term=underline guibg=#afaf87 guifg=#333333
hi Errors ctermbg=red guibg=red ctermfg=white guifg=white term=bold gui=bold
hi Comment cterm=italic term=italic gui=italic
hi CursorLineNr guifg=white

match ErrorMsg 'debugger'
match ErrorMsg 'binding.pry'

au BufEnter *.js syn match ErrorMsg /console.log/
au BufEnter *.js syn match ErrorMsg /debugger/
au Filetype coffee syn match ErrorMsg /console.log/
au BufEnter *.rb syn match ErrorMsg /binding.pry/

" Highlight VCS conflict markers
" @see {@link https://bitbucket.org/sjl/dotfiles/src/83aac563abc9d0116894ac61db2c63c9a05f72be/vim/vimrc?at=default&fileviewer=file-view-default#vimrc-233}
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" =============================================================================
" Keybindings #bindings
" TODO: this area needs lots of cleanup and re-evaluation
" -----------------------------------------------------------------------------
let mapleader=","
let maplocalleader="\\"

nnoremap <leader>s :so $MYVIMRC<CR>

""""""" CtrlP
let g:ctrlp_map = '<leader>m'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>bs :CtrlPBuffer<CR>

""""""" Commenting
nmap <leader>c :Commentary<cr>
vmap <leader>c :Commentary<cr>

""""""" vim-plug
noremap <F5> :PlugUpdate<cr>
map <F5> :PlugUpdate<cr>
noremap <S-F5> :PlugClean!<cr>
map <S-F5> :PlugClean!<cr>

""""""" QuickScope
nnoremap <expr> <silent> f Quick_scope_selective('f')
nnoremap <expr> <silent> F Quick_scope_selective('F')
nnoremap <expr> <silent> t Quick_scope_selective('t')
nnoremap <expr> <silent> T Quick_scope_selective('T')
vnoremap <expr> <silent> f Quick_scope_selective('f')
vnoremap <expr> <silent> F Quick_scope_selective('F')
vnoremap <expr> <silent> t Quick_scope_selective('t')
vnoremap <expr> <silent> T Quick_scope_selective('T')

""""""" Fugitive
nnoremap <leader>H :Gbrowse<cr>
vnoremap <leader>H :Gbrowse<cr>
nnoremap <leader>gb :Gblame<cr>

""""""" Ag / Ack
nnoremap <leader>a :Ack!<space>
" immediately ag/ack/grep for word under cursor
map <leader>/ :execute "Ack! " . expand("<cword>") <CR>

"""""" Testing vim-test
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>T :TestNearest<CR>
" nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

""""""" Gist/Github
" Send visual selection to gist.github.com as a private, filetyped Gist
" Requires the gist command line too (brew install gist)
vnoremap <leader>G :Gist -p<cr>

""""""" Surround
vmap [ S]
vmap ( S)
vmap { S}
vmap ' S'
vmap " S"

""""""" Code Formatting
map <leader>pj :%!python -m json.tool<CR>
map <leader>px :%!xmllint % --format<CR>

""""""" Quick edit of certain files
nnoremap <leader>ev :vsplit ~/.dotfiles/vim/vimrc.symlink<cr>
nnoremap <leader>ez :vsplit ~/.zshrc<cr>
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>

""""""" Motions
noremap j gj
noremap k gk
noremap gj j
noremap gk k

""""""" Buffers
" Switch between last two buffers
nnoremap <C-,><C-,> <C-^>

""""""" Splits with vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>

nnoremap <C-o> :vnew<cr>:e<space><c-d>

" Jump to window <n>:
" http://stackoverflow.com/a/6404246/151007
let i = 1
while i <= 9
  execute 'nnoremap <Leader>'.i.' :'.i.'wincmd w<CR>'
  let i = i + 1
endwhile

" Make arrowkey do something usefull, resize the viewports accordingly
nnoremap <Left> <nop>
nnoremap <Right> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>

" this always does annoying things for some reason, so stop it
noremap K <nop>

" stop changing casing when in visual mode
vnoremap u <nop>

""""""" Writing / quitting
nnoremap <silent> <leader>w :w<cr>
nnoremap <leader>q :q<cr>
" Sudo write (,W)
noremap <silent><leader>W :w !sudo tee %<CR>

""""""" Vim process management
" background VIM
vnoremap <c-z> <esc>zv`<ztgv

""""""" Search / Substitutions / Replacements
""""""" incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" clear incsearch term
" nnoremap <silent><Leader><space> :nohls<CR>
" nnoremap  <silent><leader><space> :syntax sync fromstart<cr>:nohlsearch<cr>:redrawstatus!<cr>:redraw!<cr>
nnoremap  <silent><ESC> :syntax sync fromstart<cr>:nohlsearch<cr>:redrawstatus!<cr><ESC>
nnoremap / /\v
vnoremap / /\v
" Keep search matches in the middle of the window.
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv
" Keep search matches jumping around
nnoremap g; g;zz
nnoremap g, g,zz
" Search and replace word under cursor (,*)
" nnoremap <leader>fr :%s/\<<C-r><C-w>\>//<Left>
nnoremap <leader>fr :%s#\<<C-r>=expand("<cword>")<CR>\>#
" Use word under cursor into lhs of a substitute (for quick search and replace)
nnoremap <leader>r :%s/\<<C-r>=expand("<cword>")<CR>\>/

""""""" Copy/Paste
noremap <leader>y "*y
noremap <leader>yy "*Y
"don't move the cursor after pasting
"(by jumping to back start of previously changed text)
noremap p p`[
noremap P P`[
nnoremap Y y$
vmap <silent><leader>y "xy
map <silent><leader>p "xp
vmap <silent> <expr> p <sid>Repl()

" Go to end of text you've just pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

""""""" ESC rebindings
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

""""""" Convenience rebindings
" semicolon is easier to hit than colon
" nnoremap ; : " this rebinding breaks quick-scope repeated movement
noremap  <C-;> :!
noremap  <Leader>: :<Up>
" remap q for recording to Q
nnoremap Q q
nnoremap q <Nop>
"allow deleting selection without updating the clipboard (yank buffer)
vnoremap x "_x
vnoremap X "_X
" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_
"make the tab key match bracket pairs
map <tab> %
noremap <tab> %
vnoremap <tab> %
" Better mark jumping (line + col)
nnoremap ' <nop>
" Remap VIM 0 to first non-blank character
map 0 ^

""""""" Selections
" reselect pasted content:
nnoremap gV `[v`]
" select all text in the file
nnoremap <leader>v ggVG
" Easier linewise reselection of what you just pasted.
nnoremap <leader>V V`]
" duplicate whatever’s selected, to the next line
vmap D y'>p

""""""" Indentions
" Indent/dedent/autoindent what you just pasted.
nnoremap <lt>> V`]<
nnoremap ><lt> V`]>
nnoremap =- V`]=
" Reindent the whole document and keep the cursor in the same location
nnoremap <C-=> mqHmwgg=G`wzt`q
nnoremap <leader>G mqHmwgg=G`wzt`q
" Format entire file
nmap <leader>fef ggVG=

""""""" Terminal
" Quickly open a shell below current window
nnoremap <leader>sh :below 10sp term://$SHELL<cr>

" Automatically go into insert mode when entering terminal window
augroup terminal_insert
  autocmd!
  autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
  autocmd BufWinEnter,WinEnter term://* startinsert
augroup END

""""""" Misc (organize this please!)
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

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Split line (sister to [J]oin lines above)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Insert the directory of the current buffer in command line mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Insert mode movements
" Ctrl-e: Go to end of line
inoremap <c-e> <esc>A
" Ctrl-a: Go to begin of line
inoremap <c-a> <esc>I

" Up and down on wrapped lines
" http://vimbits.com/bits/25
nnoremap j gj
nnoremap k gk

" run Dash (on MAC) to search for word under cursor
nmap <silent> <leader>d <Plug>DashSearch

" Handy code-folding bindings
" - `za` toggles current fold open/close
" - `zc` closes current fold; or parent, if current is already closed
" - `zj` navigates down to top of next fold
" - `zk` navigates up to bottom of previous fold
"
" Refs
" # http://vimcasts.org/episodes/how-to-fold/
" # https://www.linux.com/learn/vim-tips-folding-fun
" # sjl's fold setup: https://bitbucket.org/sjl/dotfiles/src/9bead8a9b4350c57f8a24a8119607a83a9592afe/vim/vimrc?at=default&fileviewer=file-view-default
" nnoremap <Space> za

" =============================================================================
" Abbreviations #abbrev
" These are insert-mode abbreviations
" -----------------------------------------------------------------------------
" Autocorrect my common typos
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
