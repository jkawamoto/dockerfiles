FROM ubuntu:latest
MAINTAINER Junpei Kawamoto <kawamoto.junpei@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV TERM vt100
RUN apt-get update && \
    apt-get install -y apt-cacher-ng && \
    apt-get upgrade -y && apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/

EXPOSE 3142

ADD entrypoint.sh /root
ENTRYPOINT ["bash", "/root/entrypoint.sh"]
