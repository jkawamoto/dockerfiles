#
# Dockerfile
#
# Copyright (c) 2016 Junpei Kawamoto
#
# This software is released under the MIT License.
#
# http://opensource.org/licenses/mit-license.php
#
FROM resin/rpi-raspbian:jessie
MAINTAINER Junpei Kawamoto <kawamoto.junpei@gmail.com>

# Install node.js.
RUN apt-get update && apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_4.x | sudo bash - && \
    apt-get install -y build-essential python-dev nodejs npm && \
    apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/

# Install node-ref
RUN npm install -g npm@2.x
RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10
RUN npm install -g --unsafe-perm node-red

# Expose port
EXPOSE 1880

# Startup configuration.
CMD ["node-red-pi", "--max-old-space-size=128"]
