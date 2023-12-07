#!/usr/bin/env bash
#### Configuration check in buildchain
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


ERROR_COUNT=0

step_output_msg() {
    printf "Running config check ...\n"
    printf "Using configuration file: %s\n" "${1}"
    printf "Working directory: %s\n" "${2}"
    printf "Generate .md file: %s\n" "${3}"
    printf "Used matrix: %s\n" "${4}"
}

import_config() {
    printf "Importing config file: %s\n" "${1}"
    # shellcheck disable=SC1090
    source "${1}"
}

create_stepsum_file() {
    touch "${1}"
    printf "## Config Check:\n## Deep inspection of config file: %s\n" "${2}" > "${1}"
}

get_dist_info() {
    printf "### Distribution informations:\n"
    if [[ -n "${DIST_NAME}" ]]; then
        echo -e "- Distribution name: ${DIST_NAME} :white_check_mark:"
    else
        echo -e "- Distribution name: NOT SET! :x:"
        ERROR_COUNT=$((ERROR_COUNT+1))
    fi
    if [[ -n "${DIST_VERSION}" ]]; then
        echo -e "- Distribution version: ${DIST_VERSION} :white_check_mark:"
    else
        echo -e "- Distribution version: NOT SET!"
        ERROR_COUNT=$((ERROR_COUNT+1))
    fi
    if [[ -n "${BASE_ARCH}" ]]; then
        echo -e "- Distribution type: 64-bit :white_check_mark:"
    else
        echo -e "- Distribution type: NOT SET! Probably 32-bit :warning:"
    fi
    if [[ -n "${MODULES}" ]]; then
        echo -e "- Module configuration: ${MODULES} :white_check_mark:"
    else
        echo -e "- Module configuration: NOT SET! :x:"
        ERROR_COUNT=$((ERROR_COUNT+1))
    fi
    echo -e "---\n"
}

get_distri_base_image() {
    printf "### Using base image:\n"
    if [[ -n "${DOWNLOAD_URL_IMAGE}" ]]; then
        echo -e "- Base image download url: ${DOWNLOAD_URL_IMAGE} :white_check_mark:"
    else
        echo -e "- Base image download url: NOT SET! :x:"
        ERROR_COUNT=$((ERROR_COUNT+1))
    fi
    if [[ -n "${DOWNLOAD_URL_CHECKSUM}" ]]; then
        echo -e "- Base image checksum download url: ${DOWNLOAD_URL_CHECKSUM} :white_check_mark:"
    else
        echo -e "- Base image checksum download url: NOT SET! :x:"
        ERROR_COUNT=$((ERROR_COUNT+1))
    fi
    echo -e "---\n"
}

get_json_snipplet_config() {
    printf "### JSON Snipplet configuration:\n"
    if [[ -n "${JSON_PRETTY_NAME}" ]]; then
        echo -e "- Prettified distribution name: ${JSON_PRETTY_NAME} :white_check_mark:"
    else
        echo -e "- Prettified distribution name: NOT SET! :x:"
        ERROR_COUNT=$((ERROR_COUNT+1))
    fi
    if [[ -n "${JSON_DESCRIPTION}" ]]; then
        echo -e "- Distribution description: ${JSON_DESCRIPTION} :white_check_mark:"
    else
        echo -e "- Distribution description: NOT SET! :x:"
        ERROR_COUNT=$((ERROR_COUNT+1))
    fi
    if [[ -n "${JSON_ICON_URL}" ]]; then
        echo -e "- Distribution brand icon url: ${JSON_ICON_URL} :white_check_mark:"
    else
        echo -e "- Distribution brand icon url: NOT SET! :x:"
        ERROR_COUNT=$((ERROR_COUNT+1))
    fi
    if [[ -n "${JSON_INIT_FORMAT}" ]]; then
        echo -e "- Distribution init system: ${JSON_INIT_FORMAT} :white_check_mark:"
    else
        echo -e "- Distribution init system: NOT SET! :x:"
        ERROR_COUNT=$((ERROR_COUNT+1))
    fi
    if [[ -n "${JSON_SUPPORTED_SBC}" ]]; then
        echo -e "- By distribution supported sbc: ${JSON_SUPPORTED_SBC} :white_check_mark:"
    else
        echo -e "- By distribution supported sbc: NOT SET! :x:"
        ERROR_COUNT=$((ERROR_COUNT+1))
    fi
    echo -e "---\n"
}

attach_config() {
    {
    echo -e "\n<details>\n<summary>Show config file</summary>\n"
    echo -e "\`\`\`bash\n"
    cat "${2}"
    echo -e "\`\`\`\n"
    } >> "${1}"
}

main() {
    local config_file stepsum_md_file
    config_file="${1}"
    matrix="${2}"
    stepsum_md_file="${PWD}/repository/stepsum.md"

    step_output_msg "${config_file}" "${PWD}" "${stepsum_md_file}" "${matrix}"
    import_config "${config_file}"
    create_stepsum_file "${stepsum_md_file}" "${matrix}"
    {
        get_dist_info
        get_distri_base_image
        get_json_snipplet_config
    } >> "${stepsum_md_file}"
    if [[ "${ERROR_COUNT}" -ne 0 ]]; then
        {
            printf "### Config Check failed! :no_entry_sign:"
            printf "Your configuration contains at least %d error(s)! :warning:\n" "${ERROR_COUNT}"
            printf "Please check your configuration files and fix error(s)! :mag:\n"
        } >> "${stepsum_md_file}"
        printf "Config Check failed ... (Errors occured: %d) \n" "${ERROR_COUNT}"
        attach_config "${stepsum_md_file}" "${config_file}"
        exit 1
    else
        printf "### Config Check passed! :white_check_mark:\n" >> "${stepsum_md_file}"
        attach_config "${stepsum_md_file}" "${config_file}"
    fi
}

# if name == main idiom (bash version)
# erroring out if more than one argument given
if [[ "${BASH_SOURCE[0]}" = "${0}" ]]; then
    if [[ "${#}" -gt 2 ]]; then
        printf "ERROR: Too many arguments given! Exiting ..."
        exit 1
    else
        main "${@}"
        exit 0
    fi
fi
