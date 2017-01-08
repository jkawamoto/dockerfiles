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
ENV PORT 3141

VOLUME ["/var/cache/devpi"]

# Use a cache serve for apt-get and pip if given.
ARG APT_PROXY
RUN if [ -n "$APT_PROXY" ]; then \
      echo "Set apt proxy: $APT_PROXY"; \
      echo "Acquire::http { Proxy \"$APT_PROXY\"; };" >> /etc/apt/apt.conf.d/01proxy; \
    fi

ARG PIP_PROXY
RUN if [ -n "$PIP_PROXY" ]; then \
      echo "Set pip proxy: $PIP_PROXY"; \
      IPPORT=${PIP_PROXY#*//}; \
      mkdir -p ~/.pip/; \
      echo "[global]\nindex-url=$PIP_PROXY/root/pypi\ntrusted-host=${IPPORT%:*}" >> ~/.pip/pip.conf; \
      cat ~/.pip/pip.conf; \
    fi

RUN apt-get update && \
    apt-get install -y --no-install-recommends python3-pip && \
    apt-get upgrade -y && apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/
RUN pip3 install -q -U pip devpi-server

EXPOSE 3141
VOLUME /var/cache/devpi

ADD entrypoint.sh /root
ENTRYPOINT ["bash", "/root/entrypoint.sh"]
