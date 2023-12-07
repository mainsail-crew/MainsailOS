#!/usr/bin/env bash
# Shebang for better file detection
#### Generate Build summary table
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

# Debug
GENSUM_DEBUG="true"

gen_header() {
cat << EOF
## Build summary:

| Image file | Image size | Compressed size | Build time |
| ---------- | ---------- | --------------- | ---------- |
EOF
}

get_md_files() {
    local files
    files="$(find "${1}" -type f -name "*MainsailOS*.md" -printf "%p\n")"
    files="$(sort -u <<< "${files}")"
    echo "${files}"
}

main() {
    local md_files table_md workspace
    workspace="${1}"
    table_md="${workspace}/sum_table.md"
    md_files="$(get_md_files "${workspace}")"
    if [[ "${GENSUM_DEBUG}" = "true" ]]; then
        echo "${md_files}"
    fi
    gen_header | tee "${table_md}" &> /dev/null
    for file in ${md_files}; do
    # Ugly workaround due behaviour of actions/download-artifacts :facepalm:
        tee -a "${table_md}" &> /dev/null < "${file}"
    done
    if [[ "${GENSUM_DEBUG}" = "true" ]]; then
        cat "${table_md}"
    fi
    cat "${table_md}" >> "${GITHUB_STEP_SUMMARY}"
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
