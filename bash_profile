# Rob's bash profile

PAGER=less;	export PAGER
EDITOR=nano;	export EDITOR

# linux-esque ls-colours
export LSCOLORS="exCxacaeCxahagaFaGExEx";

# Preferred file commands
alias ll="ls -larth"
alias la='ls -lhGA'
alias cp='cp -iv'

# Because sometimes, the wifi needs turning off and on again
alias restart_wifi='sudo ifconfig en0 down && sudo ifconfig en0 up'

# When I'm root, use some nice colours too
alias root='sudo bash --rcfile ~/.bash_profile'

# Find those damn annoying files and get rid of them!
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

# Always list directory contents upon 'cd'
cd() { builtin cd "$@"; ll; }

# Full Recursive Directory Listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

# Extract most know archives with one command
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

last_git_tag() {
     git tag -l | perl -ne '/v(.*)/ && print "$1\n"' | sort | tail -n1
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

C1='[1;33m'
C2='[1;31m'
C3='[1;30m'
C4='[0m'
C5='[1;35m'

if [ `id -u` -gt 0 ]; then
    PR='$'
else
    C1='[1;32m'
    C2='[0;32m'
    PR='#'
fi

PS1='\[${C3}\]-\[${C2}\](\[${C1}\]$(date +%H)\[${C3}\]:\[${C1}\]$(date +%M)\[${C2}\])\[${C3}\]-\[${C2}\](\[${C1}\]\u\[${C1}\]\[${C3}\]:\[${C1}\]\h\[${C2}\])\[${C3}\]-\[${C2}\](\[${C1}\]\w\[${C2}\])\[${C3}\]-
\[${C3}\]-\[${C2}\](\[${C1}\]\u\[${C3}\]-\[${C1}\]${PR} \[${C5}\]$(parse_git_branch)\[${C5}\] \[${C2}\])\[${C3}\]->\[${C4}\] '

it2prof() {
	echo -e "\033]50;SetProfile=$1\a"
}
