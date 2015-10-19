autoload colors; colors

# The variables are wrapped in %{%}. This should be the case for every
# variable that does not contain space.
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
  eval PR_$COLOR='%{$fg_no_bold[${(L)COLOR}]%}'
  eval PR_BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done

eval RESET='$reset_color'
export PR_RED PR_GREEN PR_YELLOW PR_BLUE PR_WHITE PR_BLACK
export PR_BOLD_RED PR_BOLD_GREEN PR_BOLD_YELLOW PR_BOLD_BLUE
export PR_BOLD_WHITE PR_BOLD_BLACK

# Clear LSCOLORS
unset LSCOLORS

# Main change, you can see directories on a dark background
# export LSCOLORS=gxfxcxdxbxegedabagacad

export CLICOLOR=1
# export LS_COLORS="exfxcxdxbxegedabagacad"

if ls --color -d . > /dev/null 2>&1; then
    # alias ls='ls --color=auto'
    # export LS_COLORS="di=34:ln=36:so=35;40:pi=1;35;40:ex=33:bd=32;40:cd=33;40:su=31:sg=1;31:tw=1;35:ow=35:or=31;40:"
    # consider using this instead? https://github.com/trapd00r/LS_COLORS
    LS_COLORS='di=96:fi=0:ln=33:pi=5:so=5:bd=5:cd=5:or=37:mi=0:ex=91:*.rpm=90:*.deb=92:*.run=1;92:*.png=34:*.jpg=94:*.JPG=94:*.JPEG=94:*.xcf=34:*.tiff=1;34:*.TIFF=1;34:*.gif=1;94:*.aux=90:*.bib=34:*.log=1;90:*.pdf=1;93:*.tex=33:*.zip=31:*.tar.gz=91:*.tar.bz2=91:*.exe=1;94;100:*.doc=1;94;100:*.xlsx=1;94;100:*.xls=1;94;100:*.pptx=1;94;100:*.nb=31:*.math=91:*.m=31:*.py=93:*.sh=92:*.rb=95:*.pl=1;94:*.c=31:*.h=91:*.md=1;33:*README=1;33:*LICENSE=33:*.txt=93:*.ipynb=1;33:*.mp3=31:*.mp4=91:*.mov=1;91:*.html=95:*.js=35:*.css=1;95:*rc=32:*config=1;32:*makefile=1;91'
elif ls -G -d . > /dev/null 2>&1; then
    # alias ls='ls -G'
    export CLICOLOR=1
    export LSCOLORS=exgxfaFadxcadabxBxFxfx
    export LSCOLORS=Gxfxcxdxbxegedabagacad
fi
