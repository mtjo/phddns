#!/bin/ash
model=$(cat /proc/xiaoqiang/model)
if [ ! -d "/var/log/phddns" ]; then
	mkdir /var/log/phddns
fi

chmod -R 666 /var/log/phddns /var/log/phddns /tmp

if [ ! -z "$(pidof oraysl)" ]; then
	kill -15 $(pidof oraysl) > /dev/null 2>&1
fi

/etc/oray_phddns/oraysl -a 127.0.0.1 -p 16062 -s phsle01.oray.net:6061 -l /var/log/phddns -L oraysl -f /etc/config/phddns -t /etc/config/phddns/init.status -i /tmp/oraysl.pid -u /tmp/oraysl.status -S /etc/config/phddns -d > /dev/null 2>&1

/etc/oray_phddns/oraynewph -s 0.0.0.0 -c /var/log/phddns/core.log -p /var/log/phddns -l oraynewph -f /etc/config/phddns -t /etc/config/phddns/init.status -i /tmp/oraynewph.pid -u /tmp/oraynewph.status -x -d > /dev/null 2>&1 

sleep 1

/etc/config/phddns/phdaemon &

while :
do
date >> aa.log
sleep 3;
done