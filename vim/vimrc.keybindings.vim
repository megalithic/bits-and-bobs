" Misc keymapping notes:
" -----------------------------------------------------------------------------
"  <F1> maps to NERDTreeFind
"  <F2> maps to NERDTree
"  <F3> maps to Error list
"  <F4> maps to Quicklist
"  <F5> maps to ctags refresh/rebuild
"  <S-F5> maps to BundleInstall!
"  <F6> maps to setpaste toggle
"  <F7> maps to SynStack
"  <F8> maps to GundoToggle

" -----------------------------------------------------------------------------
" NerdTree ------
noremap  <F1> :NERDTreeFind<cr>
inoremap <F1> <esc>:NERDTreeFind<cr>
noremap  <F2> :NERDTreeTabsToggle<cr>
inoremap <F2> <esc>:NERDTreeTabsToggle<cr>

" error and quickfix window toggles
" nmap <silent> <f3> :ErrorsToggle<cr>
nmap <silent> <f3> :Errors<CR>
nmap <silent> <f4> :QFixToggle<cr>

" rebuild ctags
silent! nnoremap <silent> <S-F5> :call FlushEnvironment()<CR>

" give us BundleInstall!
nnoremap <F5> :BundleInstall!<cr>
noremap <F5> :BundleInstall!<cr>
map <F5> :BundleInstall!<cr>

" Toggle paste
" For some reason pastetoggle doesn't redraw the screen (thus the status bar
" doesn't change) while :set paste! does, so I use that instead.
" set pastetoggle=<F6>
" nnoremap <F6> :set paste!<cr>

" switch between relative and absolute line numbers
nnoremap <F6> :call NumberToggle()<cr>

" show the syntax highlighting stack for the cursored word
nnoremap <F7> :call SynStack()<CR>

" ... use Gundo (visual undo awesome)
nnoremap <F8> :GundoToggle<cr>

"remap ESC key
" disabling this cuz we rockin <capslock> as <esc>, y'all!
" inoremap jk <esc>

" navigation a lil better
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" remap q for recording to Q
nnoremap Q q
nnoremap q <Nop>

" saving and quiting more easily
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>

" Make opening files in a new tab easier
nmap <C-t> :tabnew<space>
nmap <C-e> :edit<space> <C-d>

" Window and tab movement
map <C-j> <Nop>
map <C-k> <Nop>
unmap <C-j>
unmap <C-k>
map <C-h> <Nop>
map <C-l> <Nop>
unmap <C-h>
unmap <C-l>
"reassign them
nnoremap <C-l> <C-W>w
nnoremap <C-h> <C-W>W

" this always does annoying things for some reason, so stop it
noremap K <nop>

" stop changing casing when in visual mode
vnoremap u <nop>

" map up/down arrow keys to unimpaired commands
" nmap <Up> [e
" nmap <Down> ]e
" vmap <Up> [egv
" vmap <Down> ]egv

" map left/right arrow keys to indendation
" nmap <Left> <<
" nmap <Right> >>
" vmap <Left> <gv
" vmap <Right> >gv

" -----------------------------------------------------------------------------
" CtrlP ------
let g:ctrlp_map = '<leader>m'
" let g:ctrlp_map = '<leader>,'
" nnoremap <leader>m :CtrlPMRU<cr>

" -----------------------------------------------------------------------------
" Switch ------
nnoremap <leader>s :Switch<CR>

" -----------------------------------------------------------------------------
" Unite ------
" NOTE: unite keybindings are in .vimrc under 'Plugin Settings'

" -----------------------------------------------------------------------------
" Golden Ratio ------
"create new vertical window split and focus it
" nnoremap <c-n> :vnew<cr>
nnoremap <c-o> :vnew<cr>:e<space><c-d>
nnoremap <c-n> :vsp .<CR>

" -----------------------------------------------------------------------------
" GoldenView ------
" let g:goldenview__enable_default_mapping = 0
" nmap <silent> <C-n>     <Plug>GoldenViewSplit
" nmap <silent> <C-space> <Plug>GoldenViewSwitchMain
" nmap <silent> <C-CR>    <Plug>GoldenViewSwitchToggle
" nmap <silent> <C-l>     <Plug>GoldenViewNext
" nmap <silent> <C-h>     <Plug>GoldenViewPrevious

" -----------------------------------------------------------------------------
" Thwins ------
"create new vertical window split and focus it
" nnoremap <c-n> :vert belowright sb N<cr>
" nnoremap <c-o> :vert belowright sb N<cr>
" nnoremap <c-o> :vnew<cr>:e<space><c-d>

" -----------------------------------------------------------------------------
" DWM ------
" open a new DWM window, with an edit prompt
" NOTE: This overrides a vim default for C-O (which is the go back to last
" change action), but is way nicer imo
" nnoremap <c-o> :silent! call DWM_New()<cr>:edit <c-d>
" override DWM close
" nmap <C-c> :silent! exec DWM_Close()<cr>
" override DWM focus; make the current window focused (into the big window split)
" nmap <leader>f :silent! call DWM_Focus()<cr>

"allow deleting selection without updating the clipboard (yank buffer)
vnoremap x "_x
vnoremap X "_X

"copy/paste mappings
noremap <leader>y "*y
noremap <leader>yy "*Y
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>"

"don't move the cursor after pasting
"(by jumping to back start of previously changed text)
noremap p p`[
noremap P P`[

" -----------------------------------------------------------------------------
" Commentary ------
nmap <leader>c <Plug>CommentaryLine
xmap <leader>c <Plug>Commentary

" -----------------------------------------------------------------------------
" Fugitive ------
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame w<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>
nnoremap <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>
nnoremap <leader>H :Gbrowse<cr>
vnoremap <leader>H :Gbrowse<cr>


" select all text on the page
noremap <leader>v ggVG

" Easier linewise reselection of what you just pasted.
nnoremap <leader>V V`]

" Indent/dedent/autoindent what you just pasted.
nnoremap <lt>> V`]<
nnoremap ><lt> V`]>
nnoremap =- V`]=

" Front and center
" Use :sus for the rare times I want to actually background Vim.
vnoremap <c-z> <esc>zv`<ztgv

" MY SURROUND stuff; couldn't get surround.vim to work 100%
" surround the current word with quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" surround the current word with ticks
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" surround the current word with ()
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
" surround the current word with {}
nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
" surround the current word with []
nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel

"make the tab key match bracket pairs
map <tab> %
noremap <tab> %
vnoremap <tab> %

" Sudo write (,W)
noremap <silent><leader>W :w !sudo tee %<CR>

" Better mark jumping (line + col)
nnoremap ' `

" Toggle show tabs and trailing spaces (,c)
set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
set fcs=fold:-
nnoremap <silent> <leader>i :set nolist!<CR>

" duplicate whatever’s selected directly below
vmap D y'>p

" Yank from cursor to end of line
nnoremap Y y$

vmap <silent><leader>y "xy
map <silent><leader>p "xp

" Reindent the whole document and keep the cursor in the same location
nnoremap <C-=> mqHmwgg=G`wzt`q

" Insert newline below
nnoremap <cr><cr> o<ESC>

" Search and replace word under cursor (,*)
" nnoremap <leader>fr :%s/\<<C-r><C-w>\>//<Left>
nnoremap <leader>fr :%s#\<<C-r>=expand("<cword>")<CR>\>#

" Toggle folds (<Space>)
" nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<

" -----------------------------------------------------------------------------
" Rainbow Parameters ------
" nnoremap <leader>P :RainbowParenthesesToggle<CR>

" -----------------------------------------------------------------------------
" Tern ------
" Rename a JavaScript variable with Tern. (r)
" nmap <leader>r :TernRename<CR>
" Jump to JavaScript definition with tern. (j)
" nmap <leader>j :TernDef<CR>


" -----------------------------------------------------------------------------
" Ag/Ack ------
nnoremap <leader>a :Ag!<space>
" nmap <leader>a :Ag! "<cword>\s*\("<space>
nnoremap <silent> <leader>? :execute "Ag! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
"NOTE: this functionality is now handled by Unite, defined in .vimrc

" Toggle 'keep current line in the center of the screen' mode
nnoremap <leader>C :let &scrolloff=999-&scrolloff<cr>

" gi already moves to 'last place you exited insert mode', so we'll map gI to
" something similar: move to last change
nnoremap gI `.

" Make D behave
nnoremap D d$

" Delete a line and not keep it in a register
nnoremap X Vx

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Keep search matches jumping around
nnoremap g; g;zz
nnoremap g, g,zz
 
" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_

" clear highlights with ESC and <leader><space>
nmap <silent> <ESC> :nohl<CR>
nnoremap <silent><Leader><space> :nohls<CR>

"Quick edit of certain files and such
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>ez :vsplit ~/.zshrc<cr>

" Insert Mode Completion 
inoremap <c-f> <c-x><c-f>
inoremap <c-]> <c-x><c-]>

" Redraw my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

" Select (charwise) the contents of the current line, excluding indentation.
" Great for pasting Python lines into REPLs.
nnoremap vv ^vg_

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Send visual selection to gist.github.com as a private, filetyped Gist
" Requires the gist command line too (brew install gist)
vnoremap <leader>gi :w !gist -p -t %:e \\| pbcopy<cr>

" Insert the directory of the current buffer in command line mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" display the syntax name under the cursor
map <F12> :echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "name")<cr>

" Mapping Space to fold/unfold
map <Space> za

" -----------------------------------------------------------------------------
" vimgrep searching and cope displaying
" -----------------------------------------------------------------------------
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Smart Tab Completion
inoremap <tab> <c-r>=Smart_TabComplete()<CR>
inoremap <s-tab> <c-n>

" Visual Mode set search (based on * and #)
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" Remap VIM 0 to first non-blank character
map 0 ^

" pull word under cursor into lhs of a substitute (for quick search and replace)
nmap <leader>r :%s/\<<C-r>=expand("<cword>")<CR>\>/

" -----------------------------------------------------------------------------
" Vroom ------
map <leader>t :VroomRunTestFile<cr>
map <leader>T :VroomRunNearestTest<cr>


" -----------------------------------------------------------------------------
" Vim-LESS ------
nnoremap <leader>l :w <BAR> !lessc % > %:t:r.css<CR><space>


" -----------------------------------------------------------------------------
" Coffee Script ------
" NOTE: not working?
" vmap <leader>s <esc>:'<,'>:CoffeeCompile<CR>
" map <leader>s :CoffeeCompile<CR>

" -----------------------------------------------------------------------------
" Tabularize ------
" nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
" nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>
" nmap <Leader>t, :Tabularize /,\zs<CR>
vmap <Leader>t, :Tabularize /,\zs<CR>
" nmap <Leader>t> :Tabularize /=>\zs<CR>
vmap <Leader>t> :Tabularize /=>\zs<CR>
" nmap <Leader>t- :Tabularize /-<CR>
vmap <Leader>t- :Tabularize /-<CR>
" nmap <Leader>t" :Tabularize /"<CR>
vmap <Leader>t" :Tabularize /"<CR>

" -----------------------------------------------------------------------------
" Surround ------
" Autoclose in visual mode
vmap [ S[
vmap ( S(
vmap { S{
vmap ] S]
vmap ) S)
vmap } S}
vmap ' S'
vmap " S"
