FROM resin/armv7hf-debian
MAINTAINER Junpei Kawamoto <kawamoto.junpei@gmail.com>

RUN ["cross-build-start"]
ENV DEBIAN_FRONTEND noninteractive
ENV TERM vt100
RUN apt-get update && \
    apt-get install -y apt-cacher-ng && \
    apt-get upgrade -y && apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/
RUN ["cross-build-end"]

EXPOSE 3142

ADD entrypoint.sh /root
ENTRYPOINT ["bash", "/root/entrypoint.sh"]
