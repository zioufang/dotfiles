#!/usr/bin/env sh
mkdir -p /media/backup 2>/dev/null
mount /dev/sda5 /media/backup 2>/dev/null
rsync -aAXv --delete --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / /media/backup
