#/bin/sh
tar -czf backup_`date +%Y%m%d_%H%M%S`.tar.gz -C / backup

backup=$(ls -p -t backup*.tar.gz | head -1) 

 if [ -z $PRIV_KEY_NAME ]; then PRIV_KEY_NAME=priv.key ;  fi 

scp -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no  -i /certs/$PRIV_KEY_NAME  $backup $DISTANT_HOST_PATH/$backup


rm $backup