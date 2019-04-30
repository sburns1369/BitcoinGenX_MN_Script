#!/bin/bash
#0.99-- NullEntryDev Script
NODESL=Nine
NODESN=9
NEBootStrap=http://nullentry.com/chain/BGX/bootstrap.rar
COINl=bitcoingenx
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
echo -e ${GREEN}"Would you like to enter custom IP addresses?"${CLEAR}
echo -e ${YELLOW}"If you don't know the answer, hit n for no"${CLEAR}
echo -e ${YELLOW}"If you have custom IPs hit y for yes"${CLEAR}
read customIP
echo "Creating ${NODESN} BitcoinGenX system user(s) with no-login access:"
if id "bitcoingenx" >/dev/null 2>&1; then
echo "user exists"
MN1=1
else
sudo adduser --system --home /home/bitcoingenx bitcoingenx
MN1=0
fi
if id "bitcoingenx2" >/dev/null 2>&1; then
echo -e ${YELLOW} "Found user bitcoingenx2!"${CLEAR}
MN2=1
else
sudo adduser --system --home /home/bitcoingenx2 bitcoingenx2
MN2=0
fi
if id "bitcoingenx3" >/dev/null 2>&1; then
echo -e ${YELLOW} "Found user bitcoingenx3!"${CLEAR}
MN3=1
else
sudo adduser --system --home /home/bitcoingenx3 bitcoingenx3
MN3=0
fi
if id "bitcoingenx4" >/dev/null 2>&1; then
echo -e ${YELLOW} "Found user bitcoingenx4!"${CLEAR}
MN4=1
else
sudo adduser --system --home /home/bitcoingenx4 bitcoingenx4
MN4=0
fi
if id "bitcoingenx5" >/dev/null 2>&1; then
echo -e ${YELLOW} "Found user bitcoingenx5!"${CLEAR}
MN5=1
else
sudo adduser --system --home /home/bitcoingenx5 bitcoingenx5
MN5=0
fi
if id "bitcoingenx6" >/dev/null 2>&1; then
echo -e ${YELLOW} "Found user bitcoingenx6!"${CLEAR}
MN6=1
else
sudo adduser --system --home /home/bitcoingenx6 bitcoingenx6
MN6=0
fi
if id "bitcoingenx7" >/dev/null 2>&1; then
echo -e ${YELLOW} "Found user bitcoingenx7!"${CLEAR}
MN7=1
else
sudo adduser --system --home /home/bitcoingenx7 bitcoingenx7
MN7=0
fi
if id "bitcoingenx8" >/dev/null 2>&1; then
echo -e ${YELLOW} "Found user bitcoingenx8!"${CLEAR}
MN8=1
else
sudo adduser --system --home /home/bitcoingenx8 bitcoingenx8
MN8=0
fi
#
if id "bitcoingenx9" >/dev/null 2>&1; then
echo -e ${YELLOW} "Found user bitcoingenx9!"${CLEAR}
MN8=1
else
sudo adduser --system --home /home/bitcoingenx9 bitcoingenx9
MN8=0
fi
#
#
if id "bitcoingenx0" >/dev/null 2>&1; then
echo -e ${YELLOW} "Found user bitcoingenx0!"${CLEAR}
MN8=1
else
sudo adduser --system --home /home/bitcoingenx0 bitcoingenx0
MN8=0
fi
#
echo
echo
echo
echo
echo -e ${RED}"Your New Masternode Private Keys are needed,"${CLEAR}
echo -e ${GREEN}" -which can be generated from the local wallet"${CLEAR}
echo
echo -e ${YELLOW}"You can edit the config later if you don't have this"${CLEAR}
echo -e ${YELLOW}"Masternode may fail to start with invalid key"${CLEAR}
echo -e ${YELLOW}"And the script installation will hang and fail"${CLEAR}
echo
echo -e ${YELLOW}"Right Click to paste in some SSH Clients"${CLEAR}
echo
if [[ "$MN1" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your First Masternode Private Key:"${CLEAR}
read MNKEY
echo
else
echo -e ${YELLOW}"Skipping First Masternode Key"${CLEAR}
fi
if [[ "$MN2" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your Second Masternode Private Key:"${CLEAR}
read MNKEY2
echo
else
echo -e ${YELLOW}"Skipping Second Masternode Key"${CLEAR}
fi
if [[ "$MN3" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your Third Masternode Private Key:"${CLEAR}
read MNKEY3
echo
else
echo -e ${YELLOW}"Skipping Third Masternode Key"${CLEAR}
fi
if [[ "$MN4" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your Fourth Masternode Private Key:"${CLEAR}
read MNKEY4
echo
else
echo -e ${YELLOW}"Skipping Fourth Masternode Key"${CLEAR}
fi
if [[ "$MN5" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your Fifth Masternode Private Key:"${CLEAR}
read MNKEY5
echo
else
echo -e ${YELLOW}"Skipping Fifth Masternode Key"${CLEAR}
fi
if [[ "$MN6" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your Sixth Masternode Private Key:"${CLEAR}
read MNKEY6
echo
else
echo -e ${YELLOW}"Skipping Sixth Masternode Key"${CLEAR}
fi
if [[ "$MN7" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your Seventh Masternode Private Key:"${CLEAR}
read MNKEY7
echo
else
echo -e ${YELLOW}"Skipping Seventh Masternode Key"${CLEAR}
fi
if [[ "$MN8" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your Eigth Masternode Private Key:"${CLEAR}
read MNKEY8
echo
else
echo -e ${YELLOW}"Skipping Eigth Masternode Key"${CLEAR}
fi
#
if [[ "$MN9" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your Ninth Masternode Private Key:"${CLEAR}
read MNKEY9
echo
else
echo -e ${YELLOW}"Skipping Ninth Masternode Key"${CLEAR}
fi
#
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
if [[ customIP = "y" ]] ; then
echo -e ${GREEN}"IP for Masternode 1"${CLEAR}
read MNIP1
echo -e ${GREEN}"IP for Masternode 2"${CLEAR}
read MNIP2
echo -e ${GREEN}"IP for Masternode 3"${CLEAR}
read MNIP3
echo -e ${GREEN}"IP for Masternode 4"${CLEAR}
read MNIP4
echo -e ${GREEN}"IP for Masternode 5"${CLEAR}
read MNIP5
echo -e ${GREEN}"IP for Masternode 6"${CLEAR}
read MNIP6
echo -e ${GREEN}"IP for Masternode 7"${CLEAR}
read MNIP7
echo -e ${GREEN}"IP for Masternode 8"${CLEAR}
read MNIP8
echo -e ${GREEN}"IP for Masternode 9"${CLEAR}
read MNIP9
echo -e ${GREEN}"IP for Masternode 10"${CLEAR}
read MNIP10
else
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
MNIP7=$(sed -n '7p' < ip.tmp)
MNIP8=$(sed -n '8p' < ip.tmp)
MNIP9=$(sed -n '9p' < ip.tmp)
MNIP10=$(sed -n '10p' < ip.tmp)
rm -rf ip.tmp
fi
if grep -Fxq "swapInstalled: true" /usr/local/nullentrydev/mnodes.log
then
echo -e ${RED}"Skipping... Swap Area already made"${CLEAR}
else
cd /var
sudo touch swap.img
sudo chmod 600 swap.img
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=4096
sudo mkswap /var/swap.img
sudo swapon /var/swap.img
if [[ $NULLREC = "y" ]] ; then
echo "swapInstalled: true" >> /usr/local/nullentrydev/mnodes.log
fi
fi
cd ~
touch bgxcheck.tmp
ps aux | grep bitcoingenx >> bgxcheck.tmp
if grep home/bitcoingenx/.bitcoingenx bgxcheck.tmp
then
echo Found OLD ${NC} bgx Node running
OldNode="1"
else
echo No ${NC} bgx Node not running
OldNode="0"
fi
until [[ $NC = 10 ]]; do
if grep /home/bitcoingenx${NC}/.bitcoingenx bgxcheck.tmp
then
echo Found ${NC} bgx Node running
declare IPN$NC="1"
RB=1
else
echo No ${NC} bgx Node not running
declare IPN$NC="0"
echo $NC
fi
NC=$[$NC+1]
done
rm -r bgxcheck.tmp
if [[ "$OldNode" = "1" ]]; then
bitcoingenx-cli -datadir=/home/bitcoingenx/.bitcoingenx stop
fi
if [[ "$IPN1" = "1" ]]; then
bitcoingenx-cli -datadir=/home/bitcoingenx1/.bitcoingenx stop
fi
if [[ "$IPN2" = "1" ]]; then
bitcoingenx-cli -datadir=/home/bitcoingenx2/.bitcoingenx stop
fi
if [[ "$IPN3" = "1" ]]; then
bitcoingenx-cli -datadir=/home/bitcoingenx3/.bitcoingenx stop
fi
if [[ "$IPN4" = "1" ]]; then
bitcoingenx-cli -datadir=/home/bitcoingenx4/.bitcoingenx stop
fi
if [[ "$IPN5" = "1" ]]; then
bitcoingenx-cli -datadir=/home/bitcoingenx5/.bitcoingenx stop
fi
if [[ "$IPN6" = "1" ]]; then
bitcoingenx-cli -datadir=/home/bitcoingenx6/.bitcoingenx stop
fi
if [[ "$IPN7" = "1" ]]; then
bitcoingenx-cli -datadir=/home/bitcoingenx7/.bitcoingenx stop
fi
if [[ "$IPN8" = "1" ]]; then
bitcoingenx-cli -datadir=/home/bitcoingenx8/.bitcoingenx stop
fi
if [[ "$IPN9" = "1" ]]; then
bitcoingenx-cli -datadir=/home/bitcoingenx9/.bitcoingenx stop
fi
if [[ "$IPN0" = "1" ]]; then
bitcoingenx-cli -datadir=/home/bitcoingenx0/.bitcoingenx stop
fi
if [ ! -d /root/bgx ]; then
sudo mkdir /root/bgx
fi
cd /root/bgx
echo "Downloading latest BitcoinGenX binaries"
wget https://github.com/BitcoinGenX/BitcoinGenesisX/files/2896837/bitcoingenx-linux-static.zip
unzip bitcoingenx-linux-static.zip
sleep 3
sudo mv /root/bgx/bitcoingenxd /root/bgx/bitcoingenx-cli /usr/local/bin
sudo chmod 755 -R /usr/local/bin/bitcoingenx*
rm -rf /root/bgx
if [ ! -f /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf ]; then
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
echo "masternodeprivkey=$MNKEY" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "addnode=108.61.179.198" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "addnode=206.189.227.156" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "addnode=155.138.207.17" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "addnode=5.189.163.30" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "addnode=213.227.154.56" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "addnode=213.227.155.83" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "addnode=23.106.215.65" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "addnode=149.28.101.45" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "addnode=155.138.207.17" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
echo "addnode=155.138.163.92" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
MN1=0
if [[ $NULLREC = "y" ]] ; then
echo "masterNode1 : true" >> /usr/local/nullentrydev/bgx.log
echo "walletVersion1 : 1.4.0COINVERSION=1.6.0" >> /usr/local/nullentrydev/bgx.log
echo "scriptVersion1 : 0.99" >> /usr/local/nullentrydev/bgx.log
fi
else
echo -e ${YELLOW}"Found /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration there"${CLEAR}
fi
echo
#Bootstrap
cd ~
if [ ! -d /root/bootstrap ]; then
sudo mkdir /bootstrap/
fi
cd /bootstrap/
echo "Attempting to get Bootstrap, please wait"
pause
wget ${NEBootStrap}
sleep 1
if [ ! -d ${COINl}/.${COINl} ]; then
echo "Making /home/${COINl}1/.${COINl} "
sudo mkdir /home/${COINl}/.${COINl}
else
echo "Found /home/${COINl}1/.${COINl} "
fi
#add check before downloading
sudo apt-get install unrar
sleep 3
unrar e bootstrap.rar /home/${COINl}/.${COINl}
cd ..
rm -rf /bootstrap/
#
echo -e ${YELLOW}"Launching First BGX Node"${CLEAR}
bitcoingenxd -datadir=/home/bitcoingenx/.bitcoingenx -daemon
echo
echo -e ${YELLOW}"Looking for a Shared Masternode Service? Check out Crypto Hash Tank" ${CLEAR}
echo -e ${YELLOW}"Support my Project, and put your loose change to work for you!" ${CLEAR}
echo -e ${YELLOW}" https://www.cryptohashtank.com/TJIF "${CLEAR}
echo
echo -e ${YELLOW}"Special Thanks to the BitcoinGenX (BGX) Community" ${CLEAR}
sleep 20
if [ ! -f /home/bitcoingenx2/.bitcoingenx/bitcoingenx.conf ]; then
if [ ! -f /home/bitcoingenx2/bitcoingenx.conf ]; then
echo -e "${YELLOW}Second BitcoinGenX Normal Warning - Node Configuration Not Found....${CLEAR}"
echo -e "${GREEN}Configuring Second BitcoinGenX Node${CLEAR}"
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
echo "masternodeprivkey=$MNKEY2" >> /home/bitcoingenx2/bitcoingenx.conf
echo "addnode=[${MNIP1}]" >> /home/bitcoingenx/.bitcoingenx/bitcoingenx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode2 : true" >> /usr/local/nullentrydev/bgx.log
echo "walletVersion2 : 1.4.0COINVERSION=1.6.0" >> /usr/local/nullentrydev/bgx.log
echo "scriptVersion2 : 0.99" >> /usr/local/nullentrydev/bgx.log
fi
else
echo
echo -e ${GREEN}"Found /home/bitcoingenx2/bitcoingenx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Pre-stage for Second Node "${CLEAR}
MN2=0
fi
else
echo -e ${YELLOW}"Found /home/bitcoingenx2/.bitcoingenx/bitcoingenx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration for Second Node"${CLEAR}
fi
echo
if [ ! -f /home/bitcoingenx3/.bitcoingenx/bitcoingenx.conf ]; then
if [ ! -f /home/bitcoingenx3/bitcoingenx.conf ]; then
echo -e "${GREEN}Third BitcoinGenX Node Configuration Not Found....${CLEAR}"
echo -e "${GREEN}Configuring Third BitcoinGenX Node${CLEAR}"
sudo mkdir /home/bitcoingenx3/.bitcoingenx
sudo touch /home/bitcoingenx3/bitcoingenx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx3/bitcoingenx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx3/bitcoingenx.conf
echo "rpcallowip=127.0.0.1" >> /home/bitcoingenx3/bitcoingenx.conf
echo "server=1" >> /home/bitcoingenx3/bitcoingenx.conf
echo "daemon=1" >> /home/bitcoingenx3/bitcoingenx.conf
echo "maxconnections=250" >> /home/bitcoingenx3/bitcoingenx.conf
echo "masternode=1" >> /home/bitcoingenx3/bitcoingenx.conf
echo "rpcport=19024" >> /home/bitcoingenx3/bitcoingenx.conf
echo "listen=0" >> /home/bitcoingenx3/bitcoingenx.conf
echo "externalip=[${MNIP3}]:4488" >> /home/bitcoingenx3/bitcoingenx.conf
echo "masternodeprivkey=$MNKEY3" >> /home/bitcoingenx3/bitcoingenx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode3 : true" >> /usr/local/nullentrydev/bgx.log
echo "walletVersion3 : 1.4.0COINVERSION=1.6.0" >> /usr/local/nullentrydev/bgx.log
echo "scriptVersion3 : 0.99" >> /usr/local/nullentrydev/bgx.log
fi
else
echo -e ${YELLOW}"Found /home/bitcoingenx3/bitcoingenx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Pre-stage for Third Node "${CLEAR}
MN3=0
fi
echo
else
echo -e ${YELLOW}"Found /home/bitcoingenx3/.bitcoingenx/bitcoingenx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration for Third Node"${CLEAR}
fi
echo
if [ ! -f /home/bitcoingenx4/.bitcoingenx/bitcoingenx.conf ]; then
if [ ! -f /home/bitcoingenx4/bitcoingenx.conf ]; then
echo -e "${GREEN}Fourth BitcoinGenX Node Configuration Not Found....${CLEAR}"
echo -e "${GREEN}Configuring Fourth BitcoinGenX Node${CLEAR}"
sudo mkdir /home/bitcoingenx4/.bitcoingenx
sudo touch /home/bitcoingenx4/bitcoingenx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx4/bitcoingenx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx4/bitcoingenx.conf
echo "rpcallowip=127.0.0.1" >> /home/bitcoingenx4/bitcoingenx.conf
echo "server=1" >> /home/bitcoingenx4/bitcoingenx.conf
echo "daemon=1" >> /home/bitcoingenx4/bitcoingenx.conf
echo "maxconnections=250" >> /home/bitcoingenx4/bitcoingenx.conf
echo "masternode=1" >> /home/bitcoingenx4/bitcoingenx.conf
echo "rpcport=19025" >> /home/bitcoingenx4/bitcoingenx.conf
echo "listen=0" >> /home/bitcoingenx4/bitcoingenx.conf
echo "externalip=[${MNIP4}]:4488" >> /home/bitcoingenx4/bitcoingenx.conf
echo "masternodeprivkey=$MNKEY4" >> /home/bitcoingenx4/bitcoingenx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode4 : true" >> /usr/local/nullentrydev/bgx.log
echo "walletVersion4 : 1.4.0COINVERSION=1.6.0" >> /usr/local/nullentrydev/bgx.log
echo "scriptVersion4 : 0.99" >> /usr/local/nullentrydev/bgx.log
fi
else
echo
echo -e ${YELLOW}"Found /home/bitcoingenx4/bitcoingenx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Pre-stage for Fourth Node "${CLEAR}
MN4=0
fi
else
echo -e ${YELLOW}"Found /home/bitcoingenx4/.bitcoingenx/bitcoingenx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration for Fourth Node"${CLEAR}
fi
if [ ! -f /home/bitcoingenx5/.bitcoingenx/bitcoingenx.conf ]; then
if [ ! -f /home/bitcoingenx5/bitcoingenx.conf ]; then
echo -e "${GREEN}Fifth BitcoinGenX Node Configuration Not Found....${CLEAR}"
echo -e "${GREEN}Configuring Fifth BitcoinGenX Node${CLEAR}"
sudo mkdir /home/bitcoingenx5/.bitcoingenx
sudo touch /home/bitcoingenx5/bitcoingenx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx5/bitcoingenx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx5/bitcoingenx.conf
echo "rpcallowip=127.0.0.1" >> /home/bitcoingenx5/bitcoingenx.conf
echo "server=1" >> /home/bitcoingenx5/bitcoingenx.conf
echo "daemon=1" >> /home/bitcoingenx5/bitcoingenx.conf
echo "maxconnections=250" >> /home/bitcoingenx5/bitcoingenx.conf
echo "masternode=1" >> /home/bitcoingenx5/bitcoingenx.conf
echo "rpcport=19026" >> /home/bitcoingenx5/bitcoingenx.conf
echo "listen=0" >> /home/bitcoingenx5/bitcoingenx.conf
echo "externalip=[${MNIP5}]:4488" >> /home/bitcoingenx5/bitcoingenx.conf
echo "masternodeprivkey=$MNKEY5" >> /home/bitcoingenx5/bitcoingenx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode5 : true" >> /usr/local/nullentrydev/bgx.log
echo "walletVersion5 : 1.4.0COINVERSION=1.6.0" >> /usr/local/nullentrydev/bgx.log
echo "scriptVersion5 : 0.99" >> /usr/local/nullentrydev/bgx.log
fi
else
echo
echo -e ${YELLOW}"Found /home/bitcoingenx5/bitcoingenx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Pre-stage for Fifth Node "${CLEAR}
MN5=0
fi
else
echo -e ${YELLOW}"Found /home/bitcoingenx5/.bitcoingenx/bitcoingenx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration for Fifth Node"${CLEAR}
fi
if [ ! -f /home/bitcoingenx6/.bitcoingenx/bitcoingenx.conf ]; then
if [ ! -f /home/bitcoingenx6/bitcoingenx.conf ]; then
echo -e "${GREEN}Sixth BitcoinGenX Node Configuration Not Found....${CLEAR}"
echo -e "${YELLOW}Configuring Sixth BitcoinGenX Node${CLEAR}"
sudo mkdir /home/bitcoingenx6/.bitcoingenx
sudo touch /home/bitcoingenx6/bitcoingenx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx6/bitcoingenx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx6/bitcoingenx.conf
echo "rpcallowip=127.0.0.1" >> /home/bitcoingenx6/bitcoingenx.conf
echo "server=1" >> /home/bitcoingenx6/bitcoingenx.conf
echo "daemon=1" >> /home/bitcoingenx6/bitcoingenx.conf
echo "maxconnections=250" >> /home/bitcoingenx6/bitcoingenx.conf
echo "masternode=1" >> /home/bitcoingenx6/bitcoingenx.conf
echo "rpcport=19027" >> /home/bitcoingenx6/bitcoingenx.conf
echo "listen=0" >> /home/bitcoingenx6/bitcoingenx.conf
echo "externalip=[${MNIP6}]:4488" >> /home/bitcoingenx6/bitcoingenx.conf
echo "masternodeprivkey=$MNKEY6" >> /home/bitcoingenx6/bitcoingenx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode6 : true" >> /usr/local/nullentrydev/bgx.log
echo "walletVersion6 : 1.4.0COINVERSION=1.6.0" >> /usr/local/nullentrydev/bgx.log
echo "scriptVersion6 : 0.99" >> /usr/local/nullentrydev/bgx.log
fi
else
echo
echo -e ${YELLOW}"Found /home/bitcoingenx6/bitcoingenx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Pre-stage for Sixth Node "${CLEAR}
MN6=0
fi
else
echo -e ${YELLOW}"Found /home/bitcoingenx6/.bitcoingenx/bitcoingenx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration for Sixth Node"${CLEAR}
fi
echo
if [ ! -f /home/bitcoingenx7/.bitcoingenx/bitcoingenx.conf ]; then
if [ ! -f /home/bitcoingenx7/bitcoingenx.conf ]; then
echo -e "${GREEN}Seventh BitcoinGenX Node Configuration Not Found....${CLEAR}"
echo -e "${YELLOW}Configuring Seventh BitcoinGenX Node${CLEAR}"
sudo mkdir /home/bitcoingenx7/.bitcoingenx
sudo touch /home/bitcoingenx7/bitcoingenx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx7/bitcoingenx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx7/bitcoingenx.conf
echo "rpcallowip=127.0.0.1" >> /home/bitcoingenx7/bitcoingenx.conf
echo "server=1" >> /home/bitcoingenx7/bitcoingenx.conf
echo "daemon=1" >> /home/bitcoingenx7/bitcoingenx.conf
echo "maxconnections=250" >> /home/bitcoingenx7/bitcoingenx.conf
echo "masternode=1" >> /home/bitcoingenx7/bitcoingenx.conf
echo "rpcport=19028" >> /home/bitcoingenx7/bitcoingenx.conf
echo "listen=0" >> /home/bitcoingenx7/bitcoingenx.conf
echo "externalip=[${MNIP7}]:4488" >> /home/bitcoingenx7/bitcoingenx.conf
echo "masternodeprivkey=$MNKEY7" >> /home/bitcoingenx7/bitcoingenx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode7 : true" >> /usr/local/nullentrydev/bgx.log
echo "walletVersion7 : 1.4.0COINVERSION=1.6.0" >> /usr/local/nullentrydev/bgx.log
echo "scriptVersion7 : 0.99" >> /usr/local/nullentrydev/bgx.log
fi
else
echo
echo -e ${YELLOW}"Found /home/bitcoingenx7/bitcoingenx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Pre-stage for Seventh Node "${CLEAR}
MN7=0
fi
else
echo -e ${YELLOW}"Found /home/bitcoingenx7/.bitcoingenx/bitcoingenx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration for Seventh Node"${CLEAR}
fi
echo
if [ ! -f /home/bitcoingenx8/.bitcoingenx/bitcoingenx.conf ]; then
if [ ! -f /home/bitcoingenx8/bitcoingenx.conf ]; then
echo -e "${GREEN}Eigth BitcoinGenX Node Configuration Not Found....${CLEAR}"
echo -e "${YELLOW}Configuring Eigth BitcoinGenX Node${CLEAR}"
sudo mkdir /home/bitcoingenx8/.bitcoingenx
sudo touch /home/bitcoingenx8/bitcoingenx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx8/bitcoingenx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx8/bitcoingenx.conf
echo "rpcallowip=127.0.0.1" >> /home/bitcoingenx8/bitcoingenx.conf
echo "server=1" >> /home/bitcoingenx8/bitcoingenx.conf
echo "daemon=1" >> /home/bitcoingenx8/bitcoingenx.conf
echo "maxconnections=250" >> /home/bitcoingenx8/bitcoingenx.conf
echo "masternode=1" >> /home/bitcoingenx8/bitcoingenx.conf
echo "rpcport=19029" >> /home/bitcoingenx8/bitcoingenx.conf
echo "listen=0" >> /home/bitcoingenx8/bitcoingenx.conf
echo "externalip=[${MNIP8}]:4488" >> /home/bitcoingenx8/bitcoingenx.conf
echo "masternodeprivkey=$MNKEY8" >> /home/bitcoingenx8/bitcoingenx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode8 : true" >> /usr/local/nullentrydev/bgx.log
echo "walletVersion8 : 1.4.0COINVERSION=1.6.0" >> /usr/local/nullentrydev/bgx.log
echo "scriptVersion8 : 0.99" >> /usr/local/nullentrydev/bgx.log
fi
else
echo
echo -e ${YELLOW}"Found /home/bitcoingenx8/bitcoingenx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Pre-stage for Eigth Node "${CLEAR}
MN8=0
fi
else
echo -e ${YELLOW}"Found /home/bitcoingenx8/.bitcoingenx/bitcoingenx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration for Eigth Node"${CLEAR}
fi
##
echo
if [ ! -f /home/bitcoingenx9/.bitcoingenx/bitcoingenx.conf ]; then
if [ ! -f /home/bitcoingenx9/bitcoingenx.conf ]; then
echo -e "${GREEN}Ninth BitcoinGenX Node Configuration Not Found....${CLEAR}"
echo -e "${YELLOW}Configuring Ninth BitcoinGenX Node${CLEAR}"
sudo mkdir /home/bitcoingenx9/.bitcoingenx
sudo touch /home/bitcoingenx9/bitcoingenx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx9/bitcoingenx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/bitcoingenx9/bitcoingenx.conf
echo "rpcallowip=127.0.0.1" >> /home/bitcoingenx9/bitcoingenx.conf
echo "server=1" >> /home/bitcoingenx9/bitcoingenx.conf
echo "daemon=1" >> /home/bitcoingenx9/bitcoingenx.conf
echo "maxconnections=250" >> /home/bitcoingenx9/bitcoingenx.conf
echo "masternode=1" >> /home/bitcoingenx9/bitcoingenx.conf
echo "rpcport=19030" >> /home/bitcoingenx9/bitcoingenx.conf
echo "listen=0" >> /home/bitcoingenx9/bitcoingenx.conf
echo "externalip=[${MNIP9}]:4488" >> /home/bitcoingenx9/bitcoingenx.conf
echo "masternodeprivkey=$MNKEY9" >> /home/bitcoingenx9/bitcoingenx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode9 : true" >> /usr/local/nullentrydev/bgx.log
echo "walletVersion9 : 1.4.0COINVERSION=1.6.0" >> /usr/local/nullentrydev/bgx.log
echo "scriptVersion9 : 0.99" >> /usr/local/nullentrydev/bgx.log
fi
else
echo
echo -e ${YELLOW}"Found /home/bitcoingenx9/bitcoingenx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Pre-stage for Ninth Node "${CLEAR}
MN8=0
fi
else
echo -e ${YELLOW}"Found /home/bitcoingenx9/.bitcoingenx/bitcoingenx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration for Ninth Node"${CLEAR}
fi
#
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
if [[ "$MN2" -eq "0" ]]; then
sudo cp -r /home/bitcoingenx/.bitcoingenx/* /home/bitcoingenx2/.bitcoingenx
rm /home/bitcoingenx2/.bitcoingenx/bitcoingenx.conf
cp -r /home/bitcoingenx2/bitcoingenx.conf /home/bitcoingenx2/.bitcoingenx/bitcoingenx.conf
sleep 1
fi
if [[ "$MN3" -eq "0" ]]; then
sudo cp -r /home/bitcoingenx/.bitcoingenx/* /home/bitcoingenx3/.bitcoingenx
rm /home/bitcoingenx3/.bitcoingenx/bitcoingenx.conf
cp -r /home/bitcoingenx3/bitcoingenx.conf /home/bitcoingenx3/.bitcoingenx/bitcoingenx.conf
sleep 1
fi
if [[ "$MN4" -eq "0" ]]; then
sudo cp -r /home/bitcoingenx/.bitcoingenx/* /home/bitcoingenx4/.bitcoingenx
rm /home/bitcoingenx4/.bitcoingenx/bitcoingenx.conf
cp -r /home/bitcoingenx4/bitcoingenx.conf /home/bitcoingenx4/.bitcoingenx/bitcoingenx.conf
sleep 1
fi
if [[ "$MN5" -eq "0" ]]; then
sudo cp -r /home/bitcoingenx/.bitcoingenx/* /home/bitcoingenx5/.bitcoingenx
rm /home/bitcoingenx5/.bitcoingenx/bitcoingenx.conf
cp -r /home/bitcoingenx5/bitcoingenx.conf /home/bitcoingenx5/.bitcoingenx/bitcoingenx.conf
sleep 1
fi
if [[ "$MN6" -eq "0" ]]; then
sudo cp -r /home/bitcoingenx/.bitcoingenx/* /home/bitcoingenx6/.bitcoingenx
rm /home/bitcoingenx6/.bitcoingenx/bitcoingenx.conf
cp -r /home/bitcoingenx6/bitcoingenx.conf /home/bitcoingenx6/.bitcoingenx/bitcoingenx.conf
sleep 1
fi
if [[ "$MN7" -eq "0" ]]; then
sudo cp -r /home/bitcoingenx/.bitcoingenx/* /home/bitcoingenx7/.bitcoingenx
rm /home/bitcoingenx7/.bitcoingenx/bitcoingenx.conf
cp -r /home/bitcoingenx7/bitcoingenx.conf /home/bitcoingenx7/.bitcoingenx/bitcoingenx.conf
sleep 1
fi
if [[ "$MN8" -eq "0" ]]; then
sudo cp -r /home/bitcoingenx/.bitcoingenx/* /home/bitcoingenx8/.bitcoingenx
rm /home/bitcoingenx8/.bitcoingenx/bitcoingenx.conf
cp -r /home/bitcoingenx8/bitcoingenx.conf /home/bitcoingenx8/.bitcoingenx/bitcoingenx.conf
sleep 1
fi
if [[ "$MN9" -eq "0" ]]; then
sudo cp -r /home/bitcoingenx/.bitcoingenx/* /home/bitcoingenx9/.bitcoingenx
rm /home/bitcoingenx9/.bitcoingenx/bitcoingenx.conf
cp -r /home/bitcoingenx9/bitcoingenx.conf /home/bitcoingenx9/.bitcoingenx/bitcoingenx.conf
sleep 1
fi
echo -e ${YELLOW}"Launching First BGX Node"${CLEAR}
bitcoingenxd -datadir=/home/bitcoingenx/.bitcoingenx -daemon
sleep 10
echo -e ${YELLOW}"Launching Second BGX Node"${CLEAR}
bitcoingenxd -datadir=/home/bitcoingenx2/.bitcoingenx -daemon
sleep 10
echo -e ${YELLOW}"Launching Third BGX Node"${CLEAR}
bitcoingenxd -datadir=/home/bitcoingenx3/.bitcoingenx -daemon
sleep 10
echo -e ${YELLOW}"Launching Fourth BGX Node"${CLEAR}
bitcoingenxd -datadir=/home/bitcoingenx4/.bitcoingenx -daemon
sleep 10
echo -e ${YELLOW}"Launching Fifth BGX Node"${CLEAR}
bitcoingenxd -datadir=/home/bitcoingenx5/.bitcoingenx -daemon
sleep 10
echo -e ${YELLOW}"Launching Sixth BGX Node"${CLEAR}
bitcoingenxd -datadir=/home/bitcoingenx6/.bitcoingenx -daemon
sleep 10
echo -e ${YELLOW}"Launching Seventh BGX Node"${CLEAR}
bitcoingenxd -datadir=/home/bitcoingenx7/.bitcoingenx -daemon
sleep 10
echo -e ${YELLOW}"Launching Eigth BGX Node"${CLEAR}
bitcoingenxd -datadir=/home/bitcoingenx8/.bitcoingenx -daemon
sleep 10
echo -e ${YELLOW}"Launching Ninth BGX Node"${CLEAR}
bitcoingenxd -datadir=/home/bitcoingenx9/.bitcoingenx -daemon
sleep 10
echo -e ${BOLD}"All ${NODESN} BGX Nodes Launched".${CLEAR}
echo

echo -e "${GREEN}You can check the status of your BGX Masternode with"${CLEAR}
echo -e "${YELLOW}For mn1: \"bitcoingenx-cli -datadir=/home/bitcoingenx/.bitcoingenx masternode status\""${CLEAR}
echo -e "${YELLOW}For mn2: \"bitcoingenx-cli -datadir=/home/bitcoingenx2/.bitcoingenx masternode status\""${CLEAR}
echo -e "${YELLOW}For mn3: \"bitcoingenx-cli -datadir=/home/bitcoingenx3/.bitcoingenx masternode status\""${CLEAR}
echo -e "${YELLOW}For mn4: \"bitcoingenx-cli -datadir=/home/bitcoingenx4/.bitcoingenx masternode status\""${CLEAR}
echo -e "${YELLOW}For mn5: \"bitcoingenx-cli -datadir=/home/bitcoingenx5/.bitcoingenx masternode status\""${CLEAR}
echo -e "${YELLOW}For mn6: \"bitcoingenx-cli -datadir=/home/bitcoingenx6/.bitcoingenx masternode status\""${CLEAR}
echo -e "${YELLOW}For mn7: \"bitcoingenx-cli -datadir=/home/bitcoingenx7/.bitcoingenx masternode status\""${CLEAR}
echo -e "${YELLOW}For mn8: \"bitcoingenx-cli -datadir=/home/bitcoingenx8/.bitcoingenx masternode status\""${CLEAR}
echo -e "${YELLOW}For mn9: \"bitcoingenx-cli -datadir=/home/bitcoingenx9/.bitcoingenx masternode status\""${CLEAR}
echo
echo -e "${RED}Status 29 may take a few minutes to clear while the daemon processes the chainstate"${CLEAR}
echo -e "${GREEN}The data below needs to be in your local masternode configuration file:${CLEAR}"
echo -e "${BOLD} Masternode - \#1 IP: [${MNIP1}]:4488${CLEAR}"
echo -e "${BOLD} Masternode - \#2 IP: [${MNIP2}]:4488${CLEAR}"
echo -e "${BOLD} Masternode - \#3 IP: [${MNIP3}]:4488${CLEAR}"
echo -e "${BOLD} Masternode - \#4 IP: [${MNIP4}]:4488${CLEAR}"
echo -e "${BOLD} Masternode - \#5 IP: [${MNIP5}]:4488${CLEAR}"
echo -e "${BOLD} Masternode - \#6 IP: [${MNIP6}]:4488${CLEAR}"
echo -e "${BOLD} Masternode - \#7 IP: [${MNIP7}]:4488${CLEAR}"
echo -e "${BOLD} Masternode - \#8 IP: [${MNIP8}]:4488${CLEAR}"
echo -e "${BOLD} Masternode - \#9 IP: [${MNIP9}]:4488${CLEAR}"
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
