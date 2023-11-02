#!/usr/bin/env python3
# Generate matrix string from workflow_config.yml
####
# Written by Stephan Wendel aka KwadFan <me@stephanwe.de>
# Copyright 2023 - till today
# https://github.com/mainsail-crew/MainsailOS
####
# This File is distributed under GPLv3
####

import os
import sys
import yaml

from pathlib import Path
from argparse import ArgumentParser, RawTextHelpFormatter


def main():
    # Parse args
    parser = ArgumentParser(
        description='Returns list for setup matrix',
        formatter_class=RawTextHelpFormatter)
    parser.add_argument('-c', '--config',
                        help='Specify the /path/to/configuration/file',
                        required=True)
    parser.add_argument('-g', '--group',
                        help='Specify group in your configuration file.\
                        \nFor example \'-g  buildtest\'',
                        required=True)
    parser.add_argument('--git',
                        action='store_true',
                        help='Push output to git environment variables')
    args = parser.parse_args()
    # Split Namespaces
    config_file, setup_group = args.config, args.group
    if args.git:
        try:
            with open(config_file, 'r') as config:
                data = yaml.safe_load(config)
                # Check if group is present
                if not setup_group in data:
                    with open(os.environ['GITHUB_STEP_SUMMARY'], 'a') as gitsum:
                        gitsum_header_msg(gitsum)
                        gitsum_err_msg(
                            f"The given group '{setup_group}' doesn't exist!",
                            gitsum)
                        sys.exit(1)
                else:
                    with open(os.environ['GITHUB_OUTPUT'], 'a') as gitout:
                        print(f'matrix={data[setup_group]}', file=gitout)
                    with open(os.environ['GITHUB_STEP_SUMMARY'], 'a') as gitsum:
                        gitsum_header_msg(gitsum)
                        print(f'## Build images for these SBC\'s:', file=gitsum)
                        for sbc in data[setup_group]:
                            print(f"- {sbc}", file=gitsum)
        except Exception as e:
            with open(os.environ['GITHUB_STEP_SUMMARY'], 'a') as gitsum:
                gitsum_err_msg(e, gitsum)
                sys.exit(1)
    else:
        try:
            # Checks if file exists, else raises error.
            with open(config_file, 'r') as config:
                data = yaml.safe_load(config)
                # Check if group is present
                if not setup_group in data:
                    raise Exception(
                        f"The given group '{setup_group}' doesn't exist!"
                    )
                else:
                    print(data[setup_group])
        except Exception as e:
            err_msg(e)
            sys.exit(1)


def err_msg(err):
    name = Path(__file__).stem
    print(f'{name}: OOOPS, something went wrong!\n{err}')


def gitsum_header_msg(env_var):
    print(f'# Setup Matrix:', file=env_var)


def gitsum_err_msg(err, env_var):
    gitsum_header_msg(env_var)
    print(f'## Error:\n{err}')


# MAIN
if __name__ == "__main__":
    main()
