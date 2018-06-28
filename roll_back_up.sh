#!/bin/bash
############################################################################
# Usage: To roll back the patching using yum history ...
# Version :- 20_04_2018_V2
# Uses a for loop over all arguments.
# Date :- 
# Limitations: 
#  . Only for Redhat family os
#  . User for roll_Back with old rep
############################################################################

# check for root user . else exit 

# Make sure only root can run our script


if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

## Check the os Family 



## prelist thr pkg installed 
## Variables 

PL="prilist_of_pkg"
POL="postlist_of_pkg"

: > $PL $POL

echo " Prelisting package installed " 
echo " In Text file :- prilist_of_pkg"

rpm -qa > $PL

# check the last update and fetch the ID

echo "Fetching the restore point /ID"
sleep 3
yum history list 

id=$(yum history list | awk '{print $1 }'|awk 'FNR == 4 {print}')

echo "the ID is $id"

# Roll back to old id please enter 

echo "Enter to roll back"

sleep 1

echo "rolling back the packages"
sleep 3
yum history undo $id

echo " Postlisting package "
echo " In Text file :- postlist_of_pkg"
sleep 3
rpm -qa > $POL



	

