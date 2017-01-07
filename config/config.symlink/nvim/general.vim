" -/ General Settings /---------------------------------------------

" -----------------------------------------------------------------------------
" ## UI
set background=dark
" colorscheme base16-ocean
colorscheme onedark
" colorscheme OceanicNext

" let g:oceanic_next_terminal_italic = 1
" let g:oceanic_next_terminal_bold = 1

" change vim cursor depending on the mode
if has('nvim')
  set termguicolors
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

  let g:python_host_prog = '/usr/local/bin/python2'
  let g:python3_host_prog = '/usr/local/bin/python3'
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
set relativenumber number
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

" -----------------------------------------------------------------------------
" ## Folding
set nofoldenable        "dont fold by default
" set foldmethod=indent   "fold based on indent
" set foldnestmax=5      "deepest fold is 5 levels
" set foldlevel=99
" set foldlevelstart=0
" set fcs=fold:-
" let ruby_fold = 1
" let javascript_fold = 1

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
set completeopt=menu,menuone
set completeopt-=preview
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
