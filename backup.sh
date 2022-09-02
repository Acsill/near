#!/bin/bash

DATE=$(date +%Y-%m-%d-%H-%M)
DATADIR=/mnt
BACKUPDIR=/mnt/backups/near_${DATE}

mkdir $BACKUPDIR

sudo systemctl stop near-main.service

wait

echo "NEAR node was stopped" | ts

if [ -d "$BACKUPDIR" ]; then
    echo "Backup started" | ts

    cp -rf $DATADIR/mainnet/data/ ${BACKUPDIR}/

    # Submit backup completion status, you can use healthchecks.io, betteruptime.com or other services
    # Example
    # curl -fsS -m 10 --retry 5 -o /dev/null https://hc-ping.com/xXXXxXXx-XxXx-XXXX-XXXx-...

    echo "Backup completed" | ts
else
    echo $BACKUPDIR is not created. Check your permissions.
    exit 0
fi

sudo systemctl start near-main.service

echo "NEAR node was started" | ts
