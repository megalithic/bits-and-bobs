" ================ Plugins ==================== {{{
call plug#begin( '~/.config/nvim/bundle')

Plug 'tweekmonster/startuptime.vim', { 'on': [ 'StartupTime' ] } " Show slow plugins
" `:Bufferize messages` to get messages (or any :command) in a new buffer
" let g:bufferize_command = 'tabnew'
" Plug 'AndrewRadev/bufferize.vim', { 'on': [ 'Bufferize' ] }
Plug 'w0rp/ale' " , { 'do': 'npm install -g prettier prettier-eslint-cli' }
Plug 'nelstrom/vim-visual-star-search'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript.jsx'] }
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript.jsx', 'javascript', 'typescript'] }
Plug 'Valloric/MatchTagAlways', { 'for': ['haml', 'html', 'xml', 'erb', 'javascript', 'javascript.jsx', 'typescript'] } " highlights the opening/closing tags for the block you're in
Plug 'jiangmiao/auto-pairs'
Plug 'cohama/lexima.vim' " auto-closes many delimiters and can repeat with a `.`

" ## Syntax
" Plug 'sheerun/vim-polyglot'
" Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'jsx'] }
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx', 'jsx', 'typescript'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx', 'jsx', 'js'] }
Plug 'elzr/vim-json', { 'for': ['json'] }
Plug 'ElmCast/elm-vim', { 'for': ['elm'] }
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
Plug 'reasonml-editor/vim-reason-plus', { 'for': ['reason'] }
Plug 'othree/csscomplete.vim', { 'for': ['css', 'scss', 'sass'] } " css completion
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss', 'sass'] } " css3-specific syntax
Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass'] }
Plug 'othree/html5.vim', { 'for': ['html', 'haml'] }
Plug 'tpope/vim-markdown', { 'for': ['markdown', 'md', 'mdown'] }
Plug 'jtratner/vim-flavored-markdown', { 'for': ['markdown'] }
Plug 'martin-svk/vim-yaml', { 'for': ['yaml'] }
Plug 'tpope/vim-haml', { 'for': ['haml'] }
Plug 'tyru/markdown-codehl-onthefly.vim', { 'for': ['markdown', 'md', 'mdown'] }
Plug 'othree/xml.vim', { 'for': ['xml'] }
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
Plug 'shougo/vimproc.vim', { 'do': 'make' } " | Plug 'osyo-manga/vim-monster', { 'for': ['ruby'], 'do': 'gem install fastri rcodetools' }
Plug 'tpope/vim-bundler', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
Plug 'xolox/vim-misc' | Plug 'xolox/vim-lua-ftplugin', { 'for': ['lua'] } " all the luas
Plug 'tmux-plugins/vim-tmux', { 'for': ['tmux'] }
Plug 'vim-scripts/fish.vim',   { 'for': 'fish' }
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' } " rspec commands and highlight
Plug 'sickill/vim-pasta' " context-aware pasting

" # completions
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
" Plug 'roxma/ncm-rct-complete'
" Plug 'autozimu/LanguageClient-neovim', {'tag': 'binary-*-x86_64-apple-darwin', 'do': ':UpdateRemotePlugins'}
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
" Plug 'mhartington/nvim-typescript', { 'for': ['typescript'], 'do': ':UpdateRemotePlugins' }
Plug 'calebeby/ncm-css', { 'for': ['scss', 'css', 'sass', 'less'] }

" # tags + completions
if executable('ctags')
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'kristijanhusak/vim-js-file-import'
endif

" # snippets + completions
if has('python3')
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'epilande/vim-es2015-snippets'
  Plug 'epilande/vim-react-snippets'
endif

" Plug 'Valloric/ListToggle'
" Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sbdchd/neoformat'

Plug 'trevordmiller/nova-vim'
Plug 'tpope/vim-commentary' " (un)comment code
Plug 'megalithic/golden-ratio' " vertical split layout manager
Plug 'janko-m/vim-test', {'on': ['TestFile', 'TestLast', 'TestNearest', 'TestSuite', 'TestVisit'] } " tester for js and ruby
Plug 'jordwalke/VimAutoMakeDirectory' " auto-makes the dir for you if it doesn't exist in the path
Plug 'junegunn/rainbow_parentheses.vim' " nicely colors nested pairs of [], (), {}
Plug 'tpope/vim-ragtag', { 'for': ['html', 'xml', 'erb', 'haml', 'javascript.jsx', 'typescript', 'javascript'] } " a set of mappings for several langs: html, xml, erb, php, more
Plug 'docunext/closetag.vim' " will auto-close the opening tag as soon as you type </
Plug 'tpope/vim-endwise'
Plug 'zenbro/mirror.vim' " allows mirror'ed editing of files locally, to a specified ssh location via ~/.mirrors
Plug 'christoomey/vim-tmux-navigator' " needed for tmux/hotkey integration with vim
Plug 'christoomey/vim-tmux-runner' " needed for tmux/hotkey integration with vim
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'unblevable/quick-scope' " highlights f/t type of motions, for quick horizontal movements
Plug 'EinfachToll/DidYouMean'
Plug 'keith/gist.vim', { 'do': 'chmod -HR 0600 ~/.netrc' }
Plug 'tpope/vim-eunuch'

" ## Text Objects, et al
Plug 'kana/vim-operator-user'
" -- provide ai and ii for indent blocks
" -- provide al and il for current line
" -- provide a_ and i_ for underscores
" -- provide a- and i-
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire' " Entire buffer text object (vae)
Plug 'nelstrom/vim-textobj-rubyblock' " Ruby block text object (vir)
Plug 'kana/vim-textobj-function' " Function text object (vaf)
Plug 'glts/vim-textobj-comment' " Comment text object (vac)
Plug 'michaeljsmith/vim-indent-object'
" - d/D   for underscore section (e.g. `did` on foo_b|ar_baz -> foo__baz)
Plug 'machakann/vim-textobj-delimited', { 'on': [
      \   '<Plug>(textobj-delimited'
      \ ] }
" - i     for indent level
Plug 'kana/vim-textobj-indent', { 'on': [ '<Plug>(textobj-indent' ] }
" - l     for current line
Plug 'kana/vim-textobj-line', { 'on': [ '<Plug>(textobj-line' ] }
" - P     for last paste
Plug 'gilligan/textobj-lastpaste', { 'on': [ '<Plug>(textobj-lastpaste' ] }
" - u     for url
Plug 'mattn/vim-textobj-url', { 'on': [ '<Plug>(textobj-url' ] }
" - b     for any block type (parens, braces, quotes, ltgt)
Plug 'rhysd/vim-textobj-anyblock'
" - x     for xml attr like `data-content="everything"`
Plug 'whatyouhide/vim-textobj-xmlattr', { 'on': [
      \   '<Plug>(textobj-xmlattr',
      \ ] }
Plug 'wellle/targets.vim' " Improved targets line cin) next parens
" ^--- https://github.com/wellle/targets.vim/blob/master/cheatsheet.md

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

" let g:ruby_host_prog = '$RUBY_ROOT/bin/ruby'

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
set linebreak
set textwidth=79 " will auto wrap content when set
set nowrap " `on` is 'wrap'
set wrapscan
set listchars=tab:▸\ ,eol:¬,extends:›,precedes:‹,trail:·,nbsp:⚋
set nolist " list to enable                                                                        "Enable listchars
set lazyredraw                                                                  "Do not redraw on registers and macros
set ttyfast
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

" if more than 1 files are passed to vim as arg, open them in vertical splits
if argc() > 1
  silent vertical all
endif



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
" silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
" set undodir=~/.config/nvim/backups
" set undofile

" }}}
" ================ Indentation ====================== {{{

set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set nofoldenable
" set foldmethod=syntax

" }}}
" ================ Autocommands ====================== {{{

augroup vimrc
  autocmd!
  " au QuickFixCmdPost [^l]* cwindow                                     "Open quickfix window after grepping
  au BufWritePre * call StripTrailingWhitespaces()                     "Auto-remove trailing spaces
  "au InsertEnter * set nocul                                           "Remove cursorline highlight
  "au InsertLeave * set cul                                             "Add cursorline highlight in normal mode
  au FocusGained,BufEnter * checktime                                  "Refresh file when vim gets focus

  " ## Handle window resizing
  au VimResized * execute "normal! \<c-w>="

  " No formatting on o key newlines
  au BufNewFile,BufEnter * set formatoptions-=o

  " ----------------------------------------------------------------------------
  " ## JavaScript
  au FileType javascript nnoremap <buffer><silent><C-]> :JsGotoDefinition<CR>
  au FileType javascript nnoremap <buffer><silent><Leader>] <C-W>v:JsGotoDefinition<CR>
  " au FileType typescript,javascript,javascript.jsx,sass,scss,scss.css RainbowParentheses
  au BufRead,BufNewFile .{babel,eslint,prettier,stylelint,jshint,jscs}*rc,\.tern-*,*.json set ft=json
  au BufNewFile,BufRead .tern-project set ft=json

  " ----------------------------------------------------------------------------
  " ## CSS/SCSS
  " make sure `complete` works as expected for CSS class names whithout
  " messing with motions (eg. '.foo-bar__baz') and we make sure all
  " delimiters (_,-,$,%,.) are treated as word separators outside insert mode
  au InsertEnter,BufLeave * setl iskeyword=@,48-57,192-255,\@,\$,%,-,_
  au InsertLeave,BufEnter * setl iskeyword=@,48-57,192-255
  " https://github.com/rstacruz/vimfiles/blob/master/plugin/plugins/css3-syntax.vim
  au FileType css,css.scss,sass,scss setl iskeyword+=-
  " au FileType scss set iskeyword+=-
  au FileType css,css.scss,sass,scss setl formatoptions+=croql

  " ----------------------------------------------------------------------------
  " ## Markdown
  au BufNewFile,BufRead,BufReadPost *.{md,mdwn,mkd,mkdn,mark*} set nolazyredraw ft=ghmarkdown
  au FileType markdown,text,html setlocal spell complete+=kspell
  au FileType markdown,text,html hi SpellBad guibg=#ff2929 guifg=#ffffff" ctermbg=224
  au FileType markdown set tw=80

  " ----------------------------------------------------------------------------
  " ## Ruby
  au FileType ruby setl iskeyword+=_

  " ----------------------------------------------------------------------------
  " ## SSH
  au BufNewFile,BufRead */ssh/config  setf sshconfig
  au BufNewFile,BufRead ssh_config,*/.dotfiles/private/ssh/config  setf sshconfig

  " ----------------------------------------------------------------------------
  " ## Completions
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

  " ----------------------------------------------------------------------------
  " ## Fixing/Linting

  " ----------------------------------------------------------------------------
  " ## Toggle certain accoutrements when entering and leaving a buffer & window
  au WinEnter,BufEnter * silent set number relativenumber syntax=on " cul
  au WinLeave,BufLeave * silent set nonumber norelativenumber syntax=off " nocul

  " ----------------------------------------------------------------------------
  " ## Automagically update remote homeassistant files upon editing locally
  au BufWritePost ~/.dotfiles/private/homeassistant/* silent! :MirrorPush ha

  " ----------------------------------------------------------------------------
  " ## Toggle colorcolumn when in insert mode for visual 80char indicator
  au BufEnter,FocusGained,InsertLeave * silent set relativenumber
  au BufLeave,FocusLost,InsertEnter   * silent set norelativenumber
  au InsertEnter * silent set colorcolumn=80
  au InsertLeave * silent set colorcolumn=""
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

  autocmd! TermOpen * setlocal nonumber norelativenumber
  autocmd! TermOpen * if &buftype == 'terminal'
        \| set nonumber norelativenumber
        \| endif
augroup END

" Automatically close vim if only the quickfix window is open
" http://stackoverflow.com/a/7477056/3720597
augroup QuickFixClose
    autocmd!
    autocmd WinEnter * if winnr('$') == 1 &&
                \getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"
                \| q
                \| endif
augroup END

augroup MakeQuickFixPrettier
    autocmd!
    autocmd BufRead * if &buftype == 'quickfix'
                \| setlocal colorcolumn=
                \| setlocal nolist
                \| endif
augroup END


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

set shortmess+=c

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

" function! PlugIf(condition, ...) abort
"   let l:enabled = a:condition ? {} : { 'on': [], 'for': [] }
"   return a:0 ? extend(l:enabled, a:000[0]) : l:enabled
" endfunction

" " Shortcut
" function! WithCompl(...) abort
"   return call('PlugIf', [ g:megalithic_use_completion ] + a:000)
" endfunction

function! RemoveTypescriptIncompatibilityBanner(...) abort
  " echo "should remove banner now"
endfunction

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

  " disable for gitcommit messages
  let g:cm_smart_enable = 0

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
" ================ Plugin Config ======================== {{{

" ## listtoggle
" let g:lt_location_list_toggle_map = '<F3>'
" let g:lt_quickfix_list_toggle_map = '<F4>'
" let g:lt_height = 3

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

let g:delimitMate_expand_cr = 2                                                 "Auto indent on enter

" let g:neoformat_javascript_eslint = {
"       \ 'args': ['--write', '--eslint-config-path ./.eslintrc'],
"       \ 'replace': 1
"       \ }
" let g:neoformat_typescript_eslint = {
"       \ 'args': ['--write', '--eslint-config-path ./.eslintrc'],
"       \ 'replace': 1
"       \ }
" let g:neoformat_javascript_prettiereslint = {
"       \ 'exe': './node_modules/.bin/prettier-eslint',
"       \ 'args': ['--write', '--eslint-config-path ./.eslintrc'],
"       \ 'replace': 1
"       \ }
" let g:neoformat_typescript_prettiereslint = {
"       \ 'exe': './node_modules/.bin/prettier-eslint',
"       \ 'args': ['--write', '--eslint-config-path ./.eslintrc'],
"       \ 'replace': 1
"       \ }
" let g:neoformat_try_formatprg = 1                                               "Use formatprg when available
" let g:neoformat_enabled_javascript = ['prettiereslint', 'eslint']
" let g:neoformat_enabled_typescript = ['prettiereslint', 'eslint']
" let g:neoformat_enabled_scss = ['prettier']
" let g:neoformat_enabled_css = ['prettier']
" let g:neoformat_enabled_json = ['prettier']


let g:ale_enabled = 1
let g:ale_linters = {
      \   'javascript': ['prettier', 'eslint', 'prettier_eslint'],
      \   'typescript': ['prettier', 'eslint', 'prettier_eslint'],
      \   'css': ['prettier'],
      \   'scss': ['prettier'],
      \   'json': ['prettier']
      \ }                                                                       "Lint js with eslint
let g:ale_fixers = {
      \   'javascript': ['prettier_eslint'],
      \   'typescript': ['prettier_eslint'],
      \   'css': ['prettier'],
      \   'scss': ['prettier'],
      \   'json': ['prettier']
      \ }                                                                       "Fix eslint errors
let g:ale_sign_error = '✖'                                                      "Lint error sign
let g:ale_sign_warning = '~~'                                                    "Lint warning sign
let g:ale_javascript_eslint_use_local_config = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_prettier_eslint_use_local_config = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1

" ## vim-jsx
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 0

let g:javascript_plugin_jsdoc = 1                                               "Enable syntax highlighting for js doc blocks

" ## vim-json
let g:vim_json_syntax_conceal = 0

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
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --ignore-case --no-heading --no-messages --hidden --color=always '
      \   . <q-args>, 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%', '?'),
      \   <bang>0)

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>,
      \   fzf#vim#with_preview('right:50%', '?'),
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


" ## ultisnips
let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0


" ## lsp/languageclient/nvim-completion-manager/ncm
let g:cm_smart_enable = 1
let g:LanguageClient_diagnosticsList = 'location' " quickfix is used by :Rg
let g:LanguageClient_autoStart = 1 " Automatically start language servers.

augroup LanguageClientConfig
  autocmd!
  " " <leader>ld to go to definition
  " autocmd FileType javascript,javascript.jsx,python,typescript,json,css,less,html nnoremap <buffer> <leader>ld :call LanguageClient_textDocument_definition()<cr>
  " " <leader>lf to autoformat document
  " autocmd FileType javascript,javascript.jsx,python,typescript,json,css,less,html nnoremap <buffer> <leader>lf :call LanguageClient_textDocument_formatting()<cr>
  " " <leader>lh for type info under cursor
  " autocmd FileType javascript,javascript.jsx,python,typescript,json,css,less,html nnoremap <buffer> <leader>lh :call LanguageClient_textDocument_hover()<cr>
  " " <leader>lr to rename variable under cursor
  " autocmd FileType javascript,javascript.jsx,python,typescript,json,css,less,html nnoremap <buffer> <leader>lr :call LanguageClient_textDocument_rename()<cr>
  " " <leader>lc to switch omnifunc to LanguageClient
  " autocmd FileType javascript,javascript.jsx,python,typescript,json,css,less,html nnoremap <buffer> <leader>lc :setlocal omnifunc=LanguageClient#complete<cr>
  " " <leader>ls to fuzzy find the symbols in the current document
  " autocmd FileType javascript,javascript.jsx,python,typescript,json,css,less,html nnoremap <buffer> <leader>ls :call LanguageClient_textDocument_documentSymbol()<cr>

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
endif

if executable('css-languageserver')
  let g:LanguageClient_serverCommands.css = ['css-languageserver', '--stdio']
  let g:LanguageClient_serverCommands.less = ['css-languageserver', '--stdio']
  let g:LanguageClient_serverCommands.scss = ['css-languageserver', '--stdio']
  let g:LanguageClient_serverCommands.sass = ['css-languageserver', '--stdio']
endif

let g:LanguageClient_serverCommands.html = ['html-languageserver', '--stdio']
let g:LanguageClient_serverCommands.json = ['json-languageserver', '--stdio']


" ## asyncomplete.vim/asynccomplete/vim-lsp
" let g:asyncomplete_auto_popup = 1
" let g:asyncomplete_remove_duplicates = 1
" let g:asyncomplete_smart_completion = 1
" let g:asyncomplete_min_chars = 2
" let g:lsp_signs_enabled = 0         " enable signs
" let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
" let g:lsp_signs_error = {'text': '✖'}
" let g:lsp_signs_warning = {'text': '~'} " icons require GUI
" let g:lsp_signs_hint = {'text': '?'} " icons require GUI
" " let g:lsp_signs_warning = {'text': '~', 'icon': '/path/to/some/icon'} " icons require GUI
" " let g:lsp_signs_hint = {'icon': '/path/to/some/other/icon'} " icons require GUI
" let g:lsp_log_verbose = 0
" let g:lsp_log_file = expand('~/.config/nvim/vim-lsp.log')
" let g:asyncomplete_log_file = expand('~/.config/nvim/asyncomplete.log')
" " set completeopt+=preview

" " ultisnips
" if has('python3')
"   let g:UltiSnipsExpandTrigger="<c-e>"
"   au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
"         \ 'name': 'ultisnips',
"         \ 'whitelist': ['*'],
"         \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
"         \ }))
" endif

" " buffers
" au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
"       \ 'name': 'buffer',
"       \ 'whitelist': ['*'],
"       \ 'blacklist': ['go'],
"       \ 'completor': function('asyncomplete#sources#buffer#completor'),
"       \ }))

" " files
" au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
"       \ 'name': 'file',
"       \ 'whitelist': ['*'],
"       \ 'blacklist': ['typescript', 'javascript', 'javascript.js'],
"       \ 'priority': 10,
"       \ 'completor': function('asyncomplete#sources#file#completor')
"       \ }))

" if executable('ctags')
"   au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
"       \ 'name': 'tags',
"       \ 'whitelist': ['typescript', 'javascript', 'javascript.jsx'],
"       \ 'completor': function('asyncomplete#sources#tags#completor'),
"       \ 'config': {
"       \    'max_file_size': 150000000,
"       \  },
"       \ }))
" endif

" " omnis/omnicompletes
" au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
"       \ 'name': 'omni',
"       \ 'whitelist': ['*'],
"       \ 'blacklist': ['c', 'cpp', 'html'],
"       \ 'completor': function('asyncomplete#sources#omni#completor')
"       \  }))

" " typescript
" " au User asynccomplete_setup call asyncomplete#register_source(asyncomplete#sources#tscompletejob#get_source_options({
" "       \ 'name': 'tscompletejob',
" "       \ 'whitelist': ['typescript'],
" "       \ 'completor': function('asyncomplete#sources#tscompletejob#completor'),
" "       \ }))

" if executable('typescript-language-server')
"   au User lsp_setup call lsp#register_server({
"         \ 'name': 'typescript-language-server',
"         \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"         \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
"         \ 'whitelist': ['typescript', 'javascript', 'javascript.jsx']
"         \ })
" endif

" " scss, css and friends
" if executable('css-languageserver')
"   au User lsp_setup call lsp#register_server({
"         \ 'name': 'css-languageserver',
"         \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
"         \ 'whitelist': ['css', 'less', 'sass', 'scss'],
"         \ })
" endif

" " reason, ocaml and friends
" if executable('ocaml-language-server')
"   au User lsp_setup call lsp#register_server({
"         \ 'name': 'ocaml-language-server',
"         \ 'cmd': {server_info->[&shell, &shellcmdflag, 'ocaml-language-server --stdio']},
"         \ 'whitelist': ['reason', 'ocaml'],
"         \ })
" endif

" " python
" if executable('pyls')
"   " pip install python-language-server
"   au User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['pyls']},
"         \ 'whitelist': ['python'],
"         \ })
" endif

" }}}
" ================ Custom Mappings ======================== {{{

" Down is really the next line
nnoremap j gj
nnoremap k gk

" " Expand snippets on tab if snippets exists, otherwise do autocompletion
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
" inoremap <expr> <cr> (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<cr>")
" inoremap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<c-u>":"\<cr>")

" optional
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>

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

" Handle syntastic error window
nnoremap <Leader>e :lopen<CR>
nnoremap <silent><Leader>q :call CloseBuffer()<CR>

" Find current file in NERDTree
nnoremap <Leader>hf :NERDTreeFind<CR>
" Open NERDTree
" nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <F2> :NERDTreeToggle<CR>

" Toggle between last 2 buffers
nnoremap <leader><tab> <c-^>

" Filesearch plugin map for searching in whole folder
nnoremap <Leader>f :call Search()<CR>
nnoremap <Leader>F :call Search(1)<CR>

" Toggle buffer list
" nnoremap <C-p> :Files<CR>
" nnoremap <Leader>b :Buffers<CR>
" nnoremap <Leader>t :BTags<CR>
" nnoremap <Leader>m :History<CR>

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

" Close all other buffers except current one
nnoremap <Leader>db :silent w <BAR> :silent %bd <BAR> e#<CR>

" ------------------------------------------------------------------

" folding toggle
nnoremap <leader><space> za

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
nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>g :TestVisit<CR>
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
" ================ Highlights and Colors ======================== {{{
hi htmlArg cterm=italic
hi xmlAttrib cterm=italic
hi Type cterm=italic
hi Normal ctermbg=none
hi Comment cterm=italic term=italic gui=italic
hi LineNr guibg=#3C4C55 guifg=#937f6e gui=NONE
hi CursorLineNr ctermbg=black ctermfg=223 cterm=NONE guibg=#333333 guifg=#db9c5e gui=bold
hi qfLineNr ctermbg=black ctermfg=95 cterm=NONE guibg=black guifg=#875f5f gui=NONE
hi Search gui=underline term=underline cterm=underline ctermfg=232 ctermbg=230 guibg=#afaf87 guifg=#333333
" }}}

" vim:foldenable:foldmethod=marker:ft=vim
