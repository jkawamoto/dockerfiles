#!/bin/bash
#
# entrypoint.sh
#
# Copyright (c) 2015-2017 Junpei Kawamoto
#
# This software is released under the MIT License.
#
# http://opensource.org/licenses/mit-license.php
#
if [[ $# = 0 ]]; then

  chmod 777 /var/cache/apt-cacher-ng
  /etc/init.d/apt-cacher-ng start
  tail -f /var/log/apt-cacher-ng/*

else

  exec $@

fi
