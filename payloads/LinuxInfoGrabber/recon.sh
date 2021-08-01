#!/usr/bin/env bash

# INSPIRED BY: https://github.com/hak5/bashbunny-payloads/blob/27d63ad5a535510b20787cc03850b28bbdb727ee/payloads/library/recon/LinuxInfoGrabber/recon.sh

# Data collection script
# Similar to InfoGrabber for Windows

# First parameter is path of log file to create

echo "Linux system info grabber" >$@
echo "" >>$@

echo "Interfaces" >>$@
echo "##############" >>$@
ifconfig -a >>$@
echo "" >>$@

echo "Mounted FS" >>$@
echo "##############" >>$@
findmnt -A >>$@
echo "" >>$@

# TODO wifi
# TODO local user
echo "Processes" >>$@
echo "##############" >>$@
ps -ax >>$@
echo "" >>$@

echo "Interfaces (netstat)" >>$@
echo "##############" >>$@
netstat --interfaces >>$@
echo "" >>$@

echo "Routes" >>$@
echo "##############" >>$@
netstat --route >>$@
echo "" >>$@

# This one slow, uncomment if needed
echo "Netstat" >>$@
echo "##############" >>$@
netstat >>$@
echo "" >>$@

echo "Services" >>$@
echo "##############" >>$@
service --status-all >>$@
echo "" >>$@

echo "Installed software" >>$@
echo "##############" >>$@
yum list installed >>$@
echo "" >>$@

echo "Loaded drivers" >>$@
echo "##############" >>$@
lsmod >>$@
echo "" >>$@

echo "PCI Hardware" >>$@
echo "##############" >>$@
lspci -vv >>$@
echo "" >>$@

echo "USB hardware" >>$@
echo "##############" >>$@
lsusb -v >>$@
echo "" >>$@
