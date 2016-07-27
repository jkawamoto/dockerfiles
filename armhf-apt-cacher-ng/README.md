# apt-cacher-ng server for ARM.
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
[![Dockerhub](https://img.shields.io/badge/dockerhub-jkawamoto%2Farmhf--apt--cacher--ng-blue.svg)](https://hub.docker.com/r/jkawamoto/armhf-apt-cacher-ng/)

## Installation
```sh
docker pull jkawamoto/armhf-apt-cacher-ng
```

## Usage
Start apt-cacher-ng by running,
```sh
docker run -d 3142:3142 jkawamoto/armhf-apt-cacher-ng
```

then, set the proxy address apt's configuration file by running,

```sh
echo "Acquire::http { Proxy \"http://xxx.xxx.xxx.xxx:3142\"; };" >>  /etc/apt/apt.conf.d/01proxy;
```
where `xxx.xxx.xxx.xxx` is the host IP address
where armhf-apt-cacher-ng is running.
