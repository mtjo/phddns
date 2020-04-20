#!/bin/ash
/etc/init.d/oray_phddns start>>aa.log
echo $model>>aa.log

while :
do
wget --help >> aa.log;
done