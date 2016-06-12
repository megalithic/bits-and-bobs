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

" -/ Plugins /--------------------------------------------------------
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
  Plug 'gavocanov/vim-js-indent'
  Plug 'othree/es.next.syntax.vim'
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
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'tpope/vim-ragtag', { 'for': ['html', 'xml', 'erb'] }
  Plug 'docunext/closetag.vim'
  Plug 'tpope/vim-endwise'
  Plug 'zenbro/mirror.vim'
  " Plug 'luochen1990/rainbow'

  " ----------------------------------------------------------------------------
  " ## Code Navigation
  Plug 'ap/vim-readdir'
  Plug 'christoomey/vim-tmux-navigator' " needed for tmux/hotkey integration with vim
  Plug 'christoomey/vim-tmux-runner' " needed for tmux/hotkey integration with vim
  Plug 'haya14busa/incsearch.vim'
  Plug 'unblevable/quick-scope' " highlights f/t type of motions
  Plug 'EinfachToll/DidYouMean'
  Plug 'ervandew/supertab'
  function! HandleRemotePluginUpdates(arg)
    UpdateRemotePlugins
  endfunction
  Plug 'shougo/deoplete.nvim', { 'do': function('HandleRemotePluginUpdates') }
  Plug 'Konfekt/FastFold' " deoplete wants this for some reason :/
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " Plug 'mileszs/ack.vim'
  " Plug 'ctrlpvim/ctrlp.vim'
  " Plug 'FelikZ/ctrlp-py-matcher'

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

source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/autocommands.vim
source $HOME/.config/nvim/ftsyntax.vim
source $HOME/.config/nvim/keys.vim
source $HOME/.config/nvim/highlights.vim
