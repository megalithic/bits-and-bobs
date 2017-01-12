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

  function! HandleRemotePluginUpdates(arg)
    UpdateRemotePlugins
  endfunction

  " ---------------------------------------------------------------------------
  " ## Interface
  " Plug 'chriskempson/base16-vim' " consistently, my favorite colorscheme package
  Plug 'mhartington/oceanic-next'
  Plug 'itchyny/lightline.vim'
  Plug 'shirataki/lightline-onedark'
  Plug 'felixjung/vim-base16-lightline'
  Plug 'megalithic/golden-ratio' " vertical split layout manager
  " Plug 't9md/vim-choosewin'

  " ---------------------------------------------------------------------------
  " ## JavaScript, et al
  Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
  " Plug 'chemzqm/vim-jsx-improve', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'gavocanov/vim-js-indent', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'jelera/vim-javascript-syntax', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'flowtype/vim-flow', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'kchmck/vim-coffee-script', { 'for': ['coffeescript', 'coffee'] }
  Plug 'elzr/vim-json', { 'for': ['json'] }
  Plug 'moll/vim-node', { 'for': ['javascript'] }

  " ----------------------------------------------------------------------------
  " ## SCSS, CSS, et al
  Plug 'othree/csscomplete.vim', { 'for': ['css', 'scss', 'sass'] } " css completion
  Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss', 'sass'] } " css3-specific syntax
  Plug 'cakebaker/scss-syntax.vim', { 'for': ['css', 'scss', 'sass'] } " scss/sass-specific syntax
  Plug 'stephenway/postcss.vim', { 'for': ['css', 'scss', 'sass'] } " postcss syntax
  Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass'] }

  " ----------------------------------------------------------------------------
  " ## HAML, HTML, XML, Markdown, YAML, et al
  Plug 'othree/html5.vim', { 'for': ['html', 'haml'] }
  Plug 'tpope/vim-markdown', { 'for': ['markdown', 'md', 'mdown'] }
  Plug 'jtratner/vim-flavored-markdown', { 'for': ['markdown'] }
  Plug 'davinche/godown-vim', { 'for': ['markdown', 'md', 'mdown'] }
  Plug 'martin-svk/vim-yaml', { 'for': ['yaml'] }
  Plug 'tpope/vim-haml', { 'for': ['haml', 'sass', 'scss'] }
  " Plug 'othree/xml.vim', { 'for': ['xml'] }
  Plug 'tyru/markdown-codehl-onthefly.vim', { 'for': ['markdown', 'md', 'mdown'] }

  " ----------------------------------------------------------------------------
  " ## Ruby, Rails, et al
  Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }
  Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
  Plug 'shougo/vimproc.vim', { 'do': 'make' } | Plug 'osyo-manga/vim-monster', { 'for': ['ruby'], 'do': 'gem install rcodetools' }
  Plug 'tpope/vim-bundler', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
  Plug 'fishbullet/deoplete-ruby', { 'for': ['ruby'] }
  Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' } " rspec commands and highlight

  " ----------------------------------------------------------------------------
  " ## Python
  Plug 'hynek/vim-python-pep8-indent', { 'for': ['python'] }
  Plug 'davidhalter/jedi-vim', { 'for': ['python'] }
  Plug 'zchee/deoplete-jedi', { 'for': ['python'] }

  " ----------------------------------------------------------------------------
  " ## Misc, Other, et al
  Plug 'elixir-lang/vim-elixir', { 'for': ['elixir', 'eelixir'] }
  Plug 'tpope/vim-git'
  Plug 'tpope/vim-fugitive' " git tools integrated into vim
  Plug 'jreybert/vimagit' " more git tools integrated into vim
  Plug 'christoomey/vim-conflicted'
  Plug 'keith/gist.vim'
  Plug 'ElmCast/elm-vim' " all the elms
  Plug 'xolox/vim-misc' | Plug 'xolox/vim-lua-ftplugin', { 'for': ['lua'] } " all the luas
  Plug 'tmux-plugins/vim-tmux', { 'for': ['tmux'] }
  Plug 'honza/dockerfile.vim', { 'for': ['dockerfile', 'docker'] }

  " ----------------------------------------------------------------------------
  " ## Utilities
  " Plug 'kassio/neoterm'
  Plug 'janko-m/vim-test' " tester for mocha and ruby
  Plug 'neomake/neomake', { 'on': ['Neomake'] } " async linting
  " Plug 'w0rp/ale' " async linting
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
  Plug 'itmammoth/doorboy.vim' " auto-closes quotes, parenthesis, brackets, etc.
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
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'unblevable/quick-scope' " highlights f/t type of motions
  Plug 'EinfachToll/DidYouMean'
  Plug 'itchyny/vim-cursorword'
  Plug 'haya14busa/incsearch.vim' | Plug 'haya14busa/incsearch-fuzzy.vim' " improved incremental searching
  Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' } " :substitute preview
  Plug 'Konfekt/FastFold'
  Plug 'Shougo/echodoc.vim'
  Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm i -g tern' }
  Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm i -g' }
  Plug 'ujihisa/neco-look', { 'for': ['html', 'text', 'markdown'] }
  Plug 'junegunn/fzf'
        \, { 'dir': '~/.fzf', 'do': './install --all' }
        \| Plug 'junegunn/fzf.vim'
        \, { 'on': [
        \ 'History',
        \ 'Files',
        \ 'Ag',
        \ 'Lines',
        \ 'History',
        \ 'Commands',
        \ 'Tags',
        \ 'Helptags',
        \ 'GFiles',
        \ 'GGrep'] }
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  Plug 'epilande/vim-es2015-snippets'
  Plug 'epilande/vim-react-snippets'
  " Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets' | Plug 'honza/vim-snippets'
  Plug 'airblade/vim-rooter' " change vim root to vcs root when editing a file
  Plug 'eugen0329/vim-esearch' " project wide search and replace

  " ----------------------------------------------------------------------------
  " ## Text Objects, et al
  Plug 'kana/vim-operator-user'
  " -- provide ai and ii for indent blocks
  " -- provide al and il for current line
  " -- provide a_ and i_ for underscores
  " -- provide a- and i-
  Plug 'kana/vim-textobj-user'
        \| Plug 'kana/vim-textobj-indent' " Indent text object (vii)
        \| Plug 'kana/vim-textobj-line' " Line text object (vil)
        \| Plug 'kana/vim-textobj-entire' " Entire buffer text object (vae)
        \| Plug 'nelstrom/vim-textobj-rubyblock' " Ruby block text object (vir)
        \| Plug 'kana/vim-textobj-function' " Function text object (vaf)
        \| Plug 'glts/vim-textobj-comment' " Comment text object (vac)
  Plug 'michaeljsmith/vim-indent-object'

  Plug 'wellle/targets.vim' " Improved targets line cin) next parens
  " ^--- https://github.com/wellle/targets.vim/blob/master/cheatsheet.md

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
