export HISTFILE=~/.histfile
export HISTSIZE=4000
export SAVEHIST=4000

# some CPAN modules don't install their utilities into $PATH
__cpanbin=`perl -e 'print join ":", grep { /perl/ && s![^/]+$!bin! && -d } @INC'`
[ -n "$__cpanbin" ] && PATH+=":$__cpanbin"
export PATH="$HOME/bin:$PATH:/sbin:/usr/sbin"

export EDITOR=`which vim`
export VISUAL="$EDITOR"
export PAGER=`which less`
# search ignores case, if in all lowercase; long prompt;
# print unescaped control chars (for git log)
export LESS="iMR"

export PERL_CPANM_OPT="--sudo"


f() { find . -iname "*$1*" }
pg() {
    local pids=$(pgrep -d "," $1)
    [ -n "$pids" ] && ps f -o user,pid,priority,ni,pcpu,pmem,args --pid=$pids
}


parse_git_branch() {
    if [ -f .git/HEAD ]; then
        local branch=$(sed 's/ref: refs\/heads\///g' .git/HEAD)
        export __CURRENT_GIT_BRANCH=" (±$branch)"
    else
        unset __CURRENT_GIT_BRANCH
    fi
}
chpwd_functions=(${chpwd_functions} parse_git_branch)
parse_git_branch

set_termtitle() {
    case $TERM in
    screen*|xterm*|*rxvt*)
        # plain xterm title
        print -Pn -- "\e]2;$1"
        print -rn -- "$2"
        print -n -- "\a"
    ;;
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
    set_termtitle "%m: " "$2$__CURRENT_GIT_BRANCH"
}

# vim: set ts=4 sts=4 expandtab:
