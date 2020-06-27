#!/bin/bash

sudo -s
adduser --system --shell /bin/bash --group --disabled-password --home /var/lib/gitolite gitolite

sudo -u gitolite ssh-keygen
apt-get install gitolite3

dpkg-reconfigure gitolite3

usermod -g wwwftp gitolite
usermod -g www-data gitolite
 
ssh gitolite@localhost

cd /var/www/

git clone gitolite@localhost:gitolite-admin.git

cd gitolite-admin

git push origin master

exit

chown -R gitolite:www-data /var/lib/gitolite/repositories
nano /etc/gitolite3/gitolite.rc

git clone gitolite@codice-sorgente.it:fb_page_scrape.git