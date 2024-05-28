**中文** | [参考](https://p3terx.com/archives/build-openwrt-with-github-actions.html)

# 说明

适用于Xiaomi Mi Router 3 Pro

默认IP： 192.168.31.1
用户名： root
密码：空
内置包：
		base-files busybox ca-bundle dropbear firewall4 fstools kmod-crypto-hw-eip93 kmod-gpio-button-hotplug kmod-leds-gpio kmod-mt7615-firmware kmod-nft-offload kmod-usb-ledtrig-usbport kmod-usb3 libc libgcc libustream-mbedtls logd mtd netifd nftables odhcp6c odhcpd-ipv6only opkg ppp ppp-mod-pppoe procd procd-seccomp procd-ujail uboot-envtools uci uclient-fetch urandom-seed urngd wpad-basic-mbedtls
		block-mount mount-utils blockd ntfs-3g-utils kmod-fs-ext4 kmod-fs-msdos kmod-fs-nfs kmod-fs-ntfs kmod-usb-storage kmod-usb2 kmod-usb-core e2fsprogs lsblk fdisk kmod-usb-ohci kmod-usb-storage-extras kmod-usb-xhci-hcd kmod-usb-xhci-mtk kmod-fs-exfat kmod-usb-ehci luci-i18n-base-zh-cn curl
		!gcc !make python3-pip 
		coreutils coreutils-base64 coreutils-nohup ip-full libuci-lua lua luci-compat luci-lib-jsonc resolveip xray-core v2ray-core v2ray-extra v2ray-geoip v2ray-geosite luci-lua-runtime kmod-nft-socket kmod-nft-tproxy kmod-nft-nat
		bash ca-certificates ipset libcap libcap-bin ruby ruby-yaml kmod-tun kmod-inet-diag unzip luci luci-base
		dnsmasq-full
		samba4-admin samba4-client samba4-libs samba4-server samba4-utils luci-app-samba4 luci-i18n-samba4-zh-cn
		syncthing
		adguardhome
