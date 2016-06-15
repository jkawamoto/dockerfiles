# Octave with SDPT3

Octave image with [SDPT3](https://github.com/sqlp/sdpt3) package.

## Usage

```
$ docker run --rm -it -v $(pwd):/data jkawamoto/octave-sdpt3 octave [options]
```

Every time, it loads SDPT3 package. The original working directory is `/data`,
thus you need to mount your scripts there.
