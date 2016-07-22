# Octave with SDPT3
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
[![Dockerhub](https://img.shields.io/badge/dockerhub-jkawamoto%2Foctave--sdpt3-blue.svg)](https://hub.docker.com/r/jkawamoto/octave-sdpt3/)

Octave image with [SDPT3](https://github.com/sqlp/sdpt3) package.

## Usage

```
$ docker run --rm -it -v $(pwd):/data jkawamoto/octave-sdpt3 octave [options]
```

Every time, it loads SDPT3 package. The original working directory is `/data`,
thus you need to mount your scripts there.

License
========
This software is released under the MIT License, see [LICENSE](LICENSE).
