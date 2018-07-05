#!/bin/sh

# Puppet Task Name: support_sysstat::freeform_parse


if [ -e /etc/redhat-release ]; then
  file="/var/log/sa/sa"$PT_day
elif [[ $(/usr/bin/lsb_release -si 2> /dev/null) =~ ^(Ubuntu|Debian)$ ]]; then
  file="/var/log/sysstat/sa"$PT_day
else
  echo "Unsupported OS"; exit 1
fi
options=''

if test "$PT_all" = true; then
  options=$options" -A"
fi

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

if test "$PT_start"; then
  options=$options" -s "$PT_start
fi

if test "$PT_end"; then
  options=$options" -e "$PT_end
fi

if [[ ! -e "$file" ]]; then
  echo "There is no file sa"$PT_day". Please check your input."
  exit 1
fi

echo "Options selected were "$options

$(/usr/bin/which sar) $options -f $file
