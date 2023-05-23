#!/usr/bin/env bash

#### Patch Script
#### This will patch MainsailOS to the Latest Changes
####
#### Written by Stephan Wendel aka KwadFan <me@stephanwe.de>
#### Copyright 2021
#### https://github.com/mainsail-crew/MainsailOS
####
#### This File is distributed under GPLv3
####

# Error Handling
set -eo pipefail

# Debug
# set -x

### Variables
# shellcheck disable=SC2034
DEBIAN_FRONTEND="noninteractive"

# Global Vars
MAINSAILOS_VER="1.0.1"

TITLE="\e[31mMainsailOS Patcher\e[0m - Patch OS to latest changes (MainsailOS ${MAINSAILOS_VER})"
RELEASE_FILE="/etc/mainsailos-release"
BASE_DL_URL="https://raw.githubusercontent.com/mainsail-crew/MainsailOS/develop"

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
    echo_red "\tYou'll be prompted for sudo password!\n"
    # Dirty hack to grant root priviledges
    sudo echo -e "\n"
    echo -e "Trying to patch your system ..."
}

print_footer(){
    echo -e "\nThank you for being patient ..."
    echo_red "Reboot as soon as possible!\n"
}

# Helper Funcs

## CHeck Version
check_version(){
    local version
    version="$(grep "1\.[0-9]\.[0-9]" "${RELEASE_FILE}" 2> /dev/null || true)"
    if [[ -z "${version}" ]]; then
        echo_red "Minimum required MainsailOS Version is 1.0.0! ... [Exiting]"
        exit 1
    fi
}

# Patch Funcs

# patch mainsailos-release file
patch_release_file(){
    sudo sed -i 's|[0-9]\.[0-9]\.[0-9]|'"${MAINSAILOS_VER}"'|' "${RELEASE_FILE}"
}

## This patches udev rules error
## See https://github.com/mainsail-crew/MainsailOS/issues/190
## Keep function naming convention for patches!
## For ex: patch from 1.0.0 to 1.0.1 is named patch_101

patch_101(){
    local dl_file
    dl_file="${BASE_DL_URL}/src/modules/net/filesystem/usr/local/bin/pwrsave-udev"
    echo_blue "Running Wifi Powersave Patch ..."
    echo -e "Search for pwrsave-udev script ..."
    if [[ ! -f "/usr/local/bin/powersave-udev" ]]; then
        echo -e "Script not found! Installing ..."
        sudo wget -O "/usr/local/bin/pwrsave-udev" "${dl_file}"
        sudo chmod +x "/usr/local/bin/pwrsave-udev"
        echo -e "Script not found! Installing ... \t${MP_OK}"
    else
        echo -e "Script found! ... \t${MP_SK}"
    fi

    echo -e "Search for udev Rule file ..."
    if [[ ! -f "/etc/udev/rules.d/070-wifi-powersave.rules" ]]; then
        echo -e "udev rule not found! Installing ..."
        sudo bash -c '/usr/local/bin/pwrsave-udev create'
        sudo bash -c '/usr/local/bin/pwrsave-udev off'
        echo -e "udev rule not found! Installing ...\t${MP_OK}"
    else
        echo -e "udev Rule found! ... \t${MP_SK}"
    fi
    echo_blue "Running Wifi Powersave Patch ... ${MP_OK}"
}


### Main

# Step 1: Print Header
print_header

# Step 2: Check Version requirement
check_version

# Step 3: Apply patches
patch_101

# Step 4: Patch release file to match versions
patch_release_file

# Step 5: Print footer
print_footer
