# Dockerized environment for influxdb database

### How to use

Simply execute the 'rebuild' script. It will make sure that no previous container is running and will rebuild the docker image.

When the container is being built, the entries you want to insert into the databse and the 'docker-entrypoint' script will be copied in the container /tmp folder.

Finally after image building done the entries will be imported as influx data.

For more information about how to import data into influx see the documentation [here](https://docs.influxdata.com/influxdb/v1.2/tools/shell/).

The database will then be available on port 8087 (different from default influxdb port, letting you keep your own influxdb running on your machine). You'll be able to connect to the dockerized db by using your own influx client as following:
``` influx -port=8087 ```
