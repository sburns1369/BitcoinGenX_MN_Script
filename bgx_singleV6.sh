#!/bin/bash
SCRIPTVERSION=0.9a
COIN=BitcoinGenX
COINl=bitcoingenx
COIN3=BGX
COIN3l=bgx
COINPORT=4488
COINRPCPORT1=19022
COINDAEMON=bitcoingenxd
COINDAEMONCLI=bitcoingenx-cli
COINCORE=.bitcoingenx
COINCONFIG=bitcoingenx.conf
COINVERSION=1.6.1
NODESL=One
NODESN=1
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
echo -e ${GREEN}"Are you sure you want to continue installation of a ${COIN} Masternodes?"
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
echo -e ${GREEN}"Please Enter Your Masternode Private Key:"${CLEAR}
read privkey
echo
echo "Creating ${NODESN} ${COIN} system users with no-login access:"
sudo adduser --system --home /home/${COINl} ${COINl}
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
echo -e ${BOLD}"Launching ${COIN3} Node"${CLEAR}
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
echo -e "${RED}This process can take a while!${CLEAR}"
echo -e "${YELLOW}Waiting on Masternode Block Chain to Synchronize${CLEAR}"
bitcoingenx-cli -datadir=/home/bitcoingenx/.bitcoingenx getblockcount
sleep 5
until bitcoingenx-cli -datadir=/home/bitcoingenx/.bitcoingenx mnsync status | grep -m 1 'IsBlockchainSynced" : true'; do
    bitcoingenx-cli -datadir=/home/bitcoingenx/.bitcoingenx getblockcount
    sleep 5
  done
echo
echo -e ${BOLD}"A ${COIN3} Node Launched, please wait for it to sync".${CLEAR}
echo -e "The data below needs to be in your local masternode configuration file:${CLEAR}"
echo -e "${BOLD} Masternode_IP 1: [${MNIP1}]:${COINPORT}${CLEAR}"
echo
echo -e ${BOLD} "If you become disconnected, you can check the status of sync'ing with"${CLEAR}
echo -e "${YELLOW}For ${COINDAEMONCLI} -datadir=/home/bitcoingenx/.bitcoingenx mnsync status"${CLEAR}
echo
echo -e ${BOLD}"You can check the status of your ${COIN3} Masternode with"${CLEAR}
echo -e "${YELLOW}For mn1 ${COINDAEMONCLI} -datadir=/home/${COINl}/.${COINl} masternode status"${CLEAR}
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
