" -/ Keybindings /------------------------------------------------
let mapleader=","
let maplocalleader="\\"

nnoremap <c-s> :source $MYVIMRC<cr>

" ## Deoplete
" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<tab>"

" ## CtrlP
" let g:ctrlp_map = '<leader>m'
" let g:ctrlp_cmd = 'CtrlP'

" ## FZF
" nnoremap <silent> <leader>m :FZF -m<CR>
" nnoremap <silent> <leader>a :Ag<CR>
nnoremap <silent> <leader>m :exe 'Files ' . <SID>fzf_root()<CR>
nnoremap <silent> <leader>a :execute 'Ag ' . input('Ag/')<CR>

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

" ## Commenting
nmap <leader>c :Commentary<cr>
vmap <leader>c :Commentary<cr>

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

" ## Gist/Github
" Send visual selection to gist.github.com as a private, filetyped Gist
" Requires the gist command line too (brew install gist)
vnoremap <leader>G :Gist -p<cr>

" ## Surround
vmap [ S]
vmap ( S)
vmap { S}
vmap ' S'
vmap " S"

" ## Code Formatting
map <leader>pj :%!python -m json.tool<CR>
map <leader>px :%!xmllint % --format<CR>

" ## Quick edit of certain files
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>ez :vsplit ~/.zshrc<cr>
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>

" ## Motions
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" ## Splits with vim-tmux-navigator
" let g:tmux_navigator_no_mappings = 1
" let g:tmux_navigator_save_on_switch = 1
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <C-o> :vnew<cr>:e<space><c-d>

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

" ## Search / Substitutions / Replacements / incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

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
" semicolon is easier to hit than colon
" nnoremap ; : " this rebinding breaks quick-scope repeated movement
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
map <TAB> %
silent! unmap [%
silent! unmap ]%
noremap <tab> %
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

" ## Code-Folding
" - `za` toggles current fold open/close
" - `zc` closes current fold; or parent, if current is already closed
" - `zj` navigates down to top of next fold
" - `zk` navigates up to bottom of previous fold
" Refs
" - http://vimcasts.org/episodes/how-to-fold/
" - https://www.linux.com/learn/vim-tips-folding-fun
" - sjl's fold setup: https://bitbucket.org/sjl/dotfiles/src/9bead8a9b4350c57f8a24a8119607a83a9592afe/vim/vimrc?at=default&fileviewer=file-view-default
" nnoremap <Space> za

