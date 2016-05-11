#!/bin/sh
# Execute this script if you want to schedule a command
echo ""
echo "Choose how often you would like to backup"
echo "The format is as follows:"
echo "Minute Hour Date Month Day-of-week"
echo "Example: 30 12 1 * *"
echo ""
echo "Minute.."
read m
echo "Hour.."
read h
echo "Date.."
read dom
echo "Month.."
read mon
echo "Day of week [1-7].."
read dow
echo ""
echo "Now please specify the command to execute.."
read command
echo ""
echo "please specify the account name where you wish to save the cronjob.."
read account
sudo echo "$m $h $dom $mon $dow $command " >> /var/spool/cron/crontabs/$account

