#!/usr/bin/env zsh

# load completion module
autoload -Uz compinit
compinit

# bracketed paste and automatical quoting of URIs
if [[ $TERM == dumb ]]; then
    unset zle_bracketed_paste
else
    autoload -Uz url-quote-magic bracketed-paste-magic
    zle -N self-insert url-quote-magic
    zle -N bracketed-paste bracketed-paste-magic
fi

setopt no_beep
# disable linux vt bell
[[ "$TERM" = "linux" ]] && setterm -blength 0

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

# Show all processes when completing kill/killall and enable menu mode
zstyle ':completion:*:processes' command 'ps f -N --ppid=$(pidof kthreadd) --pid=$(pidof kthreadd)'
zstyle ':completion:*:processes-names' command 'ps -aeo comm='
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:killall:*' menu yes select

export HISTFILE=~/.histfile
export HISTSIZE=4000
export SAVEHIST=10000000

export LC_MESSAGES=C
export LC_TIME="de_DE.UTF-8"
export LC_MEASUREMENT="de_DE.UTF-8"
export LC_PAPER="de_DE.UTF-8"

export EDITOR="vim"
export VISUAL="$EDITOR"
export PAGER="less"

# search ignores case, if in all lowercase; long prompt;
# print unescaped control chars (for git log)
export LESS="iMR"

. ~/.zsh.aliases

bindkey ^R history-incremental-search-backward

bindkey -M viins "^[[A" up-line-or-history
bindkey -M viins "^[[B" down-line-or-history

function add_path () {
    export PATH="$1:$PATH"
}

# add Perl local::lib
if [[ -e ~/perl5/lib/perl5/ ]]; then
    eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
    # some CPAN modules don't install their utilities into $PATH
    local __cpanbin=$(perl -e 'print join ":", grep { /perl/ && s![^/]+$!bin! && -d } @INC')
    [[ -n "$__cpanbin" ]] && add_path "$__cpanbin"
fi

if [[ -e ~/src/android/sdk/ ]]; then
    add_path "$HOME/src/android/sdk/platform-tools"
    add_path "$HOME/src/android/sdk/tools"
fi

add_path "$HOME/.local/bin"

function colour() {
    print -rn -- "%F{$1}%K{$2}$3%f%k"
}

# build my prompt in a new scope
function () {
    local dir=$'%~'
    local basic=$(colour black green "%m%#")
    if [[ -n "$SSH_CONNECTION" ]]; then
        basic=$(colour black blue "%m%#")
    fi
    local error=$(colour black red $'%(?,,[%?])')
    local nl=$'\n'

    export PROMPT="${error}${basic} "
}

# print a bell-character everytime a command finishes.
# This is used to set the urgent-hint in urxvt
zle-line-init () { print -n -- "\a" }
zle -N zle-line-init

function parse_git_branch() {
    if [ -f .git/HEAD ]; then
        local branch=$(sed 's/ref: refs\/heads\///g' .git/HEAD)
        export __CURRENT_GIT_BRANCH=" (±$branch)"
    else
        unset __CURRENT_GIT_BRANCH
    fi
}

parse_git_branch

function set_termtitle() {
    # sets xterm title
    case $TERM in
    xterm* | rxvt*)
        print -Pn -- "\e]2;$1"
        print -rn -- "$2"
        print -n -- "\a"
    esac
    case $TERM in
    screen*)
        # screen title (in ^A")
        print -n -- "\ek"
        print -rn -- "$2"
        print -n -- "\e\\"

        # screen location
        print -Pn -- "\e_$1"
        print -rn -- "$2"
        print -n -- "\e\\"
    ;;
    esac
}

function precmd() {
    set_termtitle "%m: %~" "$__CURRENT_GIT_BRANCH"
}

function preexec() {
    set_termtitle "%m: " "$@ $__CURRENT_GIT_BRANCH"
}

chpwd_functions=(${chpwd_functions} parse_git_branch)

# vim: set ts=4 sts=4 expandtab:
