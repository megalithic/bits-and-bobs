" ================ Plugins ==================== {{{
call plug#begin( '~/.config/nvim/bundle')

Plug 'w0rp/ale' ", { 'do': 'npm install -g prettier' }
Plug 'nelstrom/vim-visual-star-search'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript.jsx'] }
"Plug 'manasthakur/vim-commentor'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript.jsx'] }

" ## Syntax
Plug 'sheerun/vim-polyglot'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'

Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet'
Plug 'dyng/ctrlsf.vim'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'kristijanhusak/vim-js-file-import'
Plug 'sbdchd/neoformat'
Plug 'morhetz/gruvbox'

Plug 'trevordmiller/nova-vim'
Plug 'tpope/vim-commentary' " (un)comment code
Plug 'megalithic/golden-ratio' " vertical split layout manager
Plug 'janko-m/vim-test', {'on': ['TestFile', 'TestLast', 'TestNearest', 'TestSuite', 'TestVisit'] } " tester for js and ruby
Plug 'jordwalke/VimAutoMakeDirectory' " auto-makes the dir for you if it doesn't exist in the path
Plug 'junegunn/rainbow_parentheses.vim' " nicely colors nested pairs of [], (), {}
Plug 'christoomey/vim-tmux-navigator' " needed for tmux/hotkey integration with vim
Plug 'christoomey/vim-tmux-runner' " needed for tmux/hotkey integration with vim
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'unblevable/quick-scope' " highlights f/t type of motions, for quick horizontal movements
Plug 'EinfachToll/DidYouMean'
Plug 'keith/gist.vim', { 'do': 'chmod -HR 0600 ~/.netrc' }
Plug 'tpope/vim-eunuch'

Plug 'honza/vim-snippets'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'

call plug#end()
"}}}
" ================ General Config ==================== {{{

let g:mapleader = ","                                                           "Change leader to a comma

"let g:gruvbox_italic = 1                                                        "Use italic for comments
"let g:gruvbox_invert_selection = 0                                              "Do not invert highlighing on selection
"let g:gruvbox_sign_column = 'none'                                              "Do not use background for sign column

"silent! colorscheme gruvbox
"hi link jsFuncCall GruvboxBlue

silent! colorscheme nova

set termguicolors
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

if has('termguicolors')
  " Don't need this in xterm-256color, but do need it inside tmux.
  " (See `:h xterm-true-color`.)
  if &term =~# 'tmux-256color'
    let &t_8f="\e[38;2;%ld;%ld;%ldm"
    let &t_8b="\e[48;2;%ld;%ld;%ldm"
  endif
endif

set title                                                                       "change the terminal's title
set number                                                                      "Line numbers are good
set relativenumber                                                              "Show numbers relative to current line
set history=500                                                                 "Store lots of :cmdline history
set showcmd                                                                     "Show incomplete cmds down the bottom
set noshowmode                                                                  "Hide showmode because of the powerline plugin
set gdefault                                                                    "Set global flag for search and replace
set gcr=a:blinkon500-blinkwait500-blinkoff500                                   "Set cursor blinking rate
"set cursorline                                                                  "Highlight current line
set smartcase                                                                   "Smart case search if there is uppercase
set ignorecase                                                                  "case insensitive search
set mouse=a                                                                     "Enable mouse usage
set showmatch                                                                   "Highlight matching bracket
set nostartofline                                                               "Jump to first non-blank character
set timeoutlen=1000 ttimeoutlen=0                                               "Reduce Command timeout for faster escape and O
set fileencoding=utf-8                                                          "Set utf-8 encoding on write
set wrap                                                                        "Enable word wrap
set linebreak                                                                   "Wrap lines at convenient points
set listchars=tab:\ \ ,trail:·                                                  "Set trails for tabs and spaces
set list                                                                        "Enable listchars
set lazyredraw                                                                  "Do not redraw on registers and macros
set background=dark                                                             "Set background to dark
set hidden                                                                      "Hide buffers in background
set conceallevel=2 concealcursor=i                                              "neosnippets conceal marker
set splitright                                                                  "Set up new vertical splits positions
set splitbelow                                                                  "Set up new horizontal splits positions
set path+=**                                                                    "Allow recursive search
set inccommand=nosplit                                                          "Show substitute changes immidiately in separate split
set fillchars+=vert:\│                                                          "Make vertical split separator full line
set pumheight=30                                                                "Maximum number of entries in autocomplete popup
set exrc                                                                        "Allow using local vimrc
set secure                                                                      "Forbid autocmd in local vimrc
set grepprg=rg\ --vimgrep                                                       "Use ripgrep for grepping
set tagcase=smart                                                               "Use smarcase for tags
set updatetime=500                                                              "Cursor hold timeout
set synmaxcol=300                                                               "Use syntax highlighting only for 300 columns


" -------- dictionary and spelling

set dictionary+=/usr/share/dict/words
set nospell             " Disable spellchecking by default
set spelllang=en_us,en_gb
set spellfile=~/.config/nvim/spell/en.utf-8.add


" -------- clipboard
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


" -------- per-folder vim settings
set exrc
set secure " disable unsafe commands in local .vimrc files


" -------- abbreviations/spellings
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

" }}}
" ================ Turn Off Swap Files ============== {{{

set noswapfile
set nobackup
set nowb

" }}}
" ================ Persistent Undo ================== {{{

" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" }}}
" ================ Indentation ====================== {{{

set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set nofoldenable
set foldmethod=syntax

" }}}
" ================ Autocommands ====================== {{{

augroup vimrc
  autocmd!
augroup END

autocmd vimrc QuickFixCmdPost [^l]* cwindow                                     "Open quickfix window after grepping
autocmd vimrc BufWritePre * call StripTrailingWhitespaces()                     "Auto-remove trailing spaces
"autocmd vimrc InsertEnter * set nocul                                           "Remove cursorline highlight
"autocmd vimrc InsertLeave * set cul                                             "Add cursorline highlight in normal mode
autocmd vimrc FileType php setlocal sw=4 sts=4 ts=4                             "Set indentation to 4 for php
autocmd vimrc FileType javascript setlocal formatprg=prettier\ --stdin
      \\ --single-quote\ --print-width\ 100                                     "Setup prettier options for neoformat
autocmd vimrc FocusGained,BufEnter * checktime                                  "Refresh file when vim gets focus
autocmd vimrc FileType javascript nnoremap <buffer><silent><C-]> :JsGotoDefinition<CR>
autocmd vimrc FileType javascript nnoremap <buffer><silent><Leader>] <C-W>v:JsGotoDefinition<CR>
autocmd BufRead,BufNewFile .{babel,eslint,prettier,stylelint,jshint,jscs}*rc,\.tern-*,*.json set ft=json
autocmd BufNewFile,BufRead .tern-project set ft=json


" ----------------------------------------------------------------------------
" ## Toggle certain accoutrements when entering and leaving a buffer & window
" NOTE: the syntax highlighting fails when using FZF and BufEnter
" FIXME: we really want to still be able to flip between syntax highlighting
" on and off.
" au WinEnter,BufEnter * silent set number relativenumber syntax=on " cul
" au WinLeave,BufLeave * silent set nonumber norelativenumber syntax=off " nocul

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

" }}}
" ================ Completion ======================= {{{

set wildmode=list:full
set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
set wildignore+=*.git*
set wildignore+=*.meteor*
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" }}}
" ================ Scrolling ======================== {{{

set scrolloff=8                                                                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5

" }}}
" ================ Statusline ======================== {{{

hi User1 guifg=#FF0000 guibg=#504945 gui=bold
hi User2 guifg=#FFFFFF guibg=#FF1111 gui=bold
hi User3 guifg=#2C323C guibg=#E5C07B gui=bold
set statusline=\ %{toupper(mode())}                                             "Mode
set statusline+=\ \│\ %{fugitive#head()}                                        "Git branch
set statusline+=%{GitFileStatus()}                                              "Git file status
set statusline+=\ \│\ %4F                                                       "File path
set statusline+=\ %1*%m%*                                                       "Modified indicator
set statusline+=\ %w                                                            "Preview indicator
set statusline+=\ %r                                                            "Read only indicator
set statusline+=\ %q                                                            "Quickfix list indicator
set statusline+=\ %=                                                            "Start right side layout
set statusline+=\ %{&enc}                                                       "Encoding
set statusline+=\ \│\ %y                                                        "Filetype
set statusline+=\ \│\ %p%%                                                      "Percentage
set statusline+=\ \│\ %c                                                        "Column number
set statusline+=\ \│\ %l/%L                                                     "Current line number/Total line numbers
set statusline+=\ %{gutentags#statusline('\│\ ')}                               "Tags status
set statusline+=\ %2*%{AleStatusline('error')}%*                                "Errors count
set statusline+=%3*%{AleStatusline('warning')}%*                                "Warning count

"}}}
" ================ Abbreviations ==================== {{{

cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev bD bd
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap

" }}}
" ================ Functions ======================== {{{

function! StripTrailingWhitespaces()
  if &modifiable
    let l:l = line(".")
    let l:c = col(".")
    %s/\s\+$//e
    call cursor(l:l, l:c)
  endif
endfunction

function! Search(...)
  let default = a:0 > 0 ? expand('<cword>') : ''
  let term = input('Search for: ', default)
  if term != ''
    let path = input('Path: ', '', 'file')
    execute 'CtrlSF "'.term.'" '.path
  endif
endfunction

function! AleStatusline(type)
  let count = ale#statusline#Count(bufnr(''))
  if a:type == 'error' && count['error']
    return printf(' %d E ', count['error'])
  endif

  if a:type == 'warning' && count['warning']
    let l:space = count['error'] ? ' ': ''
    return printf('%s %d W ', l:space, count['warning'])
  endif

  return ''
endfunction

function! FormatSelection() range
  exe ":'<,'>Neoformat! ".&ft." | norm!gv="
endfunction

function! GitFileStatus()
  if !exists('b:gitgutter')
    return ''
  endif
  let l:summary = get(b:gitgutter, 'summary', [0, 0, 0])
  let l:result = l:summary[0] == 0 ? '' : ' +'.l:summary[0]
  let l:result .= l:summary[1] == 0 ? '' : ' ~'.l:summary[1]
  let l:result .= l:summary[2] == 0 ? '' : ' -'.l:summary[2]
  if l:result != ''
    return ' '.l:result
  endif
  return l:result
endfunction

function! CloseBuffer() abort
  if &buftype ==? 'quickfix'
    bd
    return 1
  endif
  let l:nerdtreeOpen = g:NERDTree.IsOpen()
  let l:windowCount = winnr('$')
  let l:command = 'bd'
  let l:totalBuffers = len(getbufinfo({ 'buflisted': 1 }))
  let l:isNerdtreeLast = l:nerdtreeOpen && l:windowCount ==? 2
  let l:noSplits = !l:nerdtreeOpen && l:windowCount ==? 1
  if l:totalBuffers > 1 && (l:isNerdtreeLast || l:noSplits)
    let l:command = 'bp|bd#'
  endif
  silent exe l:command
endfunction


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

  set spell
  set spelllang=en
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



" }}}
" ================ Custom Mappings ======================== {{{

" Comment map
"nmap <Leader>c gcc
" Line comment command
"xmap <Leader>c gc


" Down is really the next line
nnoremap j gj
nnoremap k gk

" Expand snippets on tab if snippets exists, otherwise do autocompletion
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \ : pumvisible() ? "\<C-n>" : "\<TAB>"
" If popup window is visible do autocompletion from back
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Fix for jumping over placeholders for neosnippet
smap <expr><TAB> neosnippet#jumpable() ?
      \ "\<Plug>(neosnippet_jump)"
      \: "\<TAB>"

" Map for Escape key
inoremap jj <Esc>
tnoremap <Leader>jj <C-\><C-n>

" Yank to the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap <C-c> "+y
" Paste from system clipboard with Ctrl + v
inoremap <C-v> <Esc>"+p
nnoremap <Leader>p "0p
vnoremap <Leader>p "0p
nnoremap <Leader>h viw"0p

" Move to the end of yanked text after yank and paste
nnoremap p p`]
vnoremap y y`]
vnoremap p p`]

" Move selected lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Clear search highlight
nnoremap <Leader><space> :noh<CR>

" Handle syntastic error window
nnoremap <Leader>e :lopen<CR>
nnoremap <silent><Leader>q :call CloseBuffer()<CR>

" Find current file in NERDTree
nnoremap <Leader>hf :NERDTreeFind<CR>
" Open NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Toggle between last 2 buffers
nnoremap <leader><tab> <c-^>

" Filesearch plugin map for searching in whole folder
nnoremap <Leader>f :call Search()<CR>
nnoremap <Leader>F :call Search(1)<CR>

" Toggle buffer list
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>m :History<CR>

" Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv

" Resize window with shift + and shift -
nnoremap + <c-w>5>
nnoremap _ <c-w>5<

" Center highlighted search
nnoremap n nzz
nnoremap N Nzz

"Disable ex mode mapping
map Q <Nop>

" Jump to definition in vertical split
nnoremap <Leader>] <C-W>v<C-]>

" Reformat and fix linting errors
nnoremap <Leader>r :ALEFix<CR>
vnoremap <Leader>r :call FormatSelection()<CR>

" Close all other buffers except current one
nnoremap <Leader>db :silent w <BAR> :silent %bd <BAR> e#<CR>

" ------------------------------------------------------------------

" folding toggle
nnoremap <space> za

" ## vim-commentary
nmap <leader>c :Commentary<cr>
vmap <leader>c :Commentary<cr>

" ## FZF
nnoremap <silent> <leader>m <esc>:FZF<cr>
nnoremap <leader>a <esc>:Rg<space>
nnoremap <silent> <leader>A  <esc>:exe('Rg '.expand('<cword>'))<cr>
" Backslash as shortcut to ag
nnoremap \ :Rg<SPACE>

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

" ## Testing vim-test
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>T :TestNearest<CR>
" nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
" ref: https://github.com/Dkendal/dot-files/blob/master/nvim/.config/nvim/init.vim

" ## Gist/Github
" Send visual selection to gist.github.com as a private, filetyped Gist
" Requires the gist command line too (brew install gist)
vnoremap <leader>G :Gist -po<cr>

" ## Surround
vmap [ S]
vmap ( S)
vmap { S}
vmap ' S'
vmap " S"

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
"
" gi already moves to 'last place you exited insert mode', so we'll map gI to
" something similar: move to last change
nnoremap gI `.

" Make D behave
nnoremap D d$

" Delete a line and not keep it in a register
nnoremap X Vx

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


" }}}
" ================ Plugins Settings ======================== {{{

" ## polyglot
let g:polyglot_disabled = ['typescript']

" ## golden-ratio
let g:golden_ratio_exclude_nonmodifiable = 1
let g:golden_ratio_wrap_ignored = 0
let g:golden_ratio_ignore_horizontal_splits = 1

" ## auto-pairs
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsMapCR = 0 " https://www.reddit.com/r/neovim/comments/4st4i6/making_ultisnips_and_deoplete_work_together_nicely/d6m73rh/

let g:ctrlsf_auto_close = 0                                                     "Do not close search when file is opened
let g:ctrlsf_mapping = {'vsplit': 's'}                                          "Mapping for opening search result in vertical split

let g:NERDTreeChDirMode = 2                                                     "Always change the root directory
let g:NERDTreeMinimalUI = 1                                                     "Disable help text and bookmark title
let g:NERDTreeShowHidden = 1                                                    "Show hidden files in NERDTree
let g:NERDTreeUpdateOnCursorHold = 0                                            "Disable nerdtree git plugin updating on cursor hold

" ## emmet
let g:user_emmet_leader_key = '<c-e>'                                           "Change trigger emmet key
" let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
      \  'javascript.jsx' : {
      \      'extends' : 'jsx',
      \  },
      \}

let g:neosnippet#disable_runtime_snippets = {'_' : 1}                           "Snippets setup
let g:neosnippet#snippets_directory = ['~/.config/nvim/snippets']               "Snippets directory

let g:deoplete#enable_at_startup = 1                                            "Enable deoplete autocompletion
let g:deoplete#file#enable_buffer_path = 1                                      "Autocomplete files relative to current buffer
let g:deoplete#tag#cache_limit_size = 20000000                                  "Allow tags file up to ~20 MB
let g:deoplete#max_list = 30                                                    "Show maximum of 30 entries in autocomplete popup
let g:deoplete#enable_camel_case = 1                                            "Enable camel case completion

let g:delimitMate_expand_cr = 2                                                 "Auto indent on enter

let g:neoformat_try_formatprg = 1                                               "Use formatprg when available

let g:ale_enabled = 1
let g:ale_linters = {
      \   'javascript': ['prettier', 'eslint'],
      \   'typescript': ['prettier', 'eslint']
      \ }                                                                       "Lint js with eslint
let g:ale_fixers = {
      \   'javascript': ['prettier', 'eslint', 'prettier_eslint'],
      \   'typescript': ['prettier', 'eslint', 'prettier_eslint']
      \ }                                                                       "Fix eslint errors
" let g:ale_javascript_prettier_options = '--print-width 100'                     "Set max width to 100 chars for prettier
let g:ale_sign_error = '✖'                                                      "Lint error sign
let g:ale_sign_warning = '⚠'                                                    "Lint warning sign
let g:ale_javascript_eslint_use_local_config = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_prettier_eslint_use_local_config = 1

let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1

" ## vim-jsx
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 0

let g:javascript_plugin_jsdoc = 1                                               "Enable syntax highlighting for js doc blocks

let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]                            "Use dropbox folder for easier syncing of wiki

" ## vim-json
let g:vim_json_syntax_conceal = 0

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


" ## vim-better-javascript-completion
let g:vimjs#casesensistive = 1
" Enabled by default. flip the value to make completion matches case insensitive
let g:vimjs#smartcomplete = 0
" Disabled by default. Enabling this will let vim complete matches at any location
" e.g. typing 'ocument' will suggest 'document' if enabled.
let g:vimjs#chromeapis = 0
" Disabled by default. Toggling this will enable completion for a number of Chrome's JavaScript extension APIs


" ## vim-javascript-syntax
let g:JSHintHighlightErrorLine = 1
let javascript_enable_domhtmlcss = 1
let loaded_matchit = 1
let g:js_indent_log = 1
let g:used_javascript_libs = 'underscore,chai,react,flux,mocha,redux,lodash,angularjs,angularui,enzyme,ramda,d3'

" ## JSDoc
" https://github.com/heavenshell/vim-jsdoc#configuration
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_enable_es6 = 1
let g:jsdoc_access_descriptions=2
let g:jsdoc_additional_descriptions=1


" ## rainbow_parentheses.vim
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]


" ## vim-test
function! SplitStrategy(cmd)
  vert new | call termopen(a:cmd) | startinsert
endfunction
let g:test#custom_strategies = {'terminal_split': function('SplitStrategy')}
let g:test#strategy = 'terminal_split'
let test#ruby#rspec#options = '-f d'
let test#ruby#bundle_exec = 1

" ## quick-scope
let g:qs_enable = 0

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


" ## gist.vim
let g:gist_open_url = 1
let g:gist_default_private = 1
" }}}
" ================ Highlights and Colors ======================== {{{
hi htmlArg cterm=italic
hi xmlAttrib cterm=italic
hi Type cterm=italic
hi Normal ctermbg=none
hi Comment cterm=italic term=italic gui=italic
hi LineNr guibg=#3C4C55 guifg=#937f6e gui=NONE
hi CursorLineNr ctermbg=black ctermfg=223 cterm=NONE guibg=#333333 guifg=#db9c5e gui=bold
hi qfLineNr ctermbg=black ctermfg=95 cterm=NONE guibg=black guifg=#875f5f gui=NONE
" }}}

" vim:foldenable:foldmethod=marker
