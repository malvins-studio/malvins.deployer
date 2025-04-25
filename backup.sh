#!/bin/bash
TIMESTAMP=$(date +"%F")
BACKUP_DIR="/home/youruser/backups"
PGPASSWORD="yourpass" pg_dump -U youruser -h localhost yourdb > $BACKUP_DIR/db_$TIMESTAMP.sql
tar -czf $BACKUP_DIR/db_$TIMESTAMP.tar.gz $BACKUP_DIR/db_$TIMESTAMP.sql
rclone copy $BACKUP_DIR/db_$TIMESTAMP.tar.gz remote:your-backups
rm $BACKUP_DIR/db_$TIMESTAMP.*
