#!/usr/bin/env sh

echo 'Starting easysync...';

mkdir -p /var/log/lsyncd

config=/etc/lsyncd.lua

echo 'Building lsyncd config...';

cat <<END > ${config}
settings{
   logfile  	= "/var/log/lsyncd/lsyncd.log",
   statusFile = "/var/log/lsyncd/lsyncd.status",
   nodaemon 	= true,
   maxDelays	= 100,
   maxProcesses = 1,
}
END

dir=/opt

for host in $(ls -1 ${dir})
do
  for target in $(ls -1 ${dir}/${host})
  do
    echo "sync{default.rsyncssh, source=\"${dir}/${host}/${target}\",host=\"${host}\",targetdir=\"${target}\",rsync={_extra={\"-a\"}}}" >> ${config}
  done
done

echo 'Starting lsyncd...';

lsyncd /etc/lsyncd.lua

echo 'Easysync stopped';