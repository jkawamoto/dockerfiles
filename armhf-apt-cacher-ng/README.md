# apt-cacher-ng server for ARM.
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
[![Dockerhub](https://img.shields.io/badge/dockerhub-jkawamoto%2Farmhf--apt--cacher--ng-blue.svg)](https://hub.docker.com/r/jkawamoto/armhf-apt-cacher-ng/)
[![Image information](https://images.microbadger.com/badges/image/jkawamoto/armhf-apt-cacher-ng.svg)](http://microbadger.com/images/jkawamoto/armhf-apt-cacher-ng)
[![Japanese](https://img.shields.io/badge/qiita-%E6%97%A5%E6%9C%AC%E8%AA%9E-brightgreen.svg)](http://qiita.com/jkawamoto/items/fe0f098642b95e60a7c2)

Docker image of [Apt-Cacher NG](https://www.unix-ag.uni-kl.de/~bloch/acng/)
for ARM computer.

## Installation
```sh
docker pull jkawamoto/armhf-apt-cacher-ng
```

## Usage
Start apt-cacher-ng by running,
```sh
docker run -d -p 3142:3142 jkawamoto/armhf-apt-cacher-ng
```

then, set the proxy address apt's configuration file by running,

```sh
echo "Acquire::http { Proxy \"http://xxx.xxx.xxx.xxx:3142\"; };" >>  /etc/apt/apt.conf.d/01proxy;
```
where `xxx.xxx.xxx.xxx` is the host IP address
where `armhf-apt-cacher-ng` is running.

Use apt-get command. It will be routed to the cacher server.
