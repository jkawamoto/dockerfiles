# Dockerfile for a customized fluentd.
#
# - Server (Hub) mode.
#  - Required:
#    - link to a MongoDB container as mongo.
#    - set environment USER and PASSWORD.
#
# - Client mode.
#  - Required:
#    - link to a server/ambassador container as fluentd.
#    - mount /var/lib/docker/containers to the same path.
#    - set environment HOSTNAME.
#
FROM kiyoto/docker-fluentd
MAINTAINER Junpei Kawamoto <kawamoto.junpei@gmail.com>

RUN ["fluent-gem", "install", "fluent-plugin-mongo"]
RUN ["gem", "install", "bson_ext"]

WORKDIR /root
ADD entrypoint.sh /root/

EXPOSE 24224
ENTRYPOINT ["./entrypoint.sh"]

