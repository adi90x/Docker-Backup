# Scp-Backup
Docker Container to backup host data to another server

#Usage
docker run -t -i -v [$(pwd)/certs]:/certs -v [$(pwd)/folder_to_backup]:/backup -e PRIV_KEY_NAME=[name_of_privatekey] -e DISTANT_HOST_PATH=[user@host:path_to_backup] adi90x/scp-backup

#Parameters
PRIV_KEY_NAME = name_of_privatekey_to_use - default = priv.key
DISTANT_HOST_PATH = Path to backup in ssh style (user@host:path_to_backup)

#TODO
Add cron like 
Add possibility to connect via password 

#Help
https://gist.github.com/andyshinn/3ae01fa13cb64c9d36e7