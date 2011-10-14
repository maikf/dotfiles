zstyle :compinstall filename '/home/maikf/.zshrc'

autoload -Uz compinit
compinit

setopt inc_append_history hist_ignore_dups hist_ignore_space
setopt auto_pushd pushd_ignore_dups pushd_silent pushd_minus
setopt noclobber no_auto_param_slash
setopt complete_inword
# setopt cdable_vars
unsetopt mail_warning
unset MAILCHECK

zstyle ':completion:*:vim:*' ignored-patterns '(*/)#*.o'

bg_green=$'%{\e[30;42m%}'
color_reset=$'%{\e[0m%}'
PROMPT="${bg_green}%m%#${color_reset} "

. ~/.zshfunc
set_termtitle "%m: %~"
reattach_screen

# General
alias l="ls -F"
alias la="l -a"
alias ll="ls -Fl"
alias lla="ll -a"
alias lt="ls -Ft"
alias v="vim -p"
alias rmr="rm -rf"
alias aoei="setxkbmap us -variant nodeadkeys"
alias asdf="xmodmap ~/.Xmodmap"
alias n=screen -X screen /bin/sh -c "cd $PWD; exec $SHELL"
alias sc=screen
alias rsync="rsync --progress -vv"
alias m-s="my-module-starter"

alias -g T="| tail"
alias -g G="| grep"
alias -g L="| less"
alias -g X="| xxd"
alias -g H="| head"

# Laptop
alias lcd-off="xrandr --output LVDS --off"

# Linux
alias psc="ps -FC"
#alias cmus="cd ~/media/music && cmus"

# Debian
alias acs="apt-cache search"
alias ac="apt-cache"
alias -g agi="apt-get install"
alias -g ag="apt-get"

printf "\33]701;$LC_CTYPE\007"
