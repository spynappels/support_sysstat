#!/bin/sh

# Puppet Task Name: support_sysstat::snapshot

if [ -e /etc/redhat-release ]; then
  file=$(ls -ltc /var/log/sa/sa[0-3]* | head -1 | cut -d ' ' -f10)
elif [[ $(/usr/bin/lsb_release -si 2> /dev/null) =~ ^(Ubuntu|Debian)$ ]]; then
  file=$(ls -ltc /var/log/sysstat/sa[0-3]* | head -1 | cut -d ' ' -f10)
else
  echo "Unsupported OS"; exit 1
fi

$(/usr/bin/which sar) -A -f $file
