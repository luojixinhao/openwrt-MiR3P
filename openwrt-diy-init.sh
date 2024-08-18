#!/bin/bash

# 主题相关设置
[ -d /usr/lib/lua/luci/view/themes/argon ] && uci set luci.main.mediaurlbase='/luci-static/argon'
uci set luci.sauth.sessiontime=86400
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

[ -f /etc/init.d/collectd ] &&  mkdir -p /etc/collectd/conf.d/

if [ -f /usr/libexec/wget-ssl ]; then
	rm /usr/bin/wget
	ln -s /usr/libexec/wget-ssl /usr/bin/wget
fi

[ -f /etc/init.d/nlbwmon ] && /etc/init.d/nlbwmon enable
[ -f /etc/init.d/blockd ] && /etc/init.d/blockd disable
[ -f /etc/init.d/netdata ] && /etc/init.d/netdata disable
[ -f /etc/init.d/openclash ] && /etc/init.d/openclash disable
[ -f /etc/init.d/passwall_server ] && /etc/init.d/passwall_server disable
[ -f /etc/init.d/passwall ] && /etc/init.d/passwall disable

[ -f /etc/config/wrtbwmon.user ] && cp /etc/config/wrtbwmon.user /etc/

if [ -f /usr/bin/AdGuardHome ]; then
	mv /usr/bin/AdGuardHome /usr/bin/AdGuardHome_t
	mkdir /usr/bin/AdGuardHome/
	mv /usr/bin/AdGuardHome_t /usr/bin/AdGuardHome/AdGuardHome
fi
if [ -f /usr/bin/AdGuardHome_new ]; then
	mv /usr/bin/AdGuardHome_new /usr/bin/AdGuardHome/AdGuardHome
fi

exit 0