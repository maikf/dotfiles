#!/usr/bin/env bash

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
