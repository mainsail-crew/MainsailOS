#!/usr/bin/env bash
# Shebang for better file detection
#### Generate Build summary table column
####
#### Written by Stephan Wendel aka KwadFan <me@stephanwe.de>
#### Copyright 2023 - till today
#### https://github.com/mainsail-crew/MainsailOS
####
#### This File is distributed under GPLv3
####

#### Output Should look like (to file)
# | Image name | Size (raw) | Size (compressed) | build time |

# Inputs (via ENV Variables):
# md_file
# image
# raw_img_size
# raw_img_size_hr
# comp_img_size
# comp_img_size_hr
# duration
# duration_hr


# shellcheck enable=require-variable-braces
# shellcheck disable=SC2154

# Exit upon errors
set -Ee

# Debug
SUMCOL_DEBUG="false"

main() {
    local column workspace
    workspace="${1}"
    #Debug Output
    if [[ "${SUMCOL_DEBUG}" = "true" ]]; then
        {
            echo "## Debug summary table column:"
            echo "Image: ${image}"
            echo "Raw image size: ${raw_img_size} (${raw_img_size_hr})"
            echo "Compressed image size: ${comp_img_size} (${comp_img_size_hr})"
            echo "Build time: ${duration} seconds ${duration_hr}"
            echo "Output file: ${md_file}"
        } >> "${GITHUB_STEP_SUMMARY}"
    fi
    column="| ${image}"
    column="${column} | ${raw_img_size} (${raw_img_size_hr})"
    column="${column} | ${comp_img_size} (${comp_img_size_hr})"
    column="${column} | ${duration}s ${duration_hr} |"
    echo "${column}" > "${workspace}/${md_file}"

    unset SUMCOL_DEBUG
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
