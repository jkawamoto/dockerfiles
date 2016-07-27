# devpi server for ARM.
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
[![Dockerhub](https://img.shields.io/badge/dockerhub-jkawamoto%2Farmhf--devpi--server-blue.svg)](https://hub.docker.com/r/jkawamoto/armhf-devpi-server/)

Docker image of [devpi server](http://doc.devpi.net/latest/) for ARM computer.

## Installation
```sh
docker pull jkawamoto/armhf-devpi-server
```

## Usage
Start devpi server by running,
```sh
docker run -d -p 3141:3141 jkawamoto/armhf-devpi-server
```

then, set the proxy address in pip configuration file `~/.pip/pip.conf`,

```pip.conf
[global]
index-url=http://xxx.xxx.xxx.xxx:3141/root/pypi
trusted-host=xxx.xxx.xxx.xxx
```

where `xxx.xxx.xxx.xxx` is the host IP address
where `armhf-devpi-server` is running.

Use `pip` command. It will use the devpi server.
