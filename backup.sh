#!/bin/sh

tar -czvf /save/backup_`date +%Y%m%d_%H%M%S`.tar.gz -C / backup >> /dev/null

backup=$(basename $(ls -p -t /save/backup*.tar.gz | head -1))

: ${PRIV_KEY_NAME=priv.key}
: ${KEEP=1}

if [ "$TYPE"  = "SCP" ] 
then 
sshpass -p "$PASS" scp -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no  -i /certs/$PRIV_KEY_NAME /save/$backup $DISTANT_HOST_PATH:$BACKUP_PATH/$backup
sshpass -p "$PASS" ssh -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no  -i /certs/$PRIV_KEY_NAME  $DISTANT_HOST_PATH "ls -1trpd $BACKUP_PATH/* | head -n -$KEEP | xargs rm -f --"
fi

if [ "$TYPE"  = "FTP" ] 
then 
lftp ftp://$DISTANT_HOST_PATH -e "mirror -Re /save $BACKUP_PATH/;exit"
fi

#Should be keep to syncro all and remove only oldest
ls -1trpd /save/* | head -n -$KEEP | xargs rm -f --
