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



# 增加chinadns-ng
git clone https://github.com/NagaseKouichi/openwrt-chinadns-ng.git package/chinadns-ng
git clone -b luci https://github.com/NagaseKouichi/openwrt-chinadns-ng.git package/luci-app-chinadns-ng

# 增加dns-forwarder
git clone https://github.com/aa65535/openwrt-dns-forwarder.git package/dns-forwarder
git clone https://github.com/NagaseKouichi/luci-app-dns-forwarder.git package/luci-app-dns-forwarder

# 增加hysteria
#git clone https://NagaseKouichi:SECRET_PASSWORD@github.com/NagaseKouichi/hysteria-openwrt.git package/hysteria
#git clone https://NagaseKouichi:SECRET_PASSWORD@github.com/NagaseKouichi/luci-app-hysteria.git package/luci-app-hysteria

# 增加mosdns-cn
git clone https://NagaseKouichi:SECRET_PASSWORD@github.com/NagaseKouichi/mosdns-cn-openwrt.git package/mosdns-cn
git clone https://NagaseKouichi:SECRET_PASSWORD@github.com/NagaseKouichi/luci-app-mosdns-cn.git package/luci-app-mosdns-cn

# 增加dnsproxy
pushd feeds/packages/net
rm -fr dnsproxy && git clone https://github.com/NagaseKouichi/dnsproxy-openwrt.git dnsproxy
popd
git clone https://github.com/NagaseKouichi/luci-app-dnsproxy.git package/luci-app-dnsproxy

# 增加DirtyDNS
#git clone https://github.com/NagaseKouichi/luci-app-dirtydns.git package/luci-app-dirtydns

# 增加luci-app-stubby
git clone https://NagaseKouichi:SECRET_PASSWORD@github.com/NagaseKouichi/luci-app-stubby.git package/luci-app-stubby

# 添加网络唤醒++
pushd package
svn co https://github.com/sundaqiang/openwrt-packages/trunk/luci-app-wolplus
popd

# 添加uugamebooster
pushd feeds/packages/net
svn co https://github.com/coolsnowwolf/packages/trunk/net/uugamebooster
popd
pushd extra/luci/applications
svn co https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-uugamebooster
popd
