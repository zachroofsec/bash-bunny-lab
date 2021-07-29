#!/bin/bash
#
# Title: Linux_Info_Grabber
# Description: System info grabber for Linux (focus: Debian)
# Original Author: Thorsten Sick
# Version: 0.9
# Category: Recon
# Target: Linux (Debian based)
# Creds: Simen Kjeserud for Inspiration (Info_Grabber)
# Attackmodes: HID, STORAGE
#
#
# executes recon.sh to extract sytem info
#
# Does NOT hide any traces
# Is also noisy: Does more in victim shell than it has to

#init

MOCK_BASH_BUNNY_USB_DIR=$HOME/bash_bunny
PAYLOAD_DIR=$MOCK_BASH_BUNNY_USB_DIR/payloads/LinuxInfoGrabber
LOOT_DIR=$MOCK_BASH_BUNNY_USB_DIR/loot/InfoGrabber
LOOT_FILE=$LOOT_DIR/loot.txt
mkdir -p $MOCK_BASH_BUNNY_USB_DIR $PAYLOAD_DIR $LOOT_DIR

bash $PAYLOAD_DIR/recon.sh $LOOT_FILE