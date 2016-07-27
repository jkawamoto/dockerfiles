#!/bin/bash
if [[ $# = 0 ]]; then

  chmod 777 /var/cache/devpi
  devpi-server --serverdir /var/cache/devpi --host 0.0.0.0 --port $PORT

else

  exec $@

fi
