#!/bin/bash
SCRIPTVERSION=0.9a
COIN=BitcoinGenX
COINl=bitcoingenx
COIN3=BGX
COIN3l=bgx
COINPORT=4488
COINRPCPORT1=19022
COINRPCPORT2=19023
COINRPCPORT3=19024
COINRPCPORT4=19025
COINRPCPORT5=19026
COINDAEMON=bitcoingenxd
COINDAEMONCLI=bitcoingenx-cli
COINCORE=.bitcoingenx
COINCONFIG=bitcoingenx.conf
COINVERSION=1.6.1
NODESL=Five
NODESN=5
BLUE='\033[0;36m'
GREEN='\033[0;92m'
RED='\033[0;91m'
YELLOW='\033[0;93m'
BOLD='\033[1;31m'
CLEAR='\033[0m'

if [[ $(lsb_release -d) != *16.04* ]]; then
  echo -e ${RED}"The operating system is not Ubuntu 16.04. You must be running on ubuntu 16.04."${CLEAR}
  exit 1
fi
echo
echo
echo -e ${GREEN}"Are you sure you want to continue installation of ${NODESL} ${COIN} Masternodes?"
echo -e "type y/n followed by [ENTER]:"${CLEAR}
read AGREE
if [[ $AGREE =~ "y" ]] ; then
echo
echo
echo
echo
# Permission to Store/Make nullentrydev files ####
echo -e ${BLUE}"May this script will store a small amount data in /usr/local/nullentrydev/ ?"${CLEAR}
echo -e ${BLUE}"This information is for version updates and later implimentation"${CLEAR}
echo -e ${BLUE}"Zero Confidental information or Wallet keys will be stored in it"${CLEAR}
echo -e ${YELLOW}"Press y to agree followed by [ENTER], or just [ENTER] to disagree"${CLEAR}
read NULLREC
echo
echo
echo
echo
echo
echo -e ${RED}"Your Masternode Private Keys are needed,"${CLEAR}
echo -e ${GREEN}" -which can be generated from the local wallet"${CLEAR}
echo
echo -e ${YELLOW}"You can edit the config later if you don't have this"${CLEAR}
echo -e ${YELLOW}"Masternode may fail to start with invalid key"${CLEAR}
echo
echo -e ${YELLOW}"Right Click to paste in some SSH Clients"${CLEAR}
echo
echo -e ${GREEN}"Please Enter Your First Masternode Private Key:"${CLEAR}
read privkey
echo
echo -e ${GREEN}"Please Enter Your Second Masternode Private Key:"${CLEAR}
read privkey2
echo
echo -e ${GREEN}"Please Enter Your Third Masternode Private Key:"${CLEAR}
read privkey3
echo
echo -e ${GREEN}"Please Enter Your Fourth Masternode Private Key:"${CLEAR}
read privkey4
echo
echo -e ${GREEN}"Please Enter Your Five Masternode Private Key:"${CLEAR}
read privkey5
echo
echo "Creating ${NODESN} ${COIN} system users with no-login access:"
sudo adduser --system --home /home/${COINl} ${COINl}
sudo adduser --system --home /home/${COINl}2 ${COINl}2
sudo adduser --system --home /home/${COINl}3 ${COINl}3
sudo adduser --system --home /home/${COINl}4 ${COINl}4
sudo adduser --system --home /home/${COINl}5 ${COINl}5
cd ~
if [[ $NULLREC = "y" ]] ; then
  if [ ! -d /usr/local/nullentrydev/ ]; then
    echo "Making /usr/local/nullentrydev "
    sudo mkdir /usr/local/nullentrydev
  else
    echo "Found /usr/local/nullentrydev "
  fi
  if [ ! -f /usr/local/nullentrydev/${COIN3l}.log ]; then
    echo "Making /usr/local/nullentrydev/${COIN3l}.log"
    sudo touch /usr/local/nullentrydev/${COIN3l}.log
  else
    echo "Found /usr/local/nullentrydev/${COIN3l}.log"
  fi
  if [ ! -f /usr/local/nullentrydev/mnodes.log ]; then
    echo "Making /usr/local/nullentrydev/mnodes.log"
    sudo touch /usr/local/nullentrydev/mnodes.log
  else
    echo "Found /usr/local/nullentrydev/mnodes.log"
  fi
  if [ ! -f /usr/local/nullentrydev/iptable.log ]; then
    echo "Making /usr/local/nullentrydev/iptable.log"
    sudo touch /usr/local/nullentrydev/iptable.log
  else
    echo "Found /usr/local/nullentrydev/mnodes.log"
  fi
fi
echo ${RED}"Updating Apps"${CLEAR}
sudo apt-get -y update
sudo apt-get -y upgrade
if grep -Fxq "dependenciesInstalled: true" /usr/local/nullentrydev/mnodes.log
then
  echo
  echo -e ${RED}"Skipping... Dependencies & Software Libraries - Previously installed"${CLEAR}
  echo
else
  echo ${RED}"Installing Dependencies & Software Libraries"${CLEAR}
  sudo apt-get -y install software-properties-common
  sudo apt-get -y install build-essential
  sudo apt-get -y install libtool autotools-dev autoconf automake
  sudo apt-get -y install libssl-dev
  sudo apt-get -y install libevent-dev
  sudo apt-get -y install libboost-all-dev
  sudo apt-get -y install pkg-config
  echo -e ${RED}"Press ENTER when prompted"${CLEAR}
  sudo add-apt-repository -yu ppa:bitcoin/bitcoin
  sudo apt-get update
  sudo apt-get -y install libdb4.8-dev
  sudo apt-get -y install libdb4.8++-dev
  echo -e ${YELLOW} "Here be dragons"${CLEAR}
  sudo apt-get -y install libminiupnpc-dev libzmq3-dev libevent-pthreads-2.0-5
  sudo apt-get -y install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev
  sudo apt-get -y install libqrencode-dev bsdmainutils unzip
    if [[ $NULLREC = "y" ]] ; then
      sudo echo "dependenciesInstalled: true" >> /usr/local/nullentrydev/mnodes.log
    fi
  fi
    echo -e ${YELLOW} "Building IP Tables"${CLEAR}
    sudo touch ip.tmp
    IP=$(hostname -I | cut -f2 -d' '| cut -f1-7 -d:)
    for i in {15360..15375}; do printf "${IP}:%.4x\n" $i >> ip.tmp; done
    MNIP1=$(sed -n '3p' < ip.tmp)
    MNIP2=$(sed -n '4p' < ip.tmp)
    MNIP3=$(sed -n '5p' < ip.tmp)
    MNIP4=$(sed -n '6p' < ip.tmp)
    MNIP5=$(sed -n '7p' < ip.tmp)
    if [[ $NULLREC = "y" ]] ; then
      sudo echo "ipv6: true" >> /usr/local/nullentrydev/mnodes.log
      sudo touch /usr/local/nullentrydev/iptable.log
      sudo cp -r ip.tmp >> /usr/local/nullentrydev/iptable.log
    fi
    rm -rf ip.tmp
cd /var
sudo touch swap.img
sudo chmod 600 swap.img
echo -e ${YELLOW} "You should check out https://youtu.be/l9nh1l8ZIJQ"${CLEAR}
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=4096
sudo mkswap /var/swap.img
sudo swapon /var/swap.img
cd ~
if [ ! -d /root/${COIN3l} ]; then
  sudo mkdir /root/${COIN3l}
fi
cd /root/${COIN3l}
echo "Downloading latest ${COIN} binaries"
wget  https://github.com/BitcoinGenX/BitcoinGenesisX/files/2896837/bitcoingenx-linux-static.zip
unzip bitcoingenx-linux-static.zip
sleep 3
sudo mv /root/${COIN3l}/${COINDAEMON} /root/${COIN3l}/${COINDAEMONCLI} /usr/local/bin
sudo chmod 755 -R  /usr/local/bin/${COINl}*
rm -rf /root/${COIN3l}
echo -e "${GREEN}Configuring First ${COIN} Node${CLEAR}"
sudo mkdir /home/${COINl}/.${COINl}
sudo touch /home/${COINl}/.${COINl}/${COINCONFIG}
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/${COINl}/.${COINl}/${COINCONFIG}
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/${COINl}/.${COINl}/${COINCONFIG}
echo "rpcallowip=127.0.0.1" >> /home/${COINl}/.${COINl}/${COINCONFIG}
echo "server=1" >> /home/${COINl}/.${COINl}/${COINCONFIG}
echo "daemon=1" >> /home/${COINl}/.${COINl}/${COINCONFIG}
echo "maxconnections=250" >> /home/${COINl}/.${COINl}/${COINCONFIG}
echo "masternode=1" >> /home/${COINl}/.${COINl}/${COINCONFIG}
echo "rpcport=${COINRPCPORT1}" >> /home/${COINl}/.${COINl}/${COINCONFIG}
echo "listen=0" >> /home/${COINl}/.${COINl}/${COINCONFIG}
echo "externalip=[${MNIP1}]:$COINPORT" >> /home/${COINl}/.${COINl}/${COINCONFIG}
echo "masternodeprivkey=$privkey" >> /home/${COINl}/.${COINl}/${COINCONFIG}
echo "addnode=85.214.50.43:4488" >> /home/${COINl}/.${COINl}/${COINCONFIG}
echo "addnode=45.32.128.115:4488" >> /home/${COINl}/.${COINl}/${COINCONFIG}
echo "addnode=144.202.124.138:4488" >> /home/${COINl}/.${COINl}/${COINCONFIG}
echo "addnode=108.61.224.80:4488" >> /home/${COINl}/.${COINl}/${COINCONFIG}
echo "addnode=118.38.99.125:4488" >> /home/${COINl}/.${COINl}/${COINCONFIG}
echo "addnode=178.62.68.177:4488" >> /home/${COINl}/.${COINl}/${COINCONFIG}
echo "addnode=136.61.3.89:4488" >> /home/${COINl}/.${COINl}/${COINCONFIG}

# Inserting Version to nullentrydev files
echo -e ${BOLD}"Launching First ${COIN3} Node"${CLEAR}
${COINDAEMON} -datadir=/home/${COINl}/.${COINl} -daemon
sleep 1
if [[ $NULLREC = "y" ]] ; then
  if [ -f /usr/local/nullentrydev/${COIN3l}.log ]; then
    sudo rm -rf /usr/local/nullentrydev/${COIN3l}.log
    sudo touch /usr/local/nullentrydev/${COIN3l}.log
  fi
  echo "masterNode1 : true" >> /usr/local/nullentrydev/${COIN3l}.log
  echo "walletVersion1 : $COINVERSION" >> /usr/local/nullentrydev/${COIN3l}.log
  echo "scriptVersion1 : $SCRIPTVERSION" >> /usr/local/nullentrydev/${COIN3l}.log
fi
sleep 7
echo
echo -e "${GREEN}Configuring Second ${COIN} Node${CLEAR}"
sudo mkdir /home/${COINl}2/.${COINl}
sudo touch /home/${COINl}2/${COINCONFIG}
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/${COINl}2/${COINCONFIG}
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/${COINl}2/${COINCONFIG}
echo "rpcallowip=127.0.0.1" >> /home/${COINl}2/${COINCONFIG}
echo "server=1" >> /home/${COINl}2/${COINCONFIG}
echo "daemon=1" >> /home/${COINl}2/${COINCONFIG}
echo "maxconnections=250" >> /home/${COINl}2/${COINCONFIG}
echo "masternode=1" >> /home/${COINl}2/${COINCONFIG}
echo "rpcport=${COINRPCPORT2}" >> /home/${COINl}2/${COINCONFIG}
echo "listen=0" >> /home/${COINl}2/${COINCONFIG}
echo "externalip=[${MNIP2}]:$COINPORT" >> /home/${COINl}2/${COINCONFIG}
echo "masternodeprivkey=$privkey2" >> /home/${COINl}2/${COINCONFIG}
if [[ $NULLREC = "y" ]] ; then
  echo "masterNode2 : true" >> /usr/local/nullentrydev/${COIN3l}.log
  echo "walletVersion2 : $COINVERSION" >> /usr/local/nullentrydev/${COIN3l}.log
  echo "scriptVersion2 : $SCRIPTVERSION" >> /usr/local/nullentrydev/${COIN3l}.log
fi
sleep 3
echo
echo -e ${BOLD}"Second ${COIN3} Node Staged for launch"${CLEAR}
sleep 3
sleep 7
echo
echo -e "${GREEN}Configuring Third ${COIN} Node${CLEAR}"
sudo mkdir /home/${COINl}3/.${COINl}
sudo touch /home/${COINl}3/${COINCONFIG}
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/${COINl}3/${COINCONFIG}
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/${COINl}3/${COINCONFIG}
echo "rpcallowip=127.0.0.1" >> /home/${COINl}3/${COINCONFIG}
echo "server=1" >> /home/${COINl}3/${COINCONFIG}
echo "daemon=1" >> /home/${COINl}3/${COINCONFIG}
echo "maxconnections=250" >> /home/${COINl}3/${COINCONFIG}
echo "masternode=1" >> /home/${COINl}3/${COINCONFIG}
echo "rpcport=${COINRPCPORT3}" >> /home/${COINl}3/${COINCONFIG}
echo "listen=0" >> /home/${COINl}3/${COINCONFIG}
echo "externalip=[${MNIP3}]:$COINPORT" >> /home/${COINl}3/${COINCONFIG}
echo "masternodeprivkey=$privkey3" >> /home/${COINl}3/${COINCONFIG}
if [[ $NULLREC = "y" ]] ; then
  echo "masterNode3 : true" >> /usr/local/nullentrydev/${COIN3l}.log
  echo "walletVersion3 : $COINVERSION" >> /usr/local/nullentrydev/${COIN3l}.log
  echo "scriptVersion3 : $SCRIPTVERSION" >> /usr/local/nullentrydev/${COIN3l}.log
fi
sleep 3
echo
echo -e ${BOLD}"Third ${COIN3} Node Staged for launch"${CLEAR}
sleep 7
echo
echo -e "${GREEN}Configuring Fourth ${COIN} Node${CLEAR}"
sudo mkdir /home/${COINl}4/.${COINl}
sudo touch /home/${COINl}4/${COINCONFIG}
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/${COINl}4/${COINCONFIG}
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/${COINl}4/${COINCONFIG}
echo "rpcallowip=127.0.0.1" >> /home/${COINl}4/${COINCONFIG}
echo "server=1" >> /home/${COINl}4/${COINCONFIG}
echo "daemon=1" >> /home/${COINl}4/${COINCONFIG}
echo "maxconnections=250" >> /home/${COINl}4/${COINCONFIG}
echo "masternode=1" >> /home/${COINl}4/${COINCONFIG}
echo "rpcport=${COINRPCPORT4}" >> /home/${COINl}4/${COINCONFIG}
echo "listen=0" >> /home/${COINl}4/${COINCONFIG}
echo "externalip=[${MNIP4}]:$COINPORT" >> /home/${COINl}4/${COINCONFIG}
echo "masternodeprivkey=$privkey4" >> /home/${COINl}4/${COINCONFIG}
if [[ $NULLREC = "y" ]] ; then
  echo "masterNode4 : true" >> /usr/local/nullentrydev/${COIN3l}.log
  echo "walletVersion4 : $COINVERSION" >> /usr/local/nullentrydev/${COIN3l}.log
  echo "scriptVersion4 : $SCRIPTVERSION" >> /usr/local/nullentrydev/${COIN3l}.log
fi
sleep 3
echo
echo -e ${BOLD}"Fourth ${COIN3} Node Staged for launch"${CLEAR}
sleep 7
echo
echo -e "${GREEN}Configuring Fifth ${COIN} Node${CLEAR}"
sudo mkdir /home/${COINl}5/.${COINl}
sudo touch /home/${COINl}5/${COINCONFIG}
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/${COINl}5/${COINCONFIG}
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/${COINl}5/${COINCONFIG}
echo "rpcallowip=127.0.0.1" >> /home/${COINl}5/${COINCONFIG}
echo "server=1" >> /home/${COINl}5/${COINCONFIG}
echo "daemon=1" >> /home/${COINl}5/${COINCONFIG}
echo "maxconnections=250" >> /home/${COINl}5/${COINCONFIG}
echo "masternode=1" >> /home/${COINl}5/${COINCONFIG}
echo "rpcport=${COINRPCPORT5}" >> /home/${COINl}5/${COINCONFIG}
echo "listen=0" >> /home/${COINl}5/${COINCONFIG}
echo "externalip=[${MNIP5}]:$COINPORT" >> /home/${COINl}5/${COINCONFIG}
echo "masternodeprivkey=$privkey5" >> /home/${COINl}5/${COINCONFIG}
if [[ $NULLREC = "y" ]] ; then
  echo "masterNode5 : true" >> /usr/local/nullentrydev/${COIN3l}.log
  echo "walletVersion5 : $COINVERSION" >> /usr/local/nullentrydev/${COIN3l}.log
  echo "scriptVersion5 : $SCRIPTVERSION" >> /usr/local/nullentrydev/${COIN3l}.log
fi
sleep 5
echo
echo -e ${BOLD}"Fifth ${COIN3} Node Staged for launch"${CLEAR}
sleep 3
echo
echo -e "${RED}This process can take a while!${CLEAR}"
echo -e "${YELLOW}Waiting on First Masternode Block Chain to Synchronize${CLEAR}"
echo -e "${YELLOW}Once complete, it will stop and copy the block chain to${CLEAR}"
echo -e "${YELLOW}the other masternodes.  This prevent all masternodes${CLEAR}"
echo -e "${YELLOW}from downloading the block chain individually; taking up${CLEAR}"
echo -e "${YELLOW}more time and resources.  Current Block count will be displayed below.${CLEAR}"
bitcoingenx-cli -datadir=/home/bitcoingenx/.bitcoingenx getblockcount
sleep 5
until bitcoingenx-cli -datadir=/home/bitcoingenx/.bitcoingenx mnsync status | grep -m 1 'IsBlockchainSynced" : true'; do
    bitcoingenx-cli -datadir=/home/bitcoingenx/.bitcoingenx getblockcount
    sleep 5
  done
echo -e "${GREEN}Haulting and Replicating First ${COIN} Node${CLEAR}"
echo
sleep 5
cd /
bitcoingenx-cli -datadir=/home/bitcoingenx/.bitcoingenx stop
sleep 10
sudo cp -r /home/${COINl}/.${COINl}/* /home/${COINl}2/.${COINl}/
sudo cp -r /home/${COINl}/.${COINl}/* /home/${COINl}3/.${COINl}/
sudo cp -r /home/${COINl}/.${COINl}/* /home/${COINl}4/.${COINl}/
sudo cp -r /home/${COINl}/.${COINl}/* /home/${COINl}5/.${COINl}/
sudo rm /home/${COINl}2/.${COINl}/${COINCONFIG}
sudo rm /home/${COINl}3/.${COINl}/${COINCONFIG}
sudo rm /home/${COINl}4/.${COINl}/${COINCONFIG}
sudo rm /home/${COINl}5/.${COINl}/${COINCONFIG}
sudo cp -r /home/${COINl}2/${COINCONFIG} /home/${COINl}2/.${COINl}/${COINCONFIG}
sudo cp -r /home/${COINl}3/${COINCONFIG} /home/${COINl}3/.${COINl}/${COINCONFIG}
sudo cp -r /home/${COINl}4/${COINCONFIG} /home/${COINl}4/.${COINl}/${COINCONFIG}
sudo cp -r /home/${COINl}5/${COINCONFIG} /home/${COINl}5/.${COINl}/${COINCONFIG}
sleep 5
#Launch codes
echo -e ${BOLD}"Re-Launching First ${COIN3} Node"${CLEAR}
${COINDAEMON} -datadir=/home/${COINl}/.${COINl} -daemon
echo
sleep 5
echo -e ${BOLD}"Launching Second ${COIN3} Node"${CLEAR}
${COINDAEMON} -datadir=/home/${COINl}2/.${COINl} -daemon
echo
sleep 5
echo -e ${BOLD}"Launching Third ${COIN3} Node"${CLEAR}
${COINDAEMON} -datadir=/home/${COINl}3/.${COINl} -daemon
echo
sleep 5
echo -e ${BOLD}"Launching Fourth ${COIN3} Node"${CLEAR}
${COINDAEMON} -datadir=/home/${COINl}4/.${COINl} -daemon
echo
sleep 5
echo -e ${BOLD}"Launching Fifth ${COIN3} Node"${CLEAR}
${COINDAEMON} -datadir=/home/${COINl}5/.${COINl} -daemon
echo
sleep 5
echo
echo -e ${BOLD}"All ${NODESN} ${COIN3} Nodes Launched, please wait for it to sync".${CLEAR}
echo
echo -e "${BOLD}Your Masternodes are sync'ing this will take some time."${CLEAR}
echo -e "While you wait you can configure your masternode.conf in your local wallet"${CLEAR}
echo -e "The data below needs to be in your local masternode configuration file:${CLEAR}"
echo -e "${BOLD} Masternode_IP 1: [${MNIP1}]:${COINPORT}${CLEAR}"
echo -e "${BOLD} Masternode_IP 2: [${MNIP2}]:${COINPORT}${CLEAR}"
echo -e "${BOLD} Masternode_IP 3: [${MNIP3}]:${COINPORT}${CLEAR}"
echo -e "${BOLD} Masternode_IP 4: [${MNIP4}]:${COINPORT}${CLEAR}"
echo -e "${BOLD} Masternode_IP 5: [${MNIP5}]:${COINPORT}${CLEAR}"
echo
echo -e ${BOLD} "If you become disconnected, you can check the status of sync'ing with"${CLEAR}
echo -e "${YELLOW}For ${COINDAEMONCLI} -datadir=/home/bitcoingenx/.bitcoingenx mnsync status"${CLEAR}
echo -e ${BOLD}"You can check the status of your ${COIN3} Masternode with"${CLEAR}
echo -e "${YELLOW}For mn1 ${COINDAEMONCLI} -datadir=/home/${COINl}/.${COINl} masternode status"${CLEAR}
echo -e "${YELLOW}For mn2 ${COINDAEMONCLI} -datadir=/home/${COINl}2/.${COINl} masternode status"${CLEAR}
echo -e "${YELLOW}For mn3 ${COINDAEMONCLI} -datadir=/home/${COINl}3/.${COINl} masternode status"${CLEAR}
echo -e "${YELLOW}For mn4 ${COINDAEMONCLI} -datadir=/home/${COINl}4/.${COINl} masternode status"${CLEAR}
echo -e "${YELLOW}For mn5 ${COINDAEMONCLI} -datadir=/home/${COINl}5/.${COINl} masternode status"${CLEAR}
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
