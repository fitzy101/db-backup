#!/bin/bash
timenow=$(date +%F_%T)
mysqldump \
 --user=root \
 --password=password \
 --host=127.0.0.1 \
 --port=3306 \
 --debug-info \
 --dump-date \
 --complete-insert \
 --disable-keys \
 --create-options \
 --add-locks \
 --single-transaction \
 --all-databases \
 | gzip > "$timenow.sql.gz"

echo "Backup completed for $timenow."
exit 0