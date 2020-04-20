/etc/init.d/oray_phddns stop
/etc/init.d/oray_phddns disable

if [ -d /etc/config/phddns ]; then
	rm -rf /etc/config/phddns
fi

if [ -d /etc/oray_phddns/ ]; then
	rm -rf /etc/oray_phddns
fi

if [ -f /etc/init.d/oray_phddns ]; then
	rm /etc/init.d/oray_phddns
fi

SHOW=$(grep -r "oray" /usr/lib/lua/luci/view/web/inc/)
if [ ! -z $SHOW ]; then
	sed -i '/oray/'d  /usr/lib/lua/luci/view/web/inc/header.htm
fi


sed -i '/oray/'d  /etc/hosts

echo "uninstall phddns finished"
