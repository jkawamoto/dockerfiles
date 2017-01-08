#
# Dockerfile
#
# Copyright (c) 2015-2017 Junpei Kawamoto
#
# This software is released under the MIT License.
#
# http://opensource.org/licenses/mit-license.php
#
FROM colinhuang/ubuntu-novnc-armhf
MAINTAINER Junpei Kawamoto <kawamoto.junpei@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV TERM vt100

# Use a cache serve for apt-get if given.
ARG APT_PROXY
RUN if [ -n "$APT_PROXY" ]; then \
      echo "Set apt proxy: $APT_PROXY"; \
      echo "Acquire::http { Proxy \"$APT_PROXY\"; };" >> /etc/apt/apt.conf.d/01proxy; \
    fi

RUN apt-get update && \
    apt-get install -y apt-cacher-ng && \
    apt-get upgrade -y && apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/

EXPOSE 3142
VOLUME /var/cache/apt-cacher-ng

ADD entrypoint.sh /root
ENTRYPOINT ["bash", "/root/entrypoint.sh"]
