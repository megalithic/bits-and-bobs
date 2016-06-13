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
  Plug 'snooc/base16-vim' " consistently, my favorite colorscheme package
  Plug 'megalithic/golden-ratio' " vertical split layout manager
  Plug 'vim-airline/vim-airline' " statusbar
  Plug 'vim-airline/vim-airline-themes' " themes for the statusbar

  " ---------------------------------------------------------------------------
  " ## One glot to rule them all..
  Plug 'sheerun/vim-polyglot'

  " ---------------------------------------------------------------------------
  " ## JavaScript, et al
  Plug 'othree/es.next.syntax.vim', { 'for': ['js', 'jsx', 'javascript', 'javascript.jsx'] }
  Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['js', 'jsx', 'javascript', 'javascript.jsx'] }
  Plug 'othree/jspc.vim', { 'for': ['js', 'jsx', 'javascript', 'javascript.jsx'] }
  Plug 'heavenshell/vim-jsdoc', { 'for': ['js', 'jsx', 'javascript', 'javascript.jsx'] }
  Plug 'jelera/vim-javascript-syntax', { 'for': ['js', 'jsx', 'javascript', 'javascript.jsx'] }
  " Plug 'othree/yajs.vim', { 'for': ['js', 'jsx', 'javascript', 'javascript.jsx'] }
  " Plug 'pangloss/vim-javascript', { 'for': ['js', 'jsx', 'javascript', 'javascript.jsx'] }
  " Plug 'gavocanov/vim-js-indent', { 'for': ['js', 'jsx', 'javascript', 'javascript.jsx'] }
  " Plug 'mxw/vim-jsx', { 'for': ['js', 'jsx', 'javascript', 'javascript.jsx'] }
  " Plug 'sheerun/vim-json', { 'for': ['json'] }
  " Plug 'kchmck/vim-coffee-script', { 'for': ['json'] }

  " ----------------------------------------------------------------------------
  " ## SCSS, CSS, et al
  Plug 'othree/csscomplete.vim', { 'for': ['css', 'scss', 'sass'] } " css completion
  Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss', 'sass'] } " css3-specific syntax
  Plug 'cakebaker/scss-syntax.vim', { 'for': ['css', 'scss', 'sass'] } " scss/sass-specific syntax
  Plug 'stephenway/postcss.vim', { 'for': ['css', 'scss', 'sass'] } " postcss syntax

  " ----------------------------------------------------------------------------
  " ## HAML, HTML, XML, Markdown, YAML, et al
  " Plug 'othree/html5.vim', { 'for': ['html', 'haml', 'js', 'javascript.jsx'] }
  " Plug 'tpope/vim-markdown', { 'for': ['markdown', 'md', 'mdown'] }
  " Plug 'ingydotnet/yaml-vim', { 'for': ['yaml'] }
  " Plug 'tpope/vim-haml', { 'for': ['haml', 'sass', 'scss'] }
  Plug 'othree/xml.vim', { 'for': ['xml'] }
  Plug 'vim-pandoc/vim-pandoc-syntax'

  " ----------------------------------------------------------------------------
  " ## Ruby, Rails, et al
  " Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }
  Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
  Plug 'tpope/vim-bundler', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }

  " ----------------------------------------------------------------------------
  " ## Misc, Other, et al
  " Plug 'tpope/vim-git'
  Plug 'tpope/vim-fugitive' " git tools integrated into vim
  Plug 'jreybert/vimagit' " more git tools integrated into vim
  Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim' " easily post to gist.github.com
  Plug 'ElmCast/elm-vim', { 'for': ['elm'] } " all the elms
  Plug 'xolox/vim-misc' | Plug 'xolox/vim-lua-ftplugin', { 'for': ['lua'] } " all the luas
  " Plug 'tejr/vim-tmux', { 'for': ['tmux'] }
  " Plug 'honza/dockerfile.vim', { 'for': ['dockerfile', 'docker'] }

  " ----------------------------------------------------------------------------
  " ## Utilities
  Plug 'janko-m/vim-test' " tester for mocha and ruby
  Plug 'benekastah/neomake', { 'on': ['Neomake'] } " async linting
  Plug 'tpope/vim-commentary' " (un)comment code
  Plug 'sickill/vim-pasta' " context-aware pasting
  Plug 'Chiel92/vim-autoformat' " uses external formatters to 'auto-format' code
  Plug 'einars/js-beautify', { 'on': ['Autoformat'], 'do': 'npm i -g js-beautify' }
  Plug 'jordwalke/VimAutoMakeDirectory' " auto-makes the dir for you if it doesn't exist in the path
  Plug 'tpope/vim-surround' " surrounds things with things
  " - {Visual}S<arg> surrounds selection
  " - cs/ds<arg1><arg2> change / delete
  " - ys<obj><arg> surrounds text object
  " - yss<arg> for entire line
  Plug 'tpope/vim-repeat' " repeats plugin-execution mappings as well, with `.`
  Plug 'Valloric/MatchTagAlways', { 'for': ['html', 'xml', 'erb'] } " highlights the opening/closing tags for the block you're in
  Plug 'cohama/lexima.vim' " auto-closes many delimiters and can repeat with a `.`
  Plug 'junegunn/rainbow_parentheses.vim' " nicely colors nested pairs of [], (), {}
  Plug 'tpope/vim-ragtag', { 'for': ['html', 'xml', 'erb'] } " a set of mappings for several langs: html, xml, erb, php, more
  Plug 'docunext/closetag.vim' " will auto-close the opening tag as soon as you type </
  Plug 'tpope/vim-endwise'
  Plug 'zenbro/mirror.vim' " allows mirror'ed editing of files locally, to a specified ssh location via ~/.mirrors

  " ----------------------------------------------------------------------------
  " ## Code Navigation
  Plug 'ap/vim-readdir' " simple directory browser
  Plug 'christoomey/vim-tmux-navigator' " needed for tmux/hotkey integration with vim
  Plug 'christoomey/vim-tmux-runner' " needed for tmux/hotkey integration with vim
  Plug 'haya14busa/incsearch.vim' " improved incremental searching
  Plug 'unblevable/quick-scope' " highlights f/t type of motions
  Plug 'EinfachToll/DidYouMean'
  Plug 'ervandew/supertab'
  function! HandleRemotePluginUpdates(arg)
    UpdateRemotePlugins
  endfunction
  Plug 'shougo/deoplete.nvim', { 'do': function('HandleRemotePluginUpdates') }
  Plug 'carlitux/deoplete-ternjs', { 'for': ['js', 'jsx', 'javascript', 'javascript.jsx'], 'do': 'npm i -g tern' }
  Plug 'ternjs/tern_for_vim', { 'for': ['js', 'jsx', 'javascript', 'javascript.jsx'], 'do': 'npm i' }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
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
