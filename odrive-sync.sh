#!/bin/bash 

#load the file with the directory paths
source "$HOME/Documents/Cloud/odrive/Google Drive (2)/Automation/Bin/var/teamwork_dir.sh"
RED='\033[1;31m'
GREEN='\033[1;32m' 
NC='\033[0m' # No Color

#select the file/folder to  be synced
echo -e "${RED}File or folder?${NC}"
read TYPE

if [[ $(echo "$TYPE") = "file" ]] ; then
	SELECTION=$(zenity --file-selection)
else
	SELECTION=$(zenity --file-selection --directory)
fi

#sync selected file/folder
"$HOME/.odrive-agent/bin/odrive" sync "$SELECTION"
