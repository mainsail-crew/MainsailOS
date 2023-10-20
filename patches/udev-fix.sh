#!/usr/bin/env bash

#### Patch Script
#### This will patch MainsailOS udev rule
####
#### Written by Stephan Wendel aka KwadFan <me@stephanwe.de>
#### Copyright 2021
#### https://github.com/mainsail-crew/MainsailOS
####
#### This File is distributed under GPLv3
####

#### This should fix error in udev not creating symlinks fpr serial devices.
#### For details see: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1035094
#### This is fixed by: https://github.com/systemd/systemd/pull/25246
#### To fix this error in MainsailOS we implement that file as 'user rule'.

# shellcheck disable=SC2034

# Error Handling
set -eo pipefail

# Debug
# set -x

### Variables
DEBIAN_FRONTEND="noninteractive"
TITLE="\e[31mMainsailOS Patcher\e[0m - udev rule fix"
UDEV_FIX_RAW_RULE_FILE="https://raw.githubusercontent.com/systemd/systemd/main/rules.d/60-serial.rules"
UDEV_FIX_TMP_FILE="/tmp/60-serial.rules"
UDEV_FIX_OUTPUT_FILE="/etc/udev/rules.d/60-serial.rules"

# Message Vars
MP_OK="\e[32mOK\e[0m"
MP_SK="\e[33mSKIPPED\e[0m"

## Helper funcs

## Message Funcs

echo_green(){
    echo -e "\e[32m${1}\e[0m"
}

echo_red(){
    echo -e "\e[31m${1}\e[0m"
}

echo_blue(){
    echo -e "\e[34m${1}\e[0m"
}

echo_yellow(){
    echo -e "\e[33m${1}\e[0m"
}

print_header(){
    echo -e "${TITLE}\n"
    echo_blue "Ahoi!"
    echo -e "Please be patient, this might take a while ..."
    echo_yellow "HINT: This should also work for any other Debian/Armbian based Distribution\n"
    echo_red "\tYou'll be prompted for sudo password!\n"
    # Dirty hack to grant root priviledges
    sudo echo -e "\n"
    echo -e "Trying to patch your system ..."
}

print_footer(){
    echo -e "\nThank you for being patient ..."
    echo_red "Reboot as soon as possible!\n"
}

# Patch Funcs

patch_udev(){
    local udev_pkg_version
    udev_pkg_version="$(dpkg-query -s udev | grep "Version" | sed 's/Version\: //')"

    if [[ -n "${udev_pkg_version}" ]] && [[ "${udev_pkg_version}" =~ "deb11u2" ]]; then
        echo_red "'udev' version: ${udev_pkg_version}, is affected by bug ..."
        echo_green "Install patched udev rule from systemd git repository ..."
        curl -sSL "${UDEV_FIX_RAW_RULE_FILE}" > "${UDEV_FIX_TMP_FILE}"
        sudo cp "${UDEV_FIX_TMP_FILE}" "${UDEV_FIX_OUTPUT_FILE}"
        rm -f "${UDEV_FIX_TMP_FILE}"
    else
        echo_green "'udev' version: ${udev_pkg_version}, is NOT affected by bug ... [SKIPPED]"
    fi
}

### Main
# Step 1: Print Header
print_header

# Step 2: Run apt-get update
sudo apt-get update

# Step 3: Run apt-get upgrade
sudo apt-get upgrade --yes

# Step 4: Apply patches
patch_udev

# Step 5: Print footer
print_footer

exit 0
