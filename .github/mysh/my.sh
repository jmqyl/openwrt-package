#!/bin/bash
function git_clone() {
  git clone --depth 1 $1 $2 || true
 }
function git_sparse_clone() {
  branch="$1" rurl="$2" localdir="$3" && shift 3
  git clone -b $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
  cd $localdir
  git sparse-checkout init --cone
  git sparse-checkout set $@
  mv -n $@ ../
  cd ..
  rm -rf $localdir
  }
function mvdir() {
mv -n `find $1/* -maxdepth 0 -type d` ./
rm -rf $1
}

###########自定义部分##################
git_sparse_clone master "https://github.com/Hyy2001X/AutoBuild-Packages" "Hyy2001X" luci-app-npc
rm -rf luci-app-filebrowser filebrowser
git_sparse_clone master "https://github.com/Lienol/openwrt-package" "Lienol" luci-app-filebrowser
git clone --depth 1 https://github.com/Leo-Jo-My/luci-theme-opentomcat
git clone --depth 1 https://github.com/Leo-Jo-My/luci-theme-opentomato
rm -rf luci-app-wechatpush
git clone -b openwrt-18.06 https://github.com/tty228/luci-app-wechatpush luci-app-serverchan


#kenzok8/wall(将kenzok8自建常用的内核更改为breakings/OpenWrt/blob/main/diy-part2.sh中的源，只添加breakings中有的源)
git_sparse_clone master "https://github.com/xiaorouji/openwrt-passwall-packages" "xiaorouji" chinadns-ng dns2socks hysteria ipt2socks \
microsocks pdnsd-alt shadowsocks-rust simple-obfs sing-box ssocks tcping trojan-go trojan-plus trojan v2ray-core v2ray-plugin

git_sparse_clone master "https:https://github.com/fw876/helloworld" "fw876" dns2tcp lua-neturl redsocks2 shadowsocksr-libev v2ray-geodata

rm -rf brook dockerd gost naiveproxy smartdns xray-core xray-plugin
git_sparse_clone master "https://github.com/breakings/OpenWrt" "breakings" general/brook general/dockerd general/gost general/naiveproxy \
general/smartdns general/xray-core general/xray-plugin

#git_sparse_clone master "https://github.com/Boos4721/OpenWrt-Packages" "Boos4721" adbyby
#git clone --depth 1 https://github.com/aboutboy/luci-theme-butongwifi
#git_sparse_clone master "https://github.com/Aslin-Ameng/luci-theme-Night" "Aslin-Ameng" luci-theme-Night
#git clone --depth 1 https://github.com/gngpp/luci-theme-design
#git clone --depth 1 https://github.com/gngpp/luci-app-design-config
#git_sparse_clone master "https://github.com/kiddin9/openwrt-packages" "kiddin9" luci-app-bypass
#git clone --depth 1 https://github.com/jerrykuku/lua-maxminddb
#git clone --depth 1 https://github.com/immortalwrt/homeproxy
#git_sparse_clone master "https://github.com/coolsnowwolf/luci" "coolsnowwolf" applications/luci-app-accesscontrol
git clone --depth 1 https://github.com/gngpp/luci-app-watchcat-plus

# 修改nps源为yisier
sed -i 's/PKG_SOURCE_URL:=.*/PKG_SOURCE_URL:=https:\/\/codeload.github.com\/yisier\/nps\/tar.gz\/v$(PKG_VERSION)?/g' nps/Makefile
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=0.26.16.1/g' nps/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=2fb8a19d2bd34d6a009f14d1c797169f09801eb814f57ebf10156ffdb78f2457/g' nps/Makefile

#luci-app-nps（修改nps显示位置）
sed -i 's/"services"/"vpn"/g'  nps/luasrc/controller/nps.lua
sed -i 's/\[services\]/\[vpn\]/g'  nps/luasrc/view/nps/nps_status.htm

sed -i 's/"services"/"vpn"/g'  luci-app-npc/luasrc/controller/npc.lua
sed -i 's/\[services\]/\[vpn\]/g' luci-app-npc/luasrc/view/npc/npc_status.htm

#修改luci-app-autotimeset显示位置
sed -i 's/"control"/"system"/g'  luci-app-autotimeset/luasrc/controller/autotimeset.lua
sed -i 's/\[control\]/\[system\]/g'  luci-app-autotimeset/luasrc/view/autotimeset/log.htm

#删除UPX
rm -rf upx
rm -rf upx-static
######################################

exit 0
