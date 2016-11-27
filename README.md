# Docker-Backup

Docker Container to backup host data to another server

# Usage

```
docker run -t -i -v [$(pwd)/certs]:/certs -v [$(pwd)/folder_to_backup]:/backup -e TYPE={SCP,FTP,FTP_MIRROR} -e CRON=["* * * * *"] -e PASS=[SSH_PASS] -e PRIV_KEY_NAME=[name_of_privatekey] -e DISTANT_HOST_PATH=[user@host:path_to_backup] --name docker-backup adi90x/docker-backup
```
# Parameters

* DISTANT_HOST_PATH = Host connection string in ssh style (user@host) or ftp style (user:pass@host)
* TYPE = {SCP,FTP,FTP_MIRROR} depend on how you want to save 
    * SCP => Just copy the backup archive to the target location
    * FTP => Just copy the backup archive to the target location
    * FTP_MIRROR => Mirror /save folder to the target path_to_backup ( therefore keeping only one backup for the moment)
* BACKUP_PATH = where to backup ( from scp/ftp connection default location)
* PASS = SSH Pass to connect to the target folder ( only for scp connection)
* PRIV_KEY_NAME = name_of_privatekey_to_use - default = priv.key ( only for scp connection)
* CRON = Cron like parameters to choose when to backup (ex : "* * * * *" every minutes) - default = Everyday at midnight

# TODO

* Maybe add rsync 

# Any Help welcome ! 
* Just git clone master or any dev branch and send a pull request !
````
git clone https://adi90@bitbucket.org/adi90/docker-backup.git
````