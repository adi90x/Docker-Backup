#!/bin/sh

rm /etc/crontabs/root
: ${CRON="0 0 * * *"}
(crontab -l 2>/dev/null; echo "$CRON /backup.sh") | crontab -
crond -l 2 -f
