# Vagrant TileMill

TileMill Server on Ubuntu 16.04

![](https://www.evernote.com/l/ABWtQwn_tP1Fv5c7ZHEgYLrFgcvySIFdR4IB/image.png)

## What's Installed

* Ubuntu 16.04 LTS
* Mapnik 3.0.x
* PostgreSQL 9.5.x
  * PostGIS 2.2
* osm2pgsql 0.88.x
* node 6.x
  * carto 0.17.x
  * pm2 2.4.x
  * cartocc
* openstreetmap-carto 3.1.0

### Requires

* Vagrant
* VirtualBox
* 2GB+ Memory

## Getting Started

```
$ git clone git@github.com:miya0001/vagrant-tilemill.git
$ cd vagrant-tilemill
$ vagrant up
```

Please wait 20 minutes or so. :smile:

* Tile Server: http://192.168.33.10/map/0/0/0.png
* Kosmtik: http://192.168.33.10:20009/

###  PostgreSQL Database Account

* User: vagrant
* Password: vagrant

## Automated Testing

Run following after `vagrant up`.

```
$ bundle install --path vendor/bundle
$ bundle exec rake spec
```

## Other Notes

* Default data in the `provision/default.osm` contains only my hometown in Japan. :smile:
* If you want to restart kosmtik, execute `pm2 restart kosmtik`.

## License

MIT
