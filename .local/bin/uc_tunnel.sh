#!/bin/bash

# sshpas with TOTP support: https://github.com/dora38/sshpass
# .env file should contain:
# export SSH_USER=""
# export SSH_PASS=""
# export TOTP_SECRET=""

SCRIPT_DIR=$(dirname "$0")
cd $SCRIPT_DIR

if [ -f .env ]; then
    source .env
fi

OS=$(uname)

if [[ "$OS" == "Linux" ]]; then
    SSH_PASS_CMD="./bin/sshpass_linux"
elif [[ "$OS" == "Darwin" ]]; then
    SSH_PASS_CMD="./bin/sshpass_osx"
else
    echo "Unsupported OS $OS"
    exit 1
fi

# ./bin/sshpass_osx \
$SSH_PASS_CMD \
    -v \
    -p $SSH_PASS \
    -o $(oathtool --totp=SHA1 --base32 $TOTP_SECRET) \
    ssh $SSH_USER@linux.cosc.canterbury.ac.nz -L 3306:db2.csse.canterbury.ac.nz:3306 -N

