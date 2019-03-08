#!/bin/bash
#0.9g-- NullEntryDev Script
NODESL=Six
NODESN=6
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
echo -e ${GREEN}"Are you sure you want to continue the installation of ${NODESL} BitcoinGenX Masternodes?"
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
echo -e ${RED}"Your Masternode Private Keys are needed,"${CLEAR}
echo -e ${GREEN}" -which can be generated from the local wallet"${CLEAR}
echo
echo -e ${YELLOW}"You can edit the config later if you don't have this"${CLEAR}
echo -e ${YELLOW}"Masternode may fail to start with invalid key"${CLEAR}
echo -e ${YELLOW}"And the script installation will hang and fail"${CLEAR}
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
echo -e ${GREEN}"Please Enter Your Fifth Masternode Private Key:"${CLEAR}
read privkey5
echo
echo -e ${GREEN}"Please Enter Your Sixth Masternode Private Key:"${CLEAR}
read privkey6
echo
echo "Creating ${NODESN} BitcoinGenX system users with no-login access:"
sudo adduser --system --home /home/bitcoingenx bitcoingenx
sudo adduser --system --home /home/bitcoingenx2 bitcoingenx2
sudo adduser --system --home /home/bitcoingenx3 bitcoingenx3
sudo adduser --system --home /home/bitcoingenx4 bitcoingenx4
sudo adduser --system --home /home/bitcoingenx5 bitcoingenx5
sudo adduser --system --home /home/bitcoingenx6 bitcoingenx6
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
regex='^([0-9a-fA-F]{0,4}:){1,7}[0-9a-fA-F]{0,4}$'
FINDIP=$(hostname -I | cut -f2 -d' '| cut -f1-7 -d:)
if [[ $FINDIP =~ $regex ]]; then
echo "IPv6 Address check is good"
echo ${FINDIP} testing note
IP=${FINDIP}
echo ${IP}
else
echo "IPv6 Address check is not expected, getting IPv6 Helper to recalculate"
echo $FINDIP - testing note 1
sudo apt-get install sipcalc
echo $FINDIP - testing note 2
FINDIP=$(hostname -I | cut -f3 -d' '| cut -f1-8 -d:)
echo $FINDIP - check 3
echo "Attempting to adjust results and re-calculate IPv6 Address"
FINDIP=$(sipcalc ${FINDIP} | fgrep Expanded | cut -d ' ' -f3)
if [[ $FINDIP =~ $regex ]]; then
FINDIP=$(echo ${FINDIP} | cut -f1-7 -d:)
echo "IPv6 Address check is good"
IP=${FINDIP}
else
echo "IPv6 Addressing check has failed. Contact NullEntry Support"
echo ${IP} testing note
exit 1
fi
fi
echo ${MNIP1} testing note
echo ${IP} testing note
echo -e ${YELLOW} "Building IP Tables"${CLEAR}
sudo touch ip.tmp
for i in {15361..15375}; do printf "${IP}:%.4x\n" $i >> ip.tmp; done
MNIP1=$(sed -n '1p' < ip.tmp)
MNIP2=$(sed -n '2p' < ip.tmp)
MNIP3=$(sed -n '3p' < ip.tmp)
MNIP4=$(sed -n '4p' < ip.tmp)
MNIP5=$(sed -n '5p' < ip.tmp)
MNIP6=$(sed -n '6p' < ip.tmp)
if [[ $NULLREC = "y" ]] ; then
sudo touch /usr/local/nullentrydev/iptable.log
sudo cp ip.tmp >> /usr/local/nullentrydev/iptable.log
fi
rm -rf ip.tmp
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
echo -e "${GREEN}Configuring First BitcoinGenX Node${CLEAR}"
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
echo "externalip=[${MNIP1}]:4488" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "masternodeprivkey=$privkey" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode1 : true" >> /usr/local/nullentrydev/bgx.log
echo "walletVersion1 : 1.4.0COINVERSION=1.6.0" >> /usr/local/nullentrydev/bgx.log
echo "scriptVersion1 : 0.9g" >> /usr/local/nullentrydev/bgx.log
fi
sleep 5
echo
echo -e ${YELLOW}"Launching first BGX Node"${CLEAR}
bitcoingenxd -datadir=/home/bitcoingenx/.bitcoingenx -daemon
echo
echo -e ${YELLOW}"Looking for a Shared Masternode Service? Check out Crypto Hash Tank" ${CLEAR}
echo -e ${YELLOW}"Support my Project, and put your loose change to work for you!" ${CLEAR}
echo -e ${YELLOW}" https://www.cryptohashtank.com/TJIF "${CLEAR}
echo
echo -e ${YELLOW}"Special Thanks to the BitcoinGenX (BGX) Community" ${CLEAR}
sleep 20
echo -e "${GREEN}Configuring second BitcoinGenX Node${CLEAR}"
sudo mkdir /home/bitcoingenx2/.bitcoingenx
sudo touch /home/bitcoingenx2/bitcoingenx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx2/bitcoingenx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx2/bitcoingenx.conf
echo "rpcallowip=127.0.0.1" >> /home/bitcoingenx2/bitcoingenx.conf
echo "server=1" >> /home/bitcoingenx2/bitcoingenx.conf
echo "daemon=1" >> /home/bitcoingenx2/bitcoingenx.conf
echo "maxconnections=250" >> /home/bitcoingenx2/bitcoingenx.conf
echo "masternode=1" >> /home/bitcoingenx2/bitcoingenx.conf
echo "rpcport=19022" >> /home/bitcoingenx2/bitcoingenx.conf
echo "listen=0" >> /home/bitcoingenx2/bitcoingenx.conf
echo "externalip=[${MNIP2}]:4488" >> /home/bitcoingenx2/bitcoingenx.conf
echo "masternodeprivkey=$privkey2" >> /home/bitcoingenx2/bitcoingenx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode2 : true" >> /usr/local/nullentrydev/bgx.log
echo "walletVersion2 : 1.4.0COINVERSION=1.6.0" >> /usr/local/nullentrydev/bgx.log
echo "scriptVersion2 : 0.9g" >> /usr/local/nullentrydev/bgx.log
fi
sleep 5
echo
echo -e "${GREEN}Configuring third BitcoinGenX Node${CLEAR}"
sudo mkdir /home/bitcoingenx3/.bitcoingenx
sudo touch /home/bitcoingenx3/bitcoingenx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx3/bitcoingenx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx3/bitcoingenx.conf
echo "rpcallowip=127.0.0.1" >> /home/bitcoingenx3/bitcoingenx.conf
echo "server=1" >> /home/bitcoingenx3/bitcoingenx.conf
echo "daemon=1" >> /home/bitcoingenx3/bitcoingenx.conf
echo "maxconnections=250" >> /home/bitcoingenx3/bitcoingenx.conf
echo "masternode=1" >> /home/bitcoingenx3/bitcoingenx.conf
echo "rpcport=19023" >> /home/bitcoingenx3/bitcoingenx.conf
echo "listen=0" >> /home/bitcoingenx3/bitcoingenx.conf
echo "externalip=[${MNIP3}]:4488" >> /home/bitcoingenx3/bitcoingenx.conf
echo "masternodeprivkey=$privkey3" >> /home/bitcoingenx3/bitcoingenx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode3 : true" >> /usr/local/nullentrydev/bgx.log
echo "walletVersion3 : 1.4.0COINVERSION=1.6.0" >> /usr/local/nullentrydev/bgx.log
echo "scriptVersion3 : 0.9g" >> /usr/local/nullentrydev/bgx.log
fi
sleep 5
echo
echo -e "${GREEN}Configuring fourth BitcoinGenX Node${CLEAR}"
sudo mkdir /home/bitcoingenx4/.bitcoingenx
sudo touch /home/bitcoingenx4/bitcoingenx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx4/bitcoingenx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx4/bitcoingenx.conf
echo "rpcallowip=127.0.0.1" >> /home/bitcoingenx4/bitcoingenx.conf
echo "server=1" >> /home/bitcoingenx4/bitcoingenx.conf
echo "daemon=1" >> /home/bitcoingenx4/bitcoingenx.conf
echo "maxconnections=250" >> /home/bitcoingenx4/bitcoingenx.conf
echo "masternode=1" >> /home/bitcoingenx4/bitcoingenx.conf
echo "rpcport=19024" >> /home/bitcoingenx4/bitcoingenx.conf
echo "listen=0" >> /home/bitcoingenx4/bitcoingenx.conf
echo "externalip=[${MNIP4}]:4488" >> /home/bitcoingenx4/bitcoingenx.conf
echo "masternodeprivkey=$privkey4" >> /home/bitcoingenx4/bitcoingenx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode4 : true" >> /usr/local/nullentrydev/bgx.log
echo "walletVersion4 : 1.4.0COINVERSION=1.6.0" >> /usr/local/nullentrydev/bgx.log
echo "scriptVersion4 : 0.9g" >> /usr/local/nullentrydev/bgx.log
fi
sleep 5
echo
echo -e "${GREEN}Configuring fifth BitcoinGenX Node${CLEAR}"
sudo mkdir /home/bitcoingenx5/.bitcoingenx
sudo touch /home/bitcoingenx5/bitcoingenx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx5/bitcoingenx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx5/bitcoingenx.conf
echo "rpcallowip=127.0.0.1" >> /home/bitcoingenx5/bitcoingenx.conf
echo "server=1" >> /home/bitcoingenx5/bitcoingenx.conf
echo "daemon=1" >> /home/bitcoingenx5/bitcoingenx.conf
echo "maxconnections=250" >> /home/bitcoingenx5/bitcoingenx.conf
echo "masternode=1" >> /home/bitcoingenx5/bitcoingenx.conf
echo "rpcport=19025" >> /home/bitcoingenx5/bitcoingenx.conf
echo "listen=0" >> /home/bitcoingenx5/bitcoingenx.conf
echo "externalip=[${MNIP5}]:4488" >> /home/bitcoingenx5/bitcoingenx.conf
echo "masternodeprivkey=$privkey5" >> /home/bitcoingenx5/bitcoingenx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode5 : true" >> /usr/local/nullentrydev/bgx.log
echo "walletVersion5 : 1.4.0COINVERSION=1.6.0" >> /usr/local/nullentrydev/bgx.log
echo "scriptVersion5 : 0.9g" >> /usr/local/nullentrydev/bgx.log
fi
sleep 5
echo
echo -e "${GREEN}Configuring sixth BitcoinGenX Node${CLEAR}"
sudo mkdir /home/bitcoingenx6/.bitcoingenx
sudo touch /home/bitcoingenx6/bitcoingenx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx6/bitcoingenx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx6/bitcoingenx.conf
echo "rpcallowip=127.0.0.1" >> /home/bitcoingenx6/bitcoingenx.conf
echo "server=1" >> /home/bitcoingenx6/bitcoingenx.conf
echo "daemon=1" >> /home/bitcoingenx6/bitcoingenx.conf
echo "maxconnections=250" >> /home/bitcoingenx6/bitcoingenx.conf
echo "masternode=1" >> /home/bitcoingenx6/bitcoingenx.conf
echo "rpcport=19026" >> /home/bitcoingenx6/bitcoingenx.conf
echo "listen=0" >> /home/bitcoingenx6/bitcoingenx.conf
echo "externalip=[${MNIP6}]:4488" >> /home/bitcoingenx6/bitcoingenx.conf
echo "masternodeprivkey=$privkey6" >> /home/bitcoingenx6/bitcoingenx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode6 : true" >> /usr/local/nullentrydev/bgx.log
echo "walletVersion6 : 1.4.0COINVERSION=1.6.0" >> /usr/local/nullentrydev/bgx.log
echo "scriptVersion6 : 0.9g" >> /usr/local/nullentrydev/bgx.log
fi
sleep 5
echo
echo -e "${RED}This process can take a while!${CLEAR}"
echo -e "${YELLOW}Waiting on First Masternode Block Chain to Synchronize${CLEAR}"
echo -e "${YELLOW}Once complete, it will stop and copy the block chain to${CLEAR}"
echo -e "${YELLOW}the other masternodes. This prevent all masternodes${CLEAR}"
echo -e "${YELLOW}from downloading the block chain individually; taking up${CLEAR}"
echo -e "${YELLOW}more time and resources. Current Block count will be displayed below.${CLEAR}"
until bitcoingenx-cli -datadir=/home/bitcoingenx/.bitcoingenx mnsync status | grep -m 1 'IsBlockchainSynced" : true'; do
bitcoingenx-cli -datadir=/home/bitcoingenx/.bitcoingenx getblockcount
sleep 60
done
echo -e "${GREEN}Haulting and Replicating First BitcoinGenX Node${CLEAR}"

bitcoingenx-cli -datadir=/home/bitcoingenx/.bitcoingenx stop
sleep 10
sudo cp -r /home/bitcoingenx/.bitcoingenx/* /home/bitcoingenx2/.bitcoingenx
sleep 3
sudo cp -r /home/bitcoingenx/.bitcoingenx/* /home/bitcoingenx3/.bitcoingenx
sleep 3
sudo cp -r /home/bitcoingenx/.bitcoingenx/* /home/bitcoingenx4/.bitcoingenx
sleep 3
sudo cp -r /home/bitcoingenx/.bitcoingenx/* /home/bitcoingenx5/.bitcoingenx
sleep 3
sudo cp -r /home/bitcoingenx/.bitcoingenx/* /home/bitcoingenx6/.bitcoingenx
sleep 3
rm /home/bitcoingenx2/.bitcoingenx/bitcoingenx.conf
sleep 1
rm /home/bitcoingenx3/.bitcoingenx/bitcoingenx.conf
sleep 1
rm /home/bitcoingenx4/.bitcoingenx/bitcoingenx.conf
sleep 1
rm /home/bitcoingenx5/.bitcoingenx/bitcoingenx.conf
sleep 1
rm /home/bitcoingenx6/.bitcoingenx/bitcoingenx.conf
sleep 1
cp -r /home/bitcoingenx2/bitcoingenx.conf /home/bitcoingenx2/.bitcoingenx/bitcoingenx.conf
sleep 1
cp -r /home/bitcoingenx3/bitcoingenx.conf /home/bitcoingenx3/.bitcoingenx/bitcoingenx.conf
sleep 1
cp -r /home/bitcoingenx4/bitcoingenx.conf /home/bitcoingenx4/.bitcoingenx/bitcoingenx.conf
sleep 1
cp -r /home/bitcoingenx5/bitcoingenx.conf /home/bitcoingenx5/.bitcoingenx/bitcoingenx.conf
sleep 1
cp -r /home/bitcoingenx6/bitcoingenx.conf /home/bitcoingenx6/.bitcoingenx/bitcoingenx.conf
sleep 1
echo -e ${YELLOW}"Launching First BGX Node"${CLEAR}
bitcoingenxd -datadir=/home/bitcoingenx/.bitcoingenx -daemon
sleep 20
echo -e ${YELLOW}"Launching Second BGX Node"${CLEAR}
bitcoingenxd -datadir=/home/bitcoingenx2/.bitcoingenx -daemon
sleep 20
echo -e ${YELLOW}"Launching Third BGX Node"${CLEAR}
bitcoingenxd -datadir=/home/bitcoingenx3/.bitcoingenx -daemon
sleep 20
echo -e ${YELLOW}"Launching Fourth BGX Node"${CLEAR}
bitcoingenxd -datadir=/home/bitcoingenx4/.bitcoingenx -daemon
sleep 20
echo -e ${YELLOW}"Launching Fifth BGX Node"${CLEAR}
bitcoingenxd -datadir=/home/bitcoingenx5/.bitcoingenx -daemon
sleep 20
echo -e ${YELLOW}"Launching Sixth BGX Node"${CLEAR}
bitcoingenxd -datadir=/home/bitcoingenx6/.bitcoingenx -daemon
sleep 20
echo -e ${BOLD}"All ${NODESN} BGX Nodes Launched".${CLEAR}
echo

echo -e "${GREEN}You can check the status of your BGX Masternode with"${CLEAR}
echo -e "${YELLOW}For mn1: \"bitcoingenx-cli -datadir=/home/bitcoingenx/.bitcoingenx masternode status\""${CLEAR}
echo -e "${YELLOW}For mn2: \"bitcoingenx-cli -datadir=/home/bitcoingenx2/.bitcoingenx masternode status\""${CLEAR}
echo -e "${YELLOW}For mn3: \"bitcoingenx-cli -datadir=/home/bitcoingenx3/.bitcoingenx masternode status\""${CLEAR}
echo -e "${YELLOW}For mn4: \"bitcoingenx-cli -datadir=/home/bitcoingenx4/.bitcoingenx masternode status\""${CLEAR}
echo -e "${YELLOW}For mn5: \"bitcoingenx-cli -datadir=/home/bitcoingenx5/.bitcoingenx masternode status\""${CLEAR}
echo -e "${YELLOW}For mn6: \"bitcoingenx-cli -datadir=/home/bitcoingenx6/.bitcoingenx masternode status\""${CLEAR}
echo
echo -e "${RED}Status 29 may take a few minutes to clear while the daemon processes the chainstate"${CLEAR}
echo -e "${GREEN}The data below needs to be in your local masternode configuration file:${CLEAR}"
echo -e "${BOLD} Masternode - \#1 IP: [${MNIP1}]:4488${CLEAR}"
echo -e "${BOLD} Masternode - \#2 IP: [${MNIP2}]:4488${CLEAR}"
echo -e "${BOLD} Masternode - \#3 IP: [${MNIP3}]:4488${CLEAR}"
echo -e "${BOLD} Masternode - \#4 IP: [${MNIP4}]:4488${CLEAR}"
echo -e "${BOLD} Masternode - \#5 IP: [${MNIP5}]:4488${CLEAR}"
echo -e "${BOLD} Masternode - \#6 IP: [${MNIP6}]:4488${CLEAR}"
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
