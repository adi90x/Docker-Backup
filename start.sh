#!/bin/sh

tar -czvf save/backup_`date +%Y%m%d_%H%M%S`.tar.gz -C / backup >> tar.log

backup=$(ls -p -t save/backup*.tar.gz | head -1)

: ${PRIV_KEY_NAME=priv.key}

if [ "$TYPE"  = "SCP" ]
 then sshpass -p "$PASS" scp -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no  -i /certs/$PRIV_KEY_NAME save/$backup $DISTANT_HOST_PATH:$BACKUP_PATH/$backup
fi

if [ "$TYPE"  = "FTP" ]
 then  lftp ftp://$DISTANT_HOST_PATH -e "mirror -Re /save $BACKUP_PATH;exit"
fi

#Should be keep to syncro all  and remove only oldest
rm $backup
