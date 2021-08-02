#!/bin/bash

function load_config {
  file="/config/"$1
  if [ -f "$file" ]; then
    /usr/sbin/postmap $file
    chown root:root $file $file.db
    chmod 600 $file $file.db
  fi
}

load_config relay_by_sender
load_config sasl_passwd

/usr/sbin/postfix start-fg
