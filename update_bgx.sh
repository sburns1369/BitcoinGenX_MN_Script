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
echo -e ${GREEN}"Please enter the number (1-4) of $COIN Masternode(s) to upgrade"${CLEAR}
read NUMBER
case $NUMBER in
  1)bash <(curl -Ls https://raw.githubusercontent.com/sburns1369/${COIN}_MN_Script/master/update_${COIN3l}_single.sh);;
  2)bash <(curl -Ls https://raw.githubusercontent.com/sburns1369/${COIN}_MN_Script/master/update_${COIN3l}_2pack.sh);;
  3)bash <(curl -Ls https://raw.githubusercontent.com/sburns1369/${COIN}_MN_Script/master/update_${COIN3l}_3pack.sh);;
  4)bash <(curl -Ls https://raw.githubusercontent.com/sburns1369/${COIN}_MN_Script/master/update_${COIN3l}_4pack.sh);;
  *)echo -e ${RED}"Invalid Option - Exiting Setup - Re-run to try again"${CLEAR};;
esac
