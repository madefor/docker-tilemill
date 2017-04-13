# Docker TileMill

TileMill Server on Ubuntu 16.04

![](https://www.evernote.com/l/ABXsEI6imwlOXrnOYxrPW4eTANUO6XnETu0B/image.png)

## What's Installed

* Ubuntu 16.04 LTS
* Mapnik 3.0.x
* PostgreSQL 9.5.x
  * PostGIS 2.2
* osm2pgsql 0.88.x
* node 6.x
  * carto 0.17.x
  * pm2 2.4.x
  * TileMill (GitHub)
* openstreetmap-carto 3.1.0

### Requires

* Docker

## Getting Started

Build a container.

```
$ git clone git@github.com:miya0001/docker-tilemill.git
$ bash bin/build-docker.sh
```

Run container.

```
$ bash bin/run-docker.sh
```

Then visit http://127.0.0.1:20009/

### How to cutomize database

Replace `provision/default.osm` to your data.

###  PostgreSQL Database Account

* User: vagrant
* Password: vagrant

## License

MIT
