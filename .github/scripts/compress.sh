#!/usr/bin/env bash
# Shebang for better file detection
#### Compress image, generate GITHUB_OUTPUT and GITHUB_STEP_SUMMARY
####
#### Written by Stephan Wendel aka KwadFan <me@stephanwe.de>
#### Copyright 2023 - till today
#### https://github.com/mainsail-crew/MainsailOS
####
#### This File is distributed under GPLv3
####

# Outputs:
# "img_size=${size}"
# "img_size_hr=${size_hr}"
# "comp_img_size=${comp_size}"
# "comp_img_size_hr=${comp_size_hr}"

# shellcheck enable=require-variable-braces

# Exit upon errors
set -Ee

# Setup xz params
XZ_OPT="--compress --no-warn --keep --force --verbose"
XZ_OPT="${XZ_OPT} --format=xz --extreme -9 -T0"
export XZ_OPT

main() {
    local comp comp_size comp_size_hr file size size_hr
    file="${1}.img"
    # Filter output (will be reused for summary)
    comp="$(xz "${file}" 2>&1 | sed '/xz/d' | cut -f2- -d' ')"
    size="$(du -b "${file}" | cut -f1)"
    comp_size="$(du -b "${file}.xz" | cut -f1)"
    # Human readable
    size_hr="$(du -h "${file}" | cut -f1)"
    comp_size_hr="$(du -h "${file}.xz" | cut -f1)"
    # echo stats to step output
    echo "${file}: ${comp}"
    {
    echo "## Compression statistics:"
    echo "Used flags: ${XZ_OPT}"
    echo "xz statistics: ${comp}"
    echo "Uncompressed image size: ${size} bytes (${size_hr})"
    echo "Compressed image size: ${comp_size} bytes (${comp_size_hr})"
    } >> "${GITHUB_STEP_SUMMARY}"
    {
        echo "img_size=${size}"
        echo "img_size_hr=${size_hr}"
        echo "comp_img_size=${comp_size}"
        echo "comp_img_size_hr=${comp_size_hr}"
    } >> "${GITHUB_OUTPUT}"
    unset XZ_OPT
}

# if name == main idiom (bash version)
# erroring out if more than one argument given
if [[ "${BASH_SOURCE[0]}" = "${0}" ]]; then
    if [[ "${#}" -gt 1 ]]; then
        printf "ERROR: Too many arguments given! Exiting ..."
        exit 1
    else
        main "${@}"
        exit 0
    fi
fi
