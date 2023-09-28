#!/bin/bash

###########自定义部分##################
svn export https://github.com/Hyy2001X/AutoBuild-Packages/trunk/luci-app-npc
rm -rf luci-app-filebrowser
rm -rf filebrowser
svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-filebrowser
git clone --depth 1 https://github.com/Leo-Jo-My/luci-theme-opentomcat
git clone --depth 1 https://github.com/Leo-Jo-My/luci-theme-opentomato
rm -rf luci-app-wechatpush
git clone -b openwrt-18.06 https://github.com/tty228/luci-app-wechatpush luci-app-serverchan


#kenzok8/wall(将kenzok8自建常用的内核更改为breakings/OpenWrt/blob/main/diy-part2.sh中的源，只添加breakings中有的源)
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/chinadns-ng
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/dns2socks
svn co https://github.com/fw876/helloworld/trunk/dns2tcp
rm -rf brook
svn export https://github.com/breakings/OpenWrt/trunk/general/brook
rm -rf 
svn export https://github.com/breakings/OpenWrt/trunk/general/dockerd
svn export https://github.com/breakings/OpenWrt/trunk/general/gost
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/hysteria
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/ipt2socks
svn co https://github.com/fw876/helloworld/trunk/lua-neturl
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/microsocks
svn export https://github.com/breakings/OpenWrt/trunk/general/naiveproxy
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/pdnsd-alt
svn co https://github.com/fw876/helloworld/trunk/redsocks2
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/shadowsocks-rust
svn co https://github.com/fw876/helloworld/trunk/shadowsocksr-libev
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/simple-obfs
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/sing-box
svn export https://github.com/breakings/OpenWrt/trunk/general/smartdns
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/ssocks
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/tcping
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/trojan-go
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/trojan-plus
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/trojan
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/v2ray-core
svn co https://github.com/fw876/helloworld/trunk/v2ray-geodata
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/v2ray-plugin
svn export https://github.com/breakings/OpenWrt/trunk/general/xray-core
svn export https://github.com/breakings/OpenWrt/trunk/general/xray-plugin

#svn export https://github.com/Boos4721/OpenWrt-Packages/trunk/adbyby
#git clone --depth 1 https://github.com/aboutboy/luci-theme-butongwifi
#svn export https://github.com/Aslin-Ameng/luci-theme-Night/trunk/luci-theme-Night
#git clone --depth 1 https://github.com/gngpp/luci-theme-design
#git clone --depth 1 https://github.com/gngpp/luci-app-design-config
#svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-bypass
#git clone --depth 1 https://github.com/jerrykuku/lua-maxminddb
#git clone --depth 1 https://github.com/immortalwrt/homeproxy
#svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-accesscontrol

# 修改nps源为yisier
sed -i 's/PKG_SOURCE_URL:=.*/PKG_SOURCE_URL:=https:\/\/codeload.github.com\/yisier\/nps\/tar.gz\/v$(PKG_VERSION)?/g' nps/Makefile
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=0.26.16.1/g' nps/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=2fb8a19d2bd34d6a009f14d1c797169f09801eb814f57ebf10156ffdb78f2457/g' nps/Makefile

#luci-app-nps（修改nps显示位置）
sed -i 's/"services"/"vpn"/g'  nps/luasrc/controller/nps.lua
sed -i 's/\[services\]/\[vpn\]/g'  nps/luasrc/view/nps/nps_status.htm

sed -i 's/"services"/"vpn"/g'  luci-app-npc/luasrc/controller/npc.lua
sed -i 's/\[services\]/\[vpn\]/g' luci-app-npc/luasrc/view/npc/npc_status.htm

#删除UPX
rm -rf upx
rm -rf upx-static
######################################

exit 0
