#: load completion module
autoload -Uz compinit
compinit

setopt no_beep
setterm -blength 0 # disable linux vt bell

setopt short_loops

setopt inc_append_history hist_ignore_dups hist_ignore_space
setopt auto_pushd pushd_ignore_dups pushd_silent pushd_minus
setopt noclobber
setopt no_auto_param_slash
setopt complete_in_word
# don't send HUP to jobs if shell exits
setopt no_hup

# do NOT poll my mails
unsetopt mail_warning
unset MAILCHECK

# ignore *.o while completing filenames for vim
zstyle ':completion:*:vim:*' ignored-patterns '(*/)#*.o'

bindkey ^R history-incremental-search-backward
bindkey ^A vi-insert-bol
bindkey ^E vi-insert-eol

alias l="ls -F --time-style='+%F %T'"
alias ll="l -lh"
alias la="ll -a"
alias lt="ll -tr"

alias v="vim -p"
alias V="sudo vim -p"

alias rmr="rm -rf"

alias aoei="setxkbmap us -variant nodeadkeys"
alias asdf="xmodmap ~/.Xmodmap"

alias n=screen -X screen /bin/sh -c "cd $PWD; exec $SHELL"
alias sc=screen

alias bc="bc -ql"
alias rsync="rsync --progress -vv"
alias m-s="my-module-starter"

alias -g T="| tail"
alias -g G="| grep"
alias -g L="| less"
alias -g X="| xxd"
alias -g H="| head"

alias ag="sudo apt-get"
alias agi="ag install"
alias ac="apt-cache"
alias acs="ac search"


green_black () { print -rn "%K{green}%F{black}$1%f%k" }
export PROMPT="$(green_black %m%#) "
export RPROMPT=""

# Have a bell-character put out, everytime a command finishes.
# This will set the urgent-hint, if the terminal is configured accordingly
zle-line-init () { print -n -- "\a" }
zle -N zle-line-init

dotfiles=$(dirname $(readlink ~/.zshrc))
# If the configfiles are in a git repository, update if it’s older than one hour
find $dotfiles -maxdepth 1 -name .git -mmin +60 -execdir ./update.sh \; &!

# vim: set ts=4 sts=4 expandtab:
