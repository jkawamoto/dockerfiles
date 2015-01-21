#!/bin/bash
#
# entrypoint.sh
#
# Copyright (c) 2015 Junpei Kawamoto
#
# This software is released under the MIT License.
#
# http://opensource.org/licenses/mit-license.php
#
case "$1" in

	server)

		ADDR=${MONGO_PORT#*//}
		HOST=${ADDR%:*}
		PORT=${ADDR#*:}

		cat <<EOF > fluent.conf
<source>
  type forward
  port 24224
  bind 0.0.0.0
</source>

<match mongo.**>
  type mongo
  host $HOST
  port $PORT

  database fluentd
  collection misc

  tag_mapped
  remove_tag_prefix mongo.

  # for capped collection
  capped
  capped_size 1024m

  # authentication
  user $USER
  password $PASSWORD

  # flush
  flush_interval 10s
</match>
EOF
		;;

	client)

		ADDR=${FLUENTD_PORT#*//}
		HOST=${ADDR%:*}
		PORT=${ADDR#*:}

		cat <<EOF > fluent.conf
<source>
  type tail
  path /var/lib/docker/containers/*/*-json.log
  pos_file /var/log/fluentd-docker.pos
  time_format %Y-%m-%dT%H:%M:%S 
  tag docker.*
  format json
</source>

<match docker.var.lib.docker.containers.*.*.log>
  type record_reformer
  tag mongo.$HOSTNAME.\${tag_parts[5]}
  <record>
    container_id \${tag_parts[5]}
  </record>
</match>

<match mongo.**>
  type forward

  <server>
    name $FLUENTD_PORT
    host $HOST
    port $PORT
  </server>

  heartbeat_type tcp
  heartbeat_interval 10
</match>
EOF
		;;

esac

exec /usr/local/bin/fluentd -c fluent.conf
