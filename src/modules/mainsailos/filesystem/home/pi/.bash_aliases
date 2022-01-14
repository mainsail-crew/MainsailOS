#!/bin/bash
# Mainsail OS Tweaks
# Written by Stephan Wendel <me@stephanwe.de> aka KwadFan
# This file may distributed under GPLv3
# Copyright 2021
########

alias msosver='cat mainsailos-release'
alias c='clear'
# ls shortcuts
alias l='ls -lh --group-directories-first'
alias ll='l -a'
alias la='ls -A'
alias lal='ls -al'
alias lh='ls -hAl'


# cd shortcut
alias ..='cd ..'
alias ...='cd ../..'
function mkcd {
    if [ ! -d "$*" ]; then
        mkdir -p "$*"
    fi
    cd "$_"
}


# make menuconfig LC_ALL BUG
function fake_make {
    # speed up make :P
    if [ "${PWD}" = "${HOME}/klipper" ]; then
        LC_ALL="C" make -j"$(nproc)" "${@}"
    else
        make -j"$(nproc)" "${@}"
    fi
}
alias make='fake_make'


# cmdline pastebin
function pastebin {
    if [ -n "$(whereis -b curl | awk '{print $2}')" ]; then
        echo -e "pastebin URL:"
        cat "$@" | curl -F 'sprunge=<-' http://sprunge.us
    fi
}

function pastelogs {
    local logs
    logs=$(find ~/klipper_logs/ -name '*.log')
    for l in ${logs}; do
        echo "----------------------------------------------------------------"
        echo -e "File: ${l}"
        echo "----------------------------------------------------------------"
        cat "${l}"
    done | curl -F 'sprunge=<-' http://sprunge.us
}


function oshelp {
    echo -e "------------------------------------------------------------------"
    echo -e "--                MainsailOS bash goodies                       --"
    echo -e "------------------------------------------------------------------"
    echo -e "\n"
    echo -e "------------------------------------------------------------------"
    echo -e "-- Shortcuts:                                                   --"
    echo -e "--                                                              --"
    echo -e "--  l='ls -lh --group-directories-first'                        --"
    echo -e "--  ll='l -a'                                                  --"
    echo -e "--  la='ls -A'                                                  --"
    echo -e "--  lal='ls -al'                                                --"
    echo -e "--  lh='ls -hAl'                                                --"
    echo -e "--  ..='cd ..'                                                  --"
    echo -e "--  ...='cd ../..'                                              --"
    echo -e "--  mkcd <dir> = mkdir and cd to                                --"
    echo -e "--  c = clear (clears the screen )                              --"
    echo -e "------------------------------------------------------------------"
    echo -e "\n"
    echo -e "------------------------------------------------------------------"
    echo -e "-- pastebin from shell  - pastes textfile to sprunge.us         --"
    echo -e "--                                                              --"
    echo -e "--  pastebin <path/to/file>  - ex: pastebin ~/some.log          --"
    echo -e "--  pastelogs - pastes all logs from klipper_logs to sprunge.us --"
    echo -e "------------------------------------------------------------------"
    echo -e "\n"
    echo -e "------------------------------------------------------------------"
    echo -e "-- msosver - shows version of mainsailOS                        --"
    echo -e "------------------------------------------------------------------"
    echo -e "\n"
}