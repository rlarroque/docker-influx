FROM influxdb:
MAINTAINER Romain Larroque <rom.larroque@gmail.com>

COPY docker-entrypoint.sh /

COPY ./entries/*.influxql ./entries/*.sh ./entries/*.txt /tmp/

CMD ["influxd"]
