#!/bin/sh
scp -r ~/commo/luci-theme-commotion/files/htdocs/* root@192.168.1.118:/www/luci-static/commotion/
scp ~/commo/luci-theme-commotion/files/templates/* root@192.168.1.118:/usr/lib/lua/luci/view/themes/commotion/
