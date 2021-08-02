#!/bin/bash

apt update && apt upgrade
apt install -y apt-utils ca-certificates

apt install -y mailutils libsasl2-modules
apt install -y nano bsd-mailx

debconf-set-selections <<< "postfix postfix/mailname string postfix-relay.local"
debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet with smarthost'"
apt install --assume-yes postfix

echo 'nameserver 8.8.8.8' >> /var/spool/postfix/etc/resolv.conf
chmod 755 /var/spool/postfix/etc/resolv.conf

rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /tmp/*
