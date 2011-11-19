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
    [ -n "$pids" ] && ps f -o user,pid,pri,ni,pcpu,pmem,args --pid=$pids
}

st() {
    local dir=$(mktemp -d)
    strace -s 2048 -f -o $dir/strace "$@"
    $EDITOR $dir/strace*
}

parse_git_branch() {
    if [ -f .git/HEAD ]; then
        local branch=$(sed 's/ref: refs\/heads\///g' .git/HEAD)
        export __CURRENT_GIT_BRANCH=" (±$branch)"
    else
        unset __CURRENT_GIT_BRANCH
    fi
}

cwd_to_urxvt() {
    local cwd="$PWD"
    local update="\0033]777;cwd-spawn;path;$cwd\0007"

    case $TERM in
    screen*)
    # pass through to parent terminal emulator
        update="\0033P$update\0033\\";;
    esac

    echo -ne "$update"
}

ssh_connection_to_urxvt() {
    # don't propagate information to urxvt if ssh is used non-interactive
    [ -t 0 ] || [ -t 1 ] || return
    local update="\0033]777;cwd-spawn;ssh;$1\0007"

    case $TERM in
    screen*)
    # pass through to parent terminal emulator
        update="\0033P$update\0033\\";;
    esac

    echo -ne "$update"
}

set_termtitle() {
    # plain xterm title
    print -Pn -- "\e]2;$1"
    print -rn -- "$2"
    print -n -- "\a"
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

# vim: set ts=4 sts=4 expandtab:
