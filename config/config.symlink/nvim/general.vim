" -/ General Settings /---------------------------------------------

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

  if has('termguicolors')
    " Don't need this in xterm-256color, but do need it inside tmux.
    " (See `:h xterm-true-color`.)
    if &term =~# 'tmux-256color'
      let &t_8f="\e[38;2;%ld;%ld;%ldm"
      let &t_8b="\e[48;2;%ld;%ld;%ldm"
    endif
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


" -/ Highlighting /------------------------------------------------
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

" Highlight VCS conflict markers
" match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'


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
