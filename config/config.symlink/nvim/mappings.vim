" -/ Keybindings /------------------------------------------------
let mapleader=","
let maplocalleader="\\"

nnoremap <c-s> :source $MYVIMRC<cr>

" Toggle fold at current position.
" (Using s-tab to avoid collision between <tab> and <C-i>).
nnoremap <s-tab> za

" ----------------------------------------------------------------------------
" ## codi.vim
nnoremap <leader>Rj :Codi!! javascript<cr>
nnoremap <leader>Rr :Codi!! ruby<cr>
nnoremap <leader>Rp :Codi!! python<cr>
nnoremap <leader>Rl :Codi!! lua<cr>

" ----------------------------------------------------------------------------
" ## Autoformat
nnoremap <F3> :Neoformat<CR>

" ----------------------------------------------------------------------------
" ## Tabbing for completions:

if has('nvim')
  " deoplete ---
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

  " deoplete + ultisnips
  " ---
  " inoremap <expr> <silent> <tab>   pumvisible() ? "\<c-n>" : "\<tab>"
  " " inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : neocomplete#undo_completion()
  " inoremap <expr> <silent> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
  " inoremap <expr> <silent> <bs>    deoplete#smart_close_popup() . "\<bs>"
  " inoremap <silent> <cr>  <c-r>=<SID>smart_cr()<cr>
  " let g:ulti_expand_or_jump_res = 0
  " function! s:smart_cr()
  "   silent! call UltiSnips#ExpandSnippet()
  "   echo "trying to expand a snippet"
  "   return g:ulti_expand_res ? "" :
  "         \ (pumvisible() ? "\<c-j>" : "\<cr>")
  " endfunction

  " deoplete + neosnippets
  " ---
  " Ref: https://github.com/mhartington/dotfiles/blob/master/config/nvim/init.vim#L512
  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump)
  xmap <C-k> <Plug>(neosnippet_expand_target)

  " https://www.reddit.com/r/neovim/comments/4st4i6/making_ultisnips_and_deoplete_work_together_nicely/d6m73rh/
  imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
  inoremap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>"

  " nvim-completion-manager ---
  " ---
  " inoremap <expr> <silent> <Tab> pumvisible() ? "\<C-n>" : "\<TAB>"
  " inoremap <expr> <silent> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

  " " completor.vim ---
  " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  " inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
endif


" ----------------------------------------------------------------------------
" ## FZF
" nnoremap <silent> <leader>m :FZF -m<CR>
" nnoremap <silent> <leader>a :Ag<CR>
" nnoremap <silent> <leader>m <esc>:exe 'FZF ' . <SID>fzf_root()<CR>
nnoremap <silent> <leader>m <esc>:FZF<cr>
" nnoremap <silent> <leader>a <esc>:exe 'Ag ' . input('Ag/')<CR>
nnoremap <leader>a <esc>:Ag<space>
nnoremap <silent> <leader>A  <esc>:exe('Ag '.expand('<cword>'))<cr>
" nnoremap          <leader>gg <esc>:GGrep<space>
" nnoremap <silent> <leader>GG <esc>:exe('GGrep '.expand('<cword>'))<cr>

" " Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')

function! s:fzf_root()
  let path = finddir(".git", expand("%:p:h").";")
  return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
endfunction

function! s:git_grep_handler(line)
  let parts = split(a:line, ':')
  let [f, l] = parts[0 : 1]
  exe 'e +' . l . ' `git rev-parse --show-toplevel`/'
        \. substitute(f, ' ', '\\ ', 'g')
endfunction

command! -nargs=+ GGrep call fzf#run({
      \ 'source':
      \ '(cd "$(git rev-parse --show-toplevel)" && git grep --color=always -niI --untracked "<args>")',
      \ 'sink': function('<sid>git_grep_handler'),
      \ 'options': '--ansi --multi',
      \ })

" ----------------------------------------------------------------------------
" ## Commenting
nmap <leader>c :Commentary<cr>
vmap <leader>c :Commentary<cr>

" ----------------------------------------------------------------------------
" ## vim-plug
noremap <F5> :PlugUpdate<cr>
map <F5> :PlugUpdate<cr>
noremap <S-F5> :PlugClean!<cr>
map <S-F5> :PlugClean!<cr>

" ----------------------------------------------------------------------------
" ## QuickScope
nnoremap <expr> <silent> f Quick_scope_selective('f')
nnoremap <expr> <silent> F Quick_scope_selective('F')
nnoremap <expr> <silent> t Quick_scope_selective('t')
nnoremap <expr> <silent> T Quick_scope_selective('T')
vnoremap <expr> <silent> f Quick_scope_selective('f')
vnoremap <expr> <silent> F Quick_scope_selective('F')
vnoremap <expr> <silent> t Quick_scope_selective('t')
vnoremap <expr> <silent> T Quick_scope_selective('T')

" ----------------------------------------------------------------------------
" ## Fugitive
nnoremap <leader>H :Gbrowse<cr>
vnoremap <leader>H :Gbrowse<cr>
nnoremap <leader>gb :Gblame<cr>

" ----------------------------------------------------------------------------
" ## Testing vim-test
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>T :TestNearest<CR>
" nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" ref: https://github.com/Dkendal/dot-files/blob/master/nvim/.config/nvim/init.vim
" nmap <silent> <leader>1 :TestNearest<CR>
" nmap <silent> <leader>! :TestFile<CR>
" nmap <silent> <leader>@ :TestSuite<CR>
" nmap <silent> <leader>2 :TestLast<CR>
" nmap <silent> <leader>3 :TestSuite --next-failure<CR>
" nmap <silent> <leader># :TestVisit<CR>

" ----------------------------------------------------------------------------
" ## Gist/Github
" Send visual selection to gist.github.com as a private, filetyped Gist
" Requires the gist command line too (brew install gist)
vnoremap <leader>G :Gist -po<cr>

" ----------------------------------------------------------------------------
" ## Surround
vmap [ S]
vmap ( S)
vmap { S}
vmap ' S'
vmap " S"

" ----------------------------------------------------------------------------
" ## incsearch

" function! s:config_fuzzyall(...) abort
"   return extend(copy({
"   \   'converters': [
"   \     incsearch#config#fuzzy#converter(),
"   \     incsearch#config#fuzzyspell#converter()
"   \   ],
"   \ }), get(a:, 1, {}))
" endfunction

" noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall()<Plug>Pulse)
" noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'})<Plug>Pulse)
" noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1})<Plug>Pulse)

" ----------------------------------------------------------------------------
" ## incsearch and vim search pulse
" https://github.com/inside/vim-search-pulse#integration-with-the-incsearchvim-plugin
"
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Next or previous match is followed by a Pulse
map n <Plug>(incsearch-nohl-n)<Plug>Pulse
map N <Plug>(incsearch-nohl-N)<Plug>Pulse
map * <Plug>(incsearch-nohl-*)<Plug>Pulse
map # <Plug>(incsearch-nohl-#)<Plug>Pulse
map g* <Plug>(incsearch-nohl-g*)<Plug>Pulse
map g# <Plug>(incsearch-nohl-g#)<Plug>Pulse

" Pulses the first match after hitting the enter keyan
autocmd! User IncSearchExecute
autocmd User IncSearchExecute :call search_pulse#Pulse()

" ----------------------------------------------------------------------------
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

" ----------------------------------------------------------------------------
" ## Code Formatting
map <leader>pj :%!python -m json.tool<CR>
map <leader>px :%!xmllint % --format<CR>

" ----------------------------------------------------------------------------
" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<cr>

" ----------------------------------------------------------------------------
" ## Quick edit of certain files
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>ez :vsplit ~/.zshrc<cr>
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>

" ## Motions
noremap j gj
noremap k gk
noremap gj j
noremap gk k

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

nnoremap <F8> RunCurrentFile()
