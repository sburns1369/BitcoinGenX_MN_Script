#!/bin/bash
#ScriptVersion 0.07e
#setting varibles
COIN=BitcoinGenX
COIN3l=bgx
#Setting Colors
BLUE='\033[0;96m'
GREEN='\033[0;92m'
RED='\033[0;91m'
YELLOW='\033[0;93m'
#clear font
CLEAR='\033[0m'

#Checking OS
if [[ $(lsb_release -d) != *16.04* ]]; then
  echo -e ${RED}"The operating system is not Ubuntu 16.04. You must be running on ubuntu 16.04."${CLEAR}
  exit 1
fi
#Menu to Confirm and Pull correct script
echo
echo
echo
echo -e ${YELLOW}"Welcome to the $Coin Beta Automated Install Script by ${BLUE}NullEntry"${CLEAR}
echo -e ${RED}'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND'${CLEAR}
echo -e ${YELLOW}"Durring this Process Please Hit [Enter] or Input What is Asked."${CLEAR}
echo
echo -e ${GREEN}"This will attempt to updated the the BGX wallet 1.5.0 'in house' install"${CLEAR}
echo -e ${GREEN}"to the current 1.6.0 wallet - this is NOT AN UPDATE TO OUR SCRIPTS"${CLEAR}
echo
echo -e ${GREEN} "Press y for yes, and n for no followed by [ENTER]:"${CLEAR}
read AGREE
if [[ $AGREE =~ "y" ]] ; then
  cd /usr/local/bin/
  ./bitcoingenx-cli stop
      sudo rm bitcoingenx-cli
      sudo rm bitcoingenxd
      wget  https://github.com/BitcoinGenX/BitcoinGenesisX/files/2853315/bitcoingenx-linux.zip
      unzip bitcoingenx-linux.zip
      sudo chmod 755 -R  /usr/local/bin
      ./bitcoingenxd -daemon
      echo -e "Node should be re-launching"
else
echo -e "Exiting Setup! Reason - User Choice. You can re-run to try again"
fi
