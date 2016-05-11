#!/bin/bash

cd /
mkdir /home/$USER/backup

# USE RSYNC TOOL TO BACKUP ALL FILES FROM ROOT DIRECTORY
# ** EXCLUDING CHOSEN DIRECTORIES LISTED BELOW
rsync --progress --delete -aE --exclude=/home/$USER/backup --exclude=/dev/* --exclude=/proc/* --exclude=/sys/* --exclude=/tmp/* --exclude=/run/* --exclude=/mnt/* --exclude=/media/* --exclude=/lost+found /* /home/$USER/Desktop/backup
echo "Done!"

# GIVE USER OPTION TO ARCHIVE THE BACKUP FOLDER
echo "Do you want to archive the backup?"

# READ USER INPUT
read archivebackupfolder

if [ $archivebackupfolder = Y ] || [ $archivebackupfolder = y ]; 
then
	sudo tar cvzf var/backups/systembackup.tgz /home/$USER/Desktop/backupfiles
	echo ""
	echo "System backup successful!"
	echo "File saved at /var/backups/systembackup.tgz"
	# EXIT WITH EXIT STATUS 0
	exit 0
else
	exit 0
fi

