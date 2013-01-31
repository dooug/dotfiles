#!/bin/sh
scp -r ~/Desktop/codez/commotion-openwrt-theme/files/htdocs/* root@192.168.1.118:/www/luci-static/commotion/
scp ~/Desktop/codez/commotion-openwrt-theme/files/templates/* root@192.168.1.118:/usr/lib/lua/luci/view/themes/commotion/
scp ~/Desktop/codez/commotion-openwrt-theme/files/luasrc/view/cbi/* root@192.168.1.118:/usr/lib/lua/luci/view/cbi/
