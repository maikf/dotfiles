export HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=4000


EDITOR="vim"
PATH="$HOME/bin:$PATH"
# add scripts from CPAN modules
PATH+=":$(perl -e '$,=":"; print grep { s,[^/]+$,bin,; -d } @INC')"
PAGER="less"
LESS="-i"

LC_CTYPE=en_US.UTF-8
