This is a small backup script that allows you to connect to a MySQL instance within a vpn (which can be removed from the script), take a dump of the whole database, encrypt the sql dump with gnupg, upload the encrypted version to S3, and remove the local copy.
It requires the existence of several ENV variables:
```sh
# VPN
VPN_CLIENT # this is an .ovpn client configuration file, setup to connect to your vpn.
VPN_AUTH # the authentication for the vpn connection, which can also be configured within the ovpn file.

# DB
DB_HOST # the hostname of the database to connect to.
DB_USERNAME # the username for the database 
DB_PASSWORD # the password for the provided username

# Encryption
BACKUP_PHRASE # a secret password for the backup file
ENC_KEYPAIR # this is the name provided for the --recipient flag to gpg - it can be created by using the `gpg --gen-key` command. It must be used to decrypt the output file.

# S3
BACKUP_BUCKET # a bucket to store the backup in. this utilises the `aws s3` cli utility, so check you can upload into the provided bucket from the cli before running this script.

# etc
LOCAL_BACKUP # a folder to store the local backup.

```
