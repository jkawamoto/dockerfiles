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

  chmod 777 /var/cache/devpi
  devpi-server --serverdir /var/cache/devpi --host 0.0.0.0 --port $PORT

else

  exec $@

fi
