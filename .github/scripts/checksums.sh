#!/usr/bin/env bash
# Shebang for better file detection
#### Calculate image checksums, generate GITHUB_OUTPUT and GITHUB_STEP_SUMMARY
####
#### Written by Stephan Wendel aka KwadFan <me@stephanwe.de>
#### Copyright 2023 - till today
#### https://github.com/mainsail-crew/MainsailOS
####
#### This File is distributed under GPLv3
####

# shellcheck enable=require-variable-braces

# Exit upon errors
set -Ee

# Setup
CHKSUM_DEBUG="false"

main() {
    local comp_img_checksum file img_checksum
    file="${1}.img"
    img_checksum="$(sha256sum "${file}")"
    comp_img_checksum="$(sha256sum "${file}".xz)"
    echo "Successful generated checksums:"
    echo "${img_checksum}"
    echo "${comp_img_checksum}"
    # Write to file
    echo "${img_checksum}" > "${file}.sha256"
    echo "${comp_img_checksum}" > "${file}.xz.sha256"
    # transform checksum
    img_checksum="$(cut -f1 -d' ' <<< "${img_checksum}")"
    comp_img_checksum="$(cut -f1 -d' ' <<< "${comp_img_checksum}")"
    if [[ "${CHKSUM_DEBUG}" = "true" ]]; then
        {
            echo "## Checksums:"
            echo "Image file: ${file}"
            echo "Image checksum (sha256): ${img_checksum}"
            echo "Compressed image file: ${file}.xz"
            echo "Compressed image checksum (sha256): ${img_checksum}"
        } >> "${GITHUB_STEP_SUMMARY}"
    fi
    # export to output
    echo "img_checksum=${img_checksum}" >> "${GITHUB_OUTPUT}"
    echo "comp_img_checksum=${comp_img_checksum}" >> "${GITHUB_OUTPUT}"
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
