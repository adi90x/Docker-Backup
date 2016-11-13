#/bin/sh
tar -czf save/backup_`date +%Y%m%d_%H%M%S`.tar.gz -C / backup

backup=$(ls -p -t save/backup*.tar.gz | head -1) 


 if [ -z $PRIV_KEY_NAME ]; then PRIV_KEY_NAME=priv.key ;  fi 

if [ "$TYPE"  = "SCP" ]
 then scp -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no  -i /certs/$PRIV_KEY_NAME  $backup $DISTANT_HOST_PATH:$BACKUP_PATH/$backup
fi

if [ "$TYPE"  = "FTP" ]
 then  lftp ftp://$DISTANT_HOST_PATH -e "mirror -Re /save $BACKUP_PATH;exit"
fi

#Should be keep to syncro all  and remove only oldest
rm $backup
