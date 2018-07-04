#!/bin/sh

# Puppet Task Name: support_sysstat::filtered_snapshot

if [ -e /etc/redhat-release ]; then
  file=$(ls -ltc /var/log/sa/sa[0-3]* | head -1 | cut -d ' ' -f10)
elif [[ $(/usr/bin/lsb_release -si 2> /dev/null) =~ ^(Ubuntu|Debian)$ ]]; then
  file=$(ls -ltc /var/log/sysstat/sa[0-3]* | head -1 | cut -d ' ' -f10)
else
  echo "Unsupported OS"; exit 1
fi
options=''

if test "$PT_block" = true; then
  options=$options" -d"
fi

if test "$PT_network" = true; then
  options=$options" -n DEV,EDEV,SOCK,IP,TCP"
fi

if test "$PT_processors" = true; then
  options=$options" -P ALL"
fi

if test "$PT_memory" = true; then
  options=$options" -r"
fi

if test "$PT_swap" = true; then
  options=$options" -S"
fi

if test "$PT_tables" = true; then
  options=$options" -v"
fi

echo $options

$(/usr/bin/which sar) $options -f $file
