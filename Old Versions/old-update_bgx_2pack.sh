#!/bin/bash
SCRIPTVERSION=0.7e
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
COINVERSION=1.6.0
NODESL=Two
NODESN=2
#AGREE = Agree to install Masternode
#NULLREC = Agree to Record nullentrydev information
#Setting Colors
BLUE='\033[0;36m'
GREEN='\033[0;92m'
RED='\033[0;91m'
YELLOW='\033[0;93m'
BOLD='\033[1;31m'
CLEAR='\033[0m'

#Checking OS - double check incase script ran directly
if [[ $(lsb_release -d) != *16.04* ]]; then
  echo -e ${RED}"The operating system is not Ubuntu 16.04. You must be running on ubuntu 16.04."${CLEAR}
  exit 1
fi
echo
echo
echo -e ${GREEN}"Are you sure you want to continue the update of ${NODESL} ${COIN} Masternodes?"
echo -e "type y/n followed by [ENTER]:"${CLEAR}
read AGREE
if [[ $AGREE =~ "y" ]] ; then
echo
# Permission to Store/Make nullentrydev files ####
# Checking For nullentrydev install information
# Recording Dependencies & Software Libraries insatllation complete
cd ~
cd /usr/local/bin
#Stop and kill old core
${COINDAEMONCLI} -datadir=/home/${COINl}/.${COINl} stop
${COINDAEMONCLI} -datadir=/home/${COINl}2/.${COINl} stop
sleep 2
    rm ${COINDAEMON}
    rm ${COINDAEMONCLI}
#jumping back to reinstallation
if [ ! -d /root/${COIN3l} ]; then
  sudo mkdir /root/${COIN3l}
fi
cd /root/${COIN3l}
#Download Wallet Files
echo "Downloading latest ${COIN} binaries"
wget  https://github.com/BitcoinGenX/BitcoinGenesisX/files/2853315/bitcoingenx-linux.zip
unzip bitcoingenx-linux.zip
sleep 3
sudo mv /root/${COIN3l}/${COINDAEMON} /root/${COIN3l}/${COINDAEMONCLI} /usr/local/bin
sudo chmod 755 -R  /usr/local/bin/${COINl}*
rm -rf /root/${COIN3l}
# First Node Configuration and launch
# Inserting Version to nullentrydev files
if [[ $NULLREC = "y" ]] ; then
  echo "walletVersion1 : $COINVERSION" >> /usr/local/nullentrydev/${COIN3l}.log
  echo "scriptVersion1 : $SCRIPTVERSION" >> /usr/local/nullentrydev/${COIN3l}.log
fi
sleep 2
echo
# Starting First Masternode daemon
echo -e ${BOLD}"Re-launching First ${COIN3} Node"${CLEAR}
${COINDAEMON} -datadir=/home/${COINl}/.${COINl} -daemon
sleep 5
# Second Node Configuration and launch
# Inserting Version to nullentrydev files
if [[ $NULLREC = "y" ]] ; then
  echo "walletVersion2 : $COINVERSION" >> /usr/local/nullentrydev/${COIN3l}.log
  echo "scriptVersion2 : $SCRIPTVERSION" >> /usr/local/nullentrydev/${COIN3l}.log
fi
sleep 2
echo
# Starting Second Masternode daemon
echo -e ${BOLD}"Re-launching Second ${COIN3} Node"${CLEAR}
${COINDAEMON} -datadir=/home/${COINl}2/.${COINl} -daemon
sleep 5
# Fourth Node Configuration and launch
# Inserting Version to nullentrydev files
echo
echo -e ${BOLD}"All ${NODESN} ${COIN3} Nodes Re-launched, please wait for it to sync".${CLEAR}
echo
echo -e "${BOLD}Your Masternodes are sync'ing this may take some time."${CLEAR}
echo
echo -e ${BOLD} "If you become disconnected, you can check the status of sync'ing with"${CLEAR}
echo -e "${YELLOW}For ${COINDAEMONCLI} -datadir=/home/${COINl}/.${COINl} mnsync status"${CLEAR}
echo -e "${YELLOW}For ${COINDAEMONCLI} -datadir=/home/${COINl}2/.${COINl} mnsync status"${CLEAR}
echo -e ${BOLD}"You can check the status of your ${COIN3} Masternode with"${CLEAR}
echo -e "${YELLOW}For ${COINDAEMONCLI} -datadir=/home/${COINl}/.${COINl} masternode status"${CLEAR}
echo -e "${YELLOW}For ${COINDAEMONCLI} -datadir=/home/${COINl}2/.${COINl} masternode status"${CLEAR}
echo
fi
echo -e ${BLUE}" Your patronage is apprappreciated, tipping addresses"${CLEAR}
echo -e ${BLUE}" ${COIN} address: BoEsUmcS3D9gVmdxvj7Che4wD1SAHa2zG9"${CLEAR}
echo -e ${BLUE}" LTC address: MUdDdVr4Az1dVw47uC4srJ31Ksi5SNkC7H"${CLEAR}
echo -e ${BLUE}" BTC address: 32FzghE1yUZRdDmCkj3bJ6vJyXxUVPKY93"${CLEAR}
echo
echo -e ${YELLOW}"Need help?  Find Sburns1369#1584 one Discord - https://discord.gg/YhJ8v3g"${CLEAR}
echo
echo -e ${RED}"The END."${CLEAR};
