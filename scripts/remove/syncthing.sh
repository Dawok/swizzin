#!/bin/bash
MASTER=$(cat /root/.master.info | cut -d: -f1)
systemctl stop syncthing@${MASTER}
apt-get -q -y purge syncthing
rm /etc/systemd/system/syncthing@.service
rm -f  /etc/apache2/sites-enabled/syncthing.conf
service apache2 reload
rm /install/.syncthing.lock
