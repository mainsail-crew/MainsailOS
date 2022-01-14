# Mainsail OS Tweaks
# Written by Stephan Wendel <me@stephanwe.de> aka KwadFan
# This file may distributed under GPLv3
# Copyright 2021
########

alias msosver='cat mainsailos-release'

# ls shortcuts
alias l='ls -lh --group-directories-first'
alias ll='ls -l'
alias la='ls -A'
alias lal='ls -al'
alias lh='ls -hAl'


# cd shortcut
alias ..='cd ..'
alias ...='cd ../..'
alias mkcd='mkdir -p ${@} && cd ${@}'


# make menuconfig LC_ALL BUG
function fake_make {
    local make
    # speed up make :P
    make='make -j$(nproc)'
    if [ "${PWD}" = "${HOME}/klipper" ]; then
        LC_ALL="C" make "${@}"
    else
        make "${@}"
    fi
}
alias make='fake_make'
