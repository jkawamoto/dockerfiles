MongoDB with authentication
============================
This image simply extends dockerfile/mongodb to enable authentication
and add an admin user if he/she does not exist.

Install
-------

```sh
$ docker pull jkawamoto/mongo
```

Usage
------

```sh
$ docker run -d --name mongo -e PASSWORD=<password> jkawamoto/mongo
```

License
--------
This software is released under the MIT License, see LICENSE.
