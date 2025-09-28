#!/bin/bash

# sshpas with TOTP support: https://github.com/dora38/sshpass
# .env file should contain:
# export SSH_USER=""
# export SSH_PASS=""
# export SSH_HOST=""
# export TOTP_SECRET=""

SCRIPT_DIR=$(dirname "$0")
cd $SCRIPT_DIR

if [ -f .env ]; then
    source .env
fi

OS=$(uname)

if [[ "$OS" == "Linux" ]]; then
    SSH_PASS_CMD="./sshpass_linux"
elif [[ "$OS" == "Darwin" ]]; then
    SSH_PASS_CMD="./sshpass_osx"
else
    echo "Unsupported OS $OS"
    exit 1
fi

SSH_BASE=(
    "$SSH_PASS_CMD"
    -v \
    -p $SSH_PASS \
    -o $(oathtool --totp=SHA1 --base32 $TOTP_SECRET) \
    ssh
)

if [ $# -eq 0 ]; then
    # No args, launch interactive shell
    exec "${SSH_BASE[@]}" "$SSH_USER@$SSH_HOST"
else
    # args passed, forward as is
    exec "${SSH_BASE[@]}" "$@"
fi