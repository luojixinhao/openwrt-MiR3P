#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate


egrep '^# setIP:192\.168\.[0-9]{1,3}\.[0-9]{1,3}' .config | sed 's/# setIP://' > CUSTOM_setIP
[ -s CUSTOM_setIP ] && echo "CUSTOM_setIP=$(cat CUSTOM_setIP)" >> $GITHUB_ENV
[ -s CUSTOM_setIP ] && echo "$(cat CUSTOM_setIP)" | sed 's/.[0-9]\{1,3\}$/.255/' > CUSTOM_setMASK
egrep '^# setCONFIG:' .config | sed 's/# setCONFIG://' > CUSTOM_setCONFIG
[ -s CUSTOM_setCONFIG ] && echo "CUSTOM_setCONFIG=$(cat CUSTOM_setCONFIG)" >> $GITHUB_ENV

echo "当前配置: $(cat CUSTOM_setCONFIG)"
echo "自定义IP: $(cat CUSTOM_setIP) / $(cat CUSTOM_setMASK)"
grep -n 'lan) ipad=${ipaddr:-"192.168.[0-9]\{1,3\}.[0-9]\{1,3\}"} ;;' package/base-files/files/bin/config_generate
grep -n 'default "192.168.[0-9]\{1,3\}.' package/base-files/image-config.in
grep -n '/lib/preinit/00_preinit.conf' package/base-files/Makefile | egrep "PREINIT_IP|PREINIT_BROADCAST"

echo "修改IP后："
[ -s CUSTOM_setIP ] && sed -i 's/lan) ipad=${ipaddr:-"192.168.[0-9]\{1,3\}.[0-9]\{1,3\}"} ;;/lan) ipad=${ipaddr:-"'"$(cat CUSTOM_setIP)"'"} ;;/g' package/base-files/files/bin/config_generate
[ -s CUSTOM_setIP ] && sed -i 's/default "192.168.[0-9]\{1,3\}.1/default "'"$(cat CUSTOM_setIP)"'/g' package/base-files/image-config.in
[ -s CUSTOM_setIP ] && sed -i 's/default "192.168.[0-9]\{1,3\}.255/default "'"$(cat CUSTOM_setMASK)"'/g' package/base-files/image-config.in
[ -s CUSTOM_setIP ] && sed -i "s#_IP),\"192.168.[0-9]\{1,3\}.1\")' >>\$(1)/lib/preinit/00_preinit.conf#_IP),\"$(cat CUSTOM_setIP)\")' >>\$(1)/lib/preinit/00_preinit.conf#g" package/base-files/Makefile
[ -s CUSTOM_setIP ] && sed -i "s#_BROADCAST),\"192.168.[0-9]\{1,3\}.255\")' >>\$(1)/lib/preinit/00_preinit.conf#_BROADCAST),\"$(cat CUSTOM_setMASK)\")' >>\$(1)/lib/preinit/00_preinit.conf#g" package/base-files/Makefile

grep -n 'lan) ipad=${ipaddr:-"192.168.[0-9]\{1,3\}.[0-9]\{1,3\}"} ;;' package/base-files/files/bin/config_generate
grep -n 'default "192.168.[0-9]\{1,3\}.' package/base-files/image-config.in
grep -n '/lib/preinit/00_preinit.conf' package/base-files/Makefile | egrep "PREINIT_IP|PREINIT_BROADCAST"
