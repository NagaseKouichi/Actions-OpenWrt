#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# 版本号里显示一个自己的名字
sed -i "s/OpenWrt /NagaseKouichi build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

#添加server酱
git clone https://github.com/tty228/luci-app-serverchan.git package/lean/luci-app-serverchan

# 增加关机功能
git clone https://github.com/esirplayground/luci-app-poweroff.git package/lean/luci-app-poweroff

# 增加Smartdns
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# 获取luci-app-passwall以及缺失的依赖
# pushd package/lean
# svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall
# svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ssocks
# svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go
# svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-plus
# svn co https://github.com/xiaorouji/openwrt-passwall/trunk/brook
# svn co https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng
# popd

# 增加chinadns
#git clone https://github.com/aa65535/openwrt-chinadns.git package/chinadns
#git clone https://github.com/aa65535/openwrt-dist-luci.git package/openwrt-dist-luci

# 增加chinadns-ng
git clone https://github.com/NagaseKouichi/openwrt-chinadns-ng.git package/chinadns-ng
git clone -b luci https://github.com/NagaseKouichi/openwrt-chinadns-ng.git package/luci-app-chinadns-ng

# 增加dns-forwarder
git clone https://github.com/aa65535/openwrt-dns-forwarder.git package/dns-forwarder
git clone https://github.com/NagaseKouichi/luci-app-dns-forwarder.git package/luci-app-dns-forwarder

# 增加hysteria
git clone https://NagaseKouichi:SECRET_PASSWORD@github.com/NagaseKouichi/hysteria-openwrt.git package/hysteria
git clone https://NagaseKouichi:SECRET_PASSWORD@github.com/NagaseKouichi/luci-app-hysteria.git package/luci-app-hysteria

# 增加mosdns-cn
git clone https://NagaseKouichi:SECRET_PASSWORD@github.com/NagaseKouichi/mosdns-cn-openwrt.git package/mosdns-cn
git clone https://NagaseKouichi:SECRET_PASSWORD@github.com/NagaseKouichi/luci-app-mosdns-cn.git package/luci-app-mosdns-cn

# 增加dnsproxy
pushd feeds/packages/net
rm -fr dnsproxy && git clone https://github.com/NagaseKouichi/dnsproxy-openwrt.git dnsproxy
popd
git clone https://github.com/NagaseKouichi/luci-app-dnsproxy.git package/luci-app-dnsproxy

# 增加DirtyDNS
git clone https://github.com/NagaseKouichi/luci-app-dirtydns.git package/luci-app-dirtydns

# 替换overture
pushd feeds/packages/net
rm -fr overture && git clone https://github.com/NagaseKouichi/overture-openwrt.git overture
popd
git clone https://NagaseKouichi:SECRET_PASSWORD@github.com/NagaseKouichi/luci-app-overture.git package/luci-app-overture

# 增加luci-app-stubby
git clone https://NagaseKouichi:SECRET_PASSWORD@github.com/NagaseKouichi/luci-app-stubby.git package/luci-app-stubby

# 添加网络唤醒++
pushd package
svn co https://github.com/sundaqiang/openwrt-packages/trunk/luci-app-wolplus
popd

# 使用openwrt官方新版luci-app-https-dns-proxy
pushd feeds/luci/applications
rm -fr luci-app-https-dns-proxy && svn co https://github.com/openwrt/luci/trunk/applications/luci-app-https-dns-proxy
popd

# 添加mosdns
#pushd feeds/packages/net
#rm -fr mosdns && svn co https://github.com/dogbutcat/openwrt-packages/trunk/mosdns
#popd
#pushd package
#svn co https://github.com/dogbutcat/openwrt-packages/trunk/luci-app-mosdns
#popd
