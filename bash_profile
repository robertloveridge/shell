# Rob Loveridge

# My Preferred Pager and Editor
PAGER=less;	export PAGER
EDITOR=nano;	export EDITOR

# Preferred file listing
alias ll="ls -larth"
alias la='ls -lhGA'

# Terminal Inputs
PS1="\[\e[33m\]\A\[\e[m\] \[\e[36m\][\[\e[m\]\w\[\e[36m\]]\[\e[m\]: "

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
