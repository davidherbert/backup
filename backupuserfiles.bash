#!/bin/bash
# RECORDS THE BACKUP IN /home/<user>/backuplogs/log.txt

# WRITE CURRENT DATE IN NEW ENTRY TO BACKUP LOG
echo "$(date)" >> /home/$USER/backuplogs/log.txt

# WRITE TIMESTAMP IN NEW ENTRY TO BACKUP LOG
echo "Backup started -" $(date +%T-%d-%m-%Y) >> /home/$USER/backuplogs/log.txt

# UPLOAD ALL USER FILES TO DROPBOX APP FOLDER
./home/$USER/scripts/dropbox_uploader.sh upload /home/$USER/* /$USER/

# WHEN COMPLETED, WRITE TIMESTAMP IN ENTRY
echo "Backup completed -" $(date +%T-%d-%m-%Y) >> /home/$USER/backuplogs/log.txt
echo "______________________________________" >> /home/$USER/backuplogs/log.txt
# END
