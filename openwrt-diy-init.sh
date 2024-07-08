#!/bin/bash

# 主题相关设置
uci set luci.main.mediaurlbase='/luci-static/argon'
uci set luci.sauth.sessiontime=36001
uci commit luci

# Disable IPV6 ula prefix
# sed -i 's/^[^#].*option ula/#&/' /etc/config/network

# Check file system during boot
# uci set fstab.@global[0].check_fs=1
# uci commit fstab

mkdir /mnt/sda1
mkdir /mnt/sda2
mkdir -p /_LXusb/5T
grep -qw LXusb /etc/passwd || echo "LXusb:*:1000:1000:USB User:/_LXusb:/bin/false" >> /etc/passwd
grep -qw LXusb /etc/group || echo "LXusb:x:1000:USB User" >> /etc/group

rm /usr/bin/wget
ln -s /usr/libexec/wget-ssl /usr/bin/wget

/etc/init.d/nlbwmon enable

cp /etc/config/wrtbwmon.user /etc/

mv /usr/bin/AdGuardHome /usr/bin/AdGuardHome_t
mkdir /usr/bin/AdGuardHome/
mv /usr/bin/AdGuardHome_t /usr/bin/AdGuardHome/AdGuardHome

exit 0