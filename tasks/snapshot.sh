#!/bin/sh

# Puppet Task Name: support_sysstat::snapshot

if [ -e /etc/redhat-release ]; then
  file=$(ls -ltc /var/log/sa/sa[0-3]* | head -1 | cut -d ' ' -f10)
elif [[ $(/usr/bin/lsb_release -si 2> /dev/null) =~ ^(Ubuntu|Debian)$ ]]; then
  file=$(ls -ltc /var/log/sysstat/sa[0-3]* | head -1 | cut -d ' ' -f10)
else
  echo "Unsupported OS"; exit 1
fi
options=''

if test "$PT_start"; then
  options=$options" -s "$PT_start
fi

if test "$PT_end"; then
  options=$options" -e "$PT_end
fi

$(/usr/bin/which sar) $options -A -f $file
