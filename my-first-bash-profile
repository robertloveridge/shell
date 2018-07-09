# Rob's bash profile

PAGER=less;	export PAGER
EDITOR=nano;	export EDITOR

export LSCOLORS="exCxacaeCxahagaFaGExEx";

alias ssh='ssh -A'
alias ll='ls -lhG'
alias la='ls -lhGA'
alias restart_wifi='sudo ifconfig en0 down && sudo ifconfig en0 up'
alias root='sudo bash --rcfile ~/.bash_profile'

showtime() {
     NEW_YORK=$(TZ=":America/New_York" date);
     DALLAS=$(TZ=":America/Chicago" date);
     LONDON=$(date);
     SYDNEY=$(TZ=":Australia/Sydney" date);
     echo "London:" $LONDON;
     echo "Dallas:" $DALLAS;
     echo "New York:" $NEW_YORK;
     echo "Sydney:" $SYDNEY;
}

last_git_tag() {
     git tag -l | perl -ne '/v(.*)/ && print "$1\n"' | sort | tail -n1
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

C1=''
C2=''
C3=''
C4=''
C5=''

if [ `id -u` -gt 0 ]; then
    PR='$'
else
    C1=''
    C2=''
    PR='#'
fi

PS1='\[${C3}\]-\[${C2}\](\[${C1}\]$(date +%H)\[${C3}\]:\[${C1}\]$(date +%M)\[${C2}\])\[${C3}\]-\[${C2}\](\[${C1}\]\u\[${C1}\]\[${C3}\]:\[${C1}\]\h\[${C2}\])\[${C3}\]-\[${C2}\](\[${C1}\]\w\[${C2}\])\[${C3}\]-
\[${C3}\]-\[${C2}\](\[${C1}\]\u\[${C3}\]-\[${C1}\]${PR} \[${C5}\]$(parse_git_branch)\[${C5}\] \[${C2}\])\[${C3}\]->\[${C4}\] '

it2prof() {
	echo -e "\033]50;SetProfile=$1\a"
}
