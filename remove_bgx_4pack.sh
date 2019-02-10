#!/bin/bash
#ScriptVersion 0.06a
COIN=BitcoinGenX
COINl=bitcoingenx
COIN3=BGX
COIN3l=bgx
COINPORT=4488
COINRPCPORT1=19022
COINRPCPORT2=19023
COINRPCPORT3=19024
COINRPCPORT4=19025
COINDAEMON=bitcoingenxd
COINDAEMONCLI=bitcoingenx-cli
COINCORE=.bitcoingenx
COINCONFIG=bitcoingenx.conf
#Setting Colors
BLUE='\033[0;96m'
GREEN='\033[0;92m'
RED='\033[0;91m'
YELLOW='\033[0;93m'
#clear font
CLEAR='\033[0m'
echo
echo
echo -e ${RED}"Are you sure you want to REMOVE the installation of Four ${COIN} Masternodes?"
echo -e ${RED}"This will remove ALL data, to include old configuration files!!!"
echo
echo -e "type y/n followed by [ENTER]:"${CLEAR}
read AGREE
if [[ $AGREE =~ "y" ]] ; then
echo
echo
echo
echo "Preparing to nuke ${COINl} Masternode Node Accounts on this VPS!!"
echo "Press Control+C to exit or any key to continue"
read CTRCC
sudo userdel -r -f ${COINl}
sudo userdel -r -f ${COINl}2
sudo userdel -r -f ${COINl}3
sudo userdel -r -f ${COINl}4
echo
echo -e ${YELLOW} "${COINl}, ${COINl}2, ${COINl}3, ${COINl}4 Users Deleted"${CLEAR}
echo
echo "Preparing to nuke ${COINl} Program files!"
rm -rf /usr/local/bin/${COINl}*
rm -rf /root/${COIN3l}
echo -e ${BOLD}${YELLOW}"Nodes Launched, please wait for them to sync".${CLEAR}
echo
echo -e "${BOLD}Your Masternodes are sync'ing this will take some time."${CLEAR}
echo -e "While you wait you can configure your masternode.conf in your local wallet"${CLEAR}
echo -e "The following data needs to be recorded in your local masternode configuration file:${CLEAR}"
echo -e "${BOLD}${RED} Masternode_IP: $(hostname  -I | cut -f1 -d' '):${COINPORT}${CLEAR}"
echo
echo -e ${BOLD}${YELLOW}"If you become disconnected, you can check the status of sync'ing with"${CLEAR}
echo -e "${BOLD}For MN#1- ${COINDAEMONCLI} -datadir=/home/${COINl}/.${COINl} mnsync status"${CLEAR}
echo -e "${BOLD}For MN#2- ${COINDAEMONCLI} -datadir=/home/${COINl}2/.${COINl} mnsync status"${CLEAR}
echo -e "${BOLD}For MN#3- ${COINDAEMONCLI} -datadir=/home/${COINl}3/.${COINl} mnsync status"${CLEAR}
echo -e "${BOLD}For MN#3- ${COINDAEMONCLI} -datadir=/home/${COINl}4/.${COINl} mnsync status"${CLEAR}
echo -e
echo -e ${BOLD}${YELLOW}"You can check the status of your ${COIN3} Masternode with"${CLEAR}
echo -e "${BOLD}For MN#1- ${COINDAEMONCLI} -datadir=/home/${COINl}/.${COINl} masternode status"${CLEAR}
echo -e "${BOLD}For MN#2- ${COINDAEMONCLI} -datadir=/home/${COINl}2/.${COINl} masternode status"${CLEAR}
echo -e "${BOLD}For MN#3- ${COINDAEMONCLI} -datadir=/home/${COINl}3/.${COINl} masternode status"${CLEAR}
echo -e "${BOLD}For MN#3- ${COINDAEMONCLI} -datadir=/home/${COINl}4/.${COINl} masternode status"${CLEAR}
echo
fi
echo ${BOLD}${BLUE}"Your patronage is apprappreciated, tipping addresses"${CLEAR}
echo ${BLUE}"${COIN} address: BoEsUmcS3D9gVmdxvj7Che4wD1SAHa2zG9"${CLEAR}
echo ${BLUE}"LTC address: MUdDdVr4Az1dVw47uC4srJ31Ksi5SNkC7H"${CLEAR}
echo ${BLUE}"BTC address: 32FzghE1yUZRdDmCkj3bJ6vJyXxUVPKY93"${CLEAR}
echo
echo "Need help?  Find Sburns1369#1584 one Discord - https://discord.gg/YhJ8v3g"
echo
echo
echo ${RED}"The END."${CLEAR};
