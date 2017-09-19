" -/ General Settings /---------------------------------------------

" -----------------------------------------------------------------------------
" ## UI
syntax enable

if has('nvim')
  set termguicolors
  set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

  set background=dark

  let g:one_allow_italics = 1
  let g:onedark_terminal_italics = 1
  let g:oceanic_next_terminal_italic = 1
  let g:oceanic_next_terminal_bold = 1

  colorscheme OceanicNext
  " colorscheme onedark
  " colorscheme one

  let os=substitute(system('uname'), '\n', '', '')
  if os == 'Darwin' || os == 'Mac'
    let g:python_host_prog='/usr/local/bin/python2'
    let g:python3_host_prog='/usr/local/bin/python3'
  elseif os == 'Linux'
    let g:python_host_prog='/usr/bin/python2'
    let g:python3_host_prog='/usr/bin/python3'
  endif

  let g:python_host_skip_check = 1
  let g:python3_host_skip_check = 1
else
  colorscheme base16-ocean

  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
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

set synmaxcol=400 " turn off syntax highlight beyond 500 chars
set showcmd " show incomplete commands
set ruler " show the cursor position all the time
set scrolloff=5
set sidescroll=1
set sidescrolloff=10
set scroll=3
set lazyredraw "may be the cause of lots of issues
set ttyfast

" NOTE: also handled in autocommands.vim
" set cul " turn on cursorline highlighting -- needed for linenumber HL too

set listchars=tab:▸\ ,eol:¬,extends:›,precedes:‹,trail:·,nbsp:⚋
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
if has('folding')
  if has('windows')
    let &fillchars='vert: '           " less cluttered vertical window separators
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
set tenc=utf-8          " Terminal encoding used for terminal display

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


" TODO: understand all this better:
" https://github.com/chemzqm/vimrc/blob/master/abbr.vim
"
" function! SetupCommandAbbrs(from, to)
"   exec 'cnoreabbrev <expr> '.a:from
"         \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
"         \ .'? ("'.a:to.'") : ("'.a:from.'"))'
" endfunction

" call SetupCommandAbbrs('Co', 'Copy')
" call SetupCommandAbbrs('G', 'GundoToggle')
" call SetupCommandAbbrs('Gd', 'Gdiff')
" call SetupCommandAbbrs('Gt', 'GdiffThis')
" call SetupCommandAbbrs('Gs', 'Gstatus')
" call SetupCommandAbbrs('Gc', 'GcommitCurrent')
" call SetupCommandAbbrs('Gp', 'Gpush')
" call SetupCommandAbbrs('Gci', 'Gcommit -v')
" call SetupCommandAbbrs('Gca', 'Gcommit -a -v')
" call SetupCommandAbbrs('Gcaa', 'Gcommit --amend -a -v')
" call SetupCommandAbbrs('Gco', 'Gcheckout')
" call SetupCommandAbbrs('Grm', 'Gremove')
" call SetupCommandAbbrs('Grh', 'Greset HEAD')
" call SetupCommandAbbrs('Gmv', 'Gmove')
" call SetupCommandAbbrs('L', 'Gitlog')
" call SetupCommandAbbrs('U', 'UltiSnipsEdit')
" call SetupCommandAbbrs('P', 'Publish')
" call SetupCommandAbbrs('N', 'Note')
" call SetupCommandAbbrs('T', 'tabe')
" call SetupCommandAbbrs('D', 'Dict')
" call SetupCommandAbbrs('R', 'Rename')
" call SetupCommandAbbrs('M', 'Mdir')
" call SetupCommandAbbrs('E', 'EditVimrc')
" call SetupCommandAbbrs('S', 'SourceTest')
" call SetupCommandAbbrs('A', 'TodoAdd')
" call SetupCommandAbbrs('Ex', 'Execute')
" call SetupCommandAbbrs('Ns', 'NoteSearch')
" call SetupCommandAbbrs('Done', 'Unite todo:done')
