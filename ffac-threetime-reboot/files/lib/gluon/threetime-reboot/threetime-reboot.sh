#!/bin/sh
logger -s -t "ffac-threetime-reboot" -p 5 "scheduled reboot in 5 seconds"
sleep 5
# Autoupdate?
upgrade_started='/tmp/autoupdate.lock'
if [ -f $upgrade_started ] ; then
  logger -s -t "ffac-threetime-reboot" -p 5 "Autoupdate running! Aborting"
  exit 2
 fi
reboot
