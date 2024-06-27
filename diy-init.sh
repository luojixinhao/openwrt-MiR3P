#!/bin/bash

# Set default theme to luci-theme-argon
uci set luci.main.mediaurlbase='/luci-static/argon'
uci commit luci

# Disable IPV6 ula prefix
# sed -i 's/^[^#].*option ula/#&/' /etc/config/network

# Check file system during boot
# uci set fstab.@global[0].check_fs=1
# uci commit fstab

mkdir -p /_LXusb/5T
grep -qw LXusb /etc/passwd || echo "LXusb:*:1000:1000:USB User:/_LXusb:/bin/false" >> /etc/passwd
grep -qw LXusb /etc/group || echo "LXusb:x:1000:USB User" >> /etc/group

rm /usr/bin/wget
ln -s /usr/libexec/wget-ssl /usr/bin/wget

exit 0