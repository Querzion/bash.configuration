#!/bin/bash

# Define color variables
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

############ FILE & FOLDER PATHS
# CHANGE THE FOLDER NAME & LOCATION IF YOU RENAME THE FOLDER
APPLICATION="configuration"
BASE="bash.$APPLICATION"
FILES="$BASE/files"
BASHRC="$FILES/.bashrc"
STC="$FILES/starship.theme.changer.sh"

################################################################### CHANGE .BASHRC - MAIN 
############ CHANGE .BASHRC - MAIN

echo -e "${PURPLE} LETS BE FIXING THE BASH! ${NC}"

git clone https://github.com/querzion/bash.fonts.git $HOME
chmod +x -r $HOME/bash.fonts
sh $HOME/bash.fonts/installer.sh

# Starship.rc changes the commandline look in Bash
echo -e "${PURPLE} NOW LETS SPRUCE THE BASH UP! STARSHIP! HERE I COME ${NC}"
curl -sS https://starship.rs/install.sh | sh

# Copy the StarShip Theme Changer Script to the home folder.
cp $FILES/starship.theme.changer.sh ~/
# Run StarShip Theme Changer
sh $FILES/starship.theme.changer.sh

echo -e "${YELLOW} BTW! The StarShip Theme Changer script is in your home folder. ;D ${NC}"
echo -e "${PURPLE} NOW ACTIVATE! . . . WELL! A REBOOT IS IN NEED HERE, LETS FIX THE REST FIRST! ${NC}"

# Create .bashrc file in the home directory with specific content
echo "Creating .bashrc file in the home directory..."

mv ~/.bashrc ~/.bashrc.kicked
cp $BASHRC ~/

echo -e "${GREEN} .bashrc file created successfully. ${NC}"
