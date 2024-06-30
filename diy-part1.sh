#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# echo 'src-git app-passwall2 https://github.com/xiaorouji/openwrt-passwall2' >>feeds.conf.default
# echo 'src-git app-adguardhome https://github.com/rufengsuixing/luci-app-adguardhome' >>feeds.conf.default
# echo 'src-git app-mosdns https://github.com/sbwml/luci-app-mosdns' >>feeds.conf.default

#echo "src-git netdata https://github.com/sirpdboy/luci-app-netdata" >> feeds.conf.default

# https://openwrt.org/zh/docs/guide-developer/feeds
# https://www.cnblogs.com/NueXini/p/16521481.html

# mkdir -p lx-feed/libpcre
# wget https://github.com/x-wrt/packages/blob/master/libs/pcre/Config.in -P lx-feed/libpcre
# wget https://github.com/x-wrt/packages/blob/master/libs/pcre/Makefile -P lx-feed/libpcre
# echo 'src-link libpcre lx-feed/' >>feeds.conf.default
# ./scripts/feeds update libpcre
# ./scripts/feeds install -a -p libpcre
