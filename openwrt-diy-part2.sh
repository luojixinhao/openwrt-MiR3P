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

# Git稀疏克隆，只克隆指定目录到本地
function git_sparse_clone() {
	branch="$1" repourl="$2" && shift 2
	git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
	repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
	cd $repodir && git sparse-checkout set $@
	mv -f $@ ../package
	cd .. && rm -rf $repodir
}

# AdGuardHome
#git clone --depth=1 https://github.com/kongfl888/luci-app-adguardhome package/luci-app-adguardhome
git_sparse_clone main https://github.com/sirpdboy/sirpdboy-package luci-app-adguardhome

# MosDNS
git clone --depth=1 https://github.com/sbwml/luci-app-mosdns package/luci-app-mosdns

# SmartDNS
#git clone --depth=1 -b lede https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns
#git clone --depth=1 https://github.com/pymumu/openwrt-smartdns package/smartdns

# Wrtbwmon
git clone --depth=1 https://github.com/brvphoenix/wrtbwmon package/wrtbwmon
git clone --depth=1 https://github.com/brvphoenix/luci-app-wrtbwmon package/luci-app-wrtbwmon

#OpenClash
git_sparse_clone master https://github.com/vernesong/OpenClash luci-app-openclash

# chinadns-ng
#git clone --depth=1 https://github.com/zfl9/chinadns-ng package/chinadns-ng
# Passwall 最新版本
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages package/openwrt-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall

# Ruby 3.3.3 编译不了，替换为低版本
# ls -al package/feeds/packages/ruby
# rm -rf package/feeds/packages/ruby
# git_sparse_clone 24.04_b202406141121 https://github.com/x-wrt/packages lang/ruby

# 修复缺少依赖libpcre的警告
git_sparse_clone master https://github.com/x-wrt/packages libs/pcre

# 
ls -al feeds/luci/applications/luci-app-netdata
rm -rf feeds/luci/applications/luci-app-netdata
#git_sparse_clone main https://github.com/sirpdboy/sirpdboy-package luci-app-netdata
#git clone https://github.com/sirpdboy/luci-app-netdata package/luci-app-netdata
git clone --depth=1 https://github.com/Jason6111/luci-app-netdata package/luci-app-netdata

# PPTP
git_sparse_clone main https://github.com/sirpdboy/sirpdboy-package luci-app-pptpserver

# 很多功能不能用
#git clone --depth=1 https://github.com/sirpdboy/netspeedtest.git package/netspeedtest

#主题
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config

# 磁盘管理
git_sparse_clone master https://github.com/immortalwrt/luci applications/luci-app-diskman

# Syncthing
git_sparse_clone master https://github.com/immortalwrt/luci applications/luci-app-syncthing
