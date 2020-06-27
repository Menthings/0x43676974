#!/bin/bash

sudo adduser --system --shell /bin/bash --group --disabled-password --home /var/lib/gitolite gitolite
sudo -u gitolite ssh-keygen
sudo -u gitolite cat /var/lib/gitolite/.ssh/id_rsa.pub
sudo apt-get install gitolite

gl-setup /var/lib/gitolite/.ssh/id_rsa.pub
git clone gitolite@localhost:gitolite-admin.git

cd gitolite-admin

nano conf/gitolite.conf

git commit -a
git push origin master

sudo apt-get install cgit
sudo a2enmod cgi

echo "scan-path=/var/lib/gitolite/repositories" >> /etc/cgitrc

usermod -aG gitolite http

chmod g+rX /var/lib/gitolite
chmod -R g+rX /var/lib/gitolite/repositories