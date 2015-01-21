#
# MongoDB with authentication.
#
# Usage:
#   - Set environment variables to run;
#     - USER (default: admin)
#     - PASSWORD (defaule: password)
#
FROM dockerfile/mongodb
MAINTAINER Junpei Kawamoto <kawamoto.junpei@gmail.com>

WORKDIR /root
ADD entrypoint.sh /root/

ENV USER admin
ENV PASSWORD password

CMD ["./entrypoint.sh"]