#

#!/bin/bash

# RUN THIS FILE TO BEGIN BACKUP/RESTORE PROCESS


# NAVIGATE TO ROOT DIRECTORY
cd /
echo ""
echo "Hello, "$USER". What would you like to do?"

echo "1. Backup locally"
echo "2. Restore Filesystem"
echo "3. Exit"

# READ USER INPUT
read choice

# BACKUP LOCALLY

# IF USER ENTERS '1'
if [ $choice = 1 ]; then

	# BACKUP LOCALLY
	clear
	echo "Choose a backup option:"
	echo "1. Complete system backup"
	echo "2. Custom backup"

	# READ USER INPUT
	read backupchoice

	# CALL sysbackup.bash SCRIPT
	if [ $backupchoice = 1 ]; then
		clear
		./home/$USER/scripts/sysbackup.bash
	fi

	if [ $backupchoice = 2 ]; then
		# CLEAR SCREEN
		clear
		# NAVIGATE TO ROOT DIRECTORY
		cd /
		echo "current directory: ${PWD}"
		echo ""
		# LIST ALL FILES IN THAT DIRECTORY
		ls
		echo ""
		echo "Please specify the folder/file you want to backup"
		# READ USER INPUT
		read filechoice
		echo "Please specify the name of the archive"
		# READ USER INPUT
		read archivename
		# MAKE A COMPRESSED .tgz file WITH SUPERUSER CREDENTIALS
		sudo tar cvzf /var/backups/$archivename.tgz $filechoice
		echo "Backup successful!"
		echo "Archive saved at /var/backups/$archivename.tgz"
		# WAIT 3 SECONDS
		sleep 3
		#EXIT WITH EXIT STATUS 1
		exit 1

	fi

fi


# RESTORE
if [ $choice = 2 ]; then
	# RESTORE CODE HERE
	clear
	echo "Are you sure you want to restore filesystem?"
	echo "This will permanently erase files not backed up"
	echo "[Y/N]"
	read decision

	if [ $decision = Y ] || [ $decision = y ]; then
		echo "Preparing to restore from filesystem.."
		#UNPACK .tgz FILE THAT WAS LAST BACKUP
		tar zxvf /var/backups/systembackup.tgz
		# REPLACE ALL FILES/FOLDERS FROM ROOT DIRECTORY
		mv /home/$USER/Desktop/backupfiles/* /
		# FORCEFULLY REMOVE TEMP FOLDER
		rm -rf /home/$USER/Desktop/backupfiles
		clear
		echo "Filesystem Restored!"
		sleep 3
		exit 1
	fi

	if [ $decision = N ] || [ $decision = n ]; then
		exit 0
	fi
fi

# EXIT

if [ $choice = 3 ]; then
	echo ""
	echo "Exiting..."
	sleep 2
	clear
	exit 1
fi

# IF USER ENTERS INVALID NUMBER
if [ $choice != 1 ] || [ $choice != 2 ] || [ $choice != 3 ] || [ $choice != 4 ]; then
	echo "Invalid option"
fi
