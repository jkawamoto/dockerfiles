Fluentd storing logs to MongoDB
================================

This image extends kiyoto/docker-fluentd and it has two modes;
server and client.

Server or hub mode aggregates logs from client mode containers
and store logs to MongoDB.
Client mode gathers containers logs from
`/var/lib/docker/containers`.

Install
--------
```sh
$ docker pull jkawamoto/fluentd
```

Usage
-----

### Server mode
This mode requires
  - linking to a MongoDB container as `mongo`,
  - setting environment variables `USER` and `PASSWORD`
    which are auth information of MongoDB.

```sh
$ docker run -d --name fluentd-server --link <mongodb>:mongo \
             -e USER=<user> -e PASSWORD=<password> \
             jkawamoto/fluentd server
```

### Client mode
This mode requires
  - linking to a server/ambassador container as `fluentd`,
  - mounting `/var/lib/docker/containers` to the same path,
  - setting environment variable `HOSTNAME`.

```sh
$ docker run -d --name fluentd-client --link fluentd-server:fluentd \
             -v /var/lib/docker/containers:/var/lib/docker/containers \
             -e HOSTNAME=<some identifier> \
             jkawamoto/fluentd client
```

It also takes environment variable `PORT`.
You can specify server's listing port with this variable.

License
--------
This software is released under the MIT License, see LICENSE.
