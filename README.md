# Scp-Backup
Docker Container to backup host data to another server

#Usage
docker run -t -i -v [$(pwd)/certs]:/certs -v [$(pwd)/folder_to_backup]:/backup -e TYPE={SCP,FTP} -e PRIV_KEY_NAME=[name_of_privatekey] -e DISTANT_HOST_PATH=[user@host:path_to_backup] --name scp-backup adi90x/scp-backup

#Parameters
PRIV_KEY_NAME = name_of_privatekey_to_use - default = priv.key ( only for scp connection)
DISTANT_HOST_PATH = Path to backup in ssh style (user@host:path_to_backup)
TYPE = {SCP,FTP} depend on how you want to save 
BACKUP_PATH = where to back ( from scp/ftp connection default location)

#TODO
Give the possibility to change when backup is done currently every day 
Add possibility to connect via password
#DEV
export DISTANT_HOST_PATH="vasts_19156944:060190@ftp.vastserve.com"
