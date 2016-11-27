# Scp-Backup
Docker Container to backup host data to another server

#Usage
docker run -t -i -v [$(pwd)/certs]:/certs -v [$(pwd)/folder_to_backup]:/backup -e PRIV_KEY_NAME=[name_of_privatekey] -e PASS=[SSH_PASS] -e DISTANT_HOST_PATH=[user@host:path_to_backup] --name scp-backup adi90x/scp-backup

#Parameters
* PRIV_KEY_NAME = name_of_privatekey_to_use - default = priv.key
* DISTANT_HOST_PATH = Path to backup in ssh style (user@host:path_to_backup)
* PASS = SSH Pass to connect to the target folder 

#TODO
* Give the possibility to change when backup is done currently every day ( Currently every day at midnight )

#Any Help welcome ! 
* Just git clone master or any dev branch and send a pull request !