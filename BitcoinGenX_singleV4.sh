#!/bin/bash
#0.9g-- NullEntryDev Script
NODESL=One
NODESN=1
BLUE='\033[0;96m'
GREEN='\033[0;92m'
RED='\033[0;91m'
YELLOW='\033[0;93m'
CLEAR='\033[0m'
if [[ $(lsb_release -d) != *16.04* ]]; then
"echo -e ${RED}"The operating system is not Ubuntu 16.04. You must be running on ubuntu 16.04."${CLEAR}"
exit 1
fi
echo
echo
echo -e ${GREEN}"Are you sure you want to continue the installation of a BitcoinGenX Masternode?"
echo -e "type y/n followed by [ENTER]:"${CLEAR}
read AGREE
if [[ $AGREE =~ "y" ]] ; then
echo
echo
echo
echo
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
echo -e ${RED}"Your Masternode Private Key is needed,"${CLEAR}
echo -e ${GREEN}" -which can be generated from the local wallet"${CLEAR}
echo
echo -e ${YELLOW}"You can edit the config later if you don't have this"${CLEAR}
echo -e ${YELLOW}"Masternode may fail to start with invalid key"${CLEAR}
echo -e ${YELLOW}"And the script installation will hang and fail"${CLEAR}
echo
echo -e ${YELLOW}"Right Click to paste in some SSH Clients"${CLEAR}
echo
echo -e ${GREEN}"Please Enter Your Masternode Private Key:"${CLEAR}
read privkey
echo
echo "Creating ${NODESN} BitcoinGenX system users with no-login access:"
sudo adduser --system --home /home/bitcoingenx bitcoingenx
cd ~
if [[ $NULLREC = "y" ]] ; then
if [ ! -d /usr/local/nullentrydev/ ]; then
echo -e ${YELLOW}"Making /usr/local/nullentrydev"${CLEAR}
sudo mkdir /usr/local/nullentrydev
else
echo -e ${YELLOW}"Found /usr/local/nullentrydev"${CLEAR}
fi
if [ ! -f /usr/local/nullentrydev/bgx.log ]; then
echo -e ${YELLOW}"Making /usr/local/nullentrydev/bgx.log"${CLEAR}
sudo touch /usr/local/nullentrydev/bgx.log
else
echo -e ${YELLOW}"Found /usr/local/nullentrydev/bgx.log"${CLEAR}
fi
if [ ! -f /usr/local/nullentrydev/mnodes.log ]; then
echo -e ${YELLOW}"Making /usr/local/nullentrydev/mnodes.log"${CLEAR}
sudo touch /usr/local/nullentrydev/mnodes.log
else
echo -e ${YELLOW}"Found /usr/local/nullentrydev/mnodes.log"${CLEAR}
fi
fi
echo -e ${RED}"Updating Apps"${CLEAR}
sudo apt-get -y update
echo -e ${RED}"Upgrading Apps"${CLEAR}
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
echo -e ${RED}"Press [ENTER] if prompted"${CLEAR}
sudo add-apt-repository -yu ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get -y install libdb4.8-dev
sudo apt-get -y install libdb4.8++-dev
echo -e ${YELLOW} "Here be dragons"${CLEAR}
sudo apt-get -y install libminiupnpc-dev libzmq3-dev libevent-pthreads-2.0-5
sudo apt-get -y install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev
sudo apt-get -y install libqrencode-dev bsdmainutils unzip
if [[ $NULLREC = "y" ]] ; then
echo "dependenciesInstalled: true" >> /usr/local/nullentrydev/mnodes.log
fi
fi
echo -e ${YELLOW} "Building IP Tables"${CLEAR}
sudo touch ip.tmp
for i in {15361..15375}; do printf "${IP}:%.4x\n" $i >> ip.tmp; done
cd /var
sudo touch swap.img
sudo chmod 600 swap.img
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=4096
sudo mkswap /var/swap.img
sudo swapon /var/swap.img
cd ~
if [ ! -d /root/bgx ]; then
sudo mkdir /root/bgx
fi
cd /root/bgx
echo "Downloading latest BitcoinGenX binaries"
wget https://github.com/BitcoinGenX/BitcoinGenesisX/files/2853315/bitcoingenx-linux.zip
unzip bitcoingenx-linux.zip
sleep 3
sudo mv /root/bgx/bitcoingenxd /root/bgx/bitcoingenx-cli /usr/local/bin
sudo chmod 755 -R /usr/local/bin/bitcoingenx*
rm -rf /root/bgx
echo -e "${GREEN}Configuring BitcoinGenX Node${CLEAR}"
sudo mkdir /home/bitcoingenx/.bitcoingenx
sudo touch /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "rpcallowip=127.0.0.1" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "server=1" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "daemon=1" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "maxconnections=250" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "masternode=1" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "rpcport=19021" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "listen=0" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "externalip=$(hostname -I | cut -f1 -d' '):4488" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "masternodeprivkey=$privkey" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode1 : true" >> /usr/local/nullentrydev/bgx.log
echo "walletVersion1 : 1.4.0COINVERSION=1.6.0" >> /usr/local/nullentrydev/bgx.log
echo "scriptVersion1 : 0.9g" >> /usr/local/nullentrydev/bgx.log
fi
sleep 5
echo
echo -e ${YELLOW}"Launching BGX Node"${CLEAR}
bitcoingenxd -datadir=/home/bitcoingenx/.bitcoingenx -daemon
echo
echo -e ${YELLOW}"Looking for a Shared Masternode Service? Check out Crypto Hash Tank" ${CLEAR}
echo -e ${YELLOW}"Support my Project, and put your loose change to work for you!" ${CLEAR}
echo -e ${YELLOW}" https://www.cryptohashtank.com/TJIF "${CLEAR}
echo
echo -e ${YELLOW}"Special Thanks to the BitcoinGenX (BGX) Community" ${CLEAR}
sleep 20
echo -e "${RED}This process can take a while!${CLEAR}"
echo -e "${YELLOW}Waiting on Masternode Block Chain to Synchronize${CLEAR}"
until bitcoingenx-cli -datadir=/home/bitcoingenx/.bitcoingenx mnsync status | grep -m 1 'IsBlockchainSynced" : true'; do
bitcoingenx-cli -datadir=/home/bitcoingenx/.bitcoingenx getblockcount
sleep 60
done

echo
echo -e ${BOLD}"Your BGX Node has Launched."${CLEAR}
echo

echo -e "${GREEN}You can check the status of your BGX Masternode with"${CLEAR}
echo -e "${YELLOW} bitcoingenx-cli -datadir=/home/bitcoingenx/.bitcoingenx masternode status"${CLEAR}
echo -e "${YELLOW}For mn1: \"bitcoingenx-cli -datadir=/home/bitcoingenx/.bitcoingenx masternode status\""${CLEAR}
echo
echo -e "${RED}Status 29 may take a few minutes to clear while the daemon processes the chainstate"${CLEAR}
echo -e "${GREEN}The data below needs to be in your local masternode configuration file:${CLEAR}"
echo -e "${BOLD} Masternode - IP: $(hostname -I | cut -f1 -d' '):4488${CLEAR}"
fi
echo -e ${BLUE}" Your patronage is appreciated, tipping addresses"${CLEAR}
echo -e ${BLUE}" BitcoinGenX address: BayScFpFgPBiDU1XxdvozJYVzM2BQvNFgM"${CLEAR}
echo -e ${BLUE}" XGS address: BayScFpFgPBiDU1XxdvozJYVzM2BQvNFgM"${CLEAR}
echo -e ${BLUE}" LTC address: MUdDdVr4Az1dVw47uC4srJ31Ksi5SNkC7H"${CLEAR}
echo
echo -e ${YELLOW}"Need help? Find Sburns1369\#1584 on Discord - https://discord.gg/YhJ8v3g"${CLEAR}
echo -e ${YELLOW}"If Direct Messaged please verify by clicking on the profile!"${CLEAR}
echo -e ${YELLOW}"it says Sburns1369 in bigger letters followed by a little #1584" ${CLEAR}
echo -e ${YELLOW}"Anyone can clone my name, but not the #1384".${CLEAR}
echo
echo -e ${RED}"The END."${CLEAR};
