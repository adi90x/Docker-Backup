#!/bin/sh

tar -czvf backup_`date +%Y%m%d_%H%M%S`.tar.gz -C / backup >> tar.log

backup=$(ls -p -t backup*.tar.gz | head -1)

: ${PRIV_KEY_NAME=priv.key}

sshpass -p "$PASS" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $backup $DISTANT_HOST_PATH/$backup

rm $backup