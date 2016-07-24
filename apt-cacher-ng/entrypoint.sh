#!/bin/bash
if [[ $# = 0 ]]; then

  chmod 777 /var/cache/apt-cacher-ng
  /etc/init.d/apt-cacher-ng start
  tail -f /var/log/apt-cacher-ng/*

else

  exec $@

fi
