#!/bin/bash

cd /vagrant
[ -f OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64.tar.bz2 ] || wget http://downloads.openwrt.org/barrier_breaker/14.07-rc3/ar71xx/generic/OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64.tar.bz2

cd
tar xvfj /vagrant/OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64.tar.bz2

cd OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64

rm -rf files ; mkdir files

ssh root@192.168.16.1 'tar cf - `opkg list-changed-conffiles`' | (cd files ; tar xvf -)
