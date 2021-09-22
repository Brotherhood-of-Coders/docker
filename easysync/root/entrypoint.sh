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
   insist     = true,
   maxProcesses = 1,
}
END

dir=/opt

for host in $(ls -1 ${dir})
do
  for target in $(ls -1 ${dir}/${host})
  do
    echo "sync{default.rsync, source=\"${dir}/${host}/${target}\",target=\"${host}:/opt/easysync/${target}\",rsync={archive=true,compress=false,_extra={\"-e\",\"ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null\"}}}" >> ${config}
  done
done

echo 'Starting lsyncd...';

lsyncd /etc/lsyncd.lua

echo 'Easysync stopped';