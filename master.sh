#!/bin/bash
SCRIPTVERSION=008a
RUNVERSION=001
WALLET=MESxnZjA5TT7PEEo59kg5dBTZYGDdZDqf8
#setting varibles
COIN=Marc
COIN3l=marc
BUILDLOCATION=/usr/local/scriptdev/${COIN3l}
BUILDFILE=${COIN3l}v${SCRIPTVERSION}.bld
FILE=${BUILDLOCATION}/${BUILDFILE}
#Setting Colors
BLUE='\\033[0;96m'
GREEN='\\033[0;92m'
RED='\\033[0;91m'
YELLOW='\\033[0;93m'
#clear font
CLEAR='\\033[0m'
cd /
sudo mkdir -p ${BUILDLOCATION}
sudo rm ${BUILDLOCATION}/${BUILDFILE}
sudo touch ${BUILDLOCATION}/${BUILDFILE}
#Checking OS
sudo echo "#!/bin/bash" >> ${FILE}
sudo echo "#${SCRIPTVERSION}-${RUNVERSION}-$Coin NullEntryDev Script" >> ${FILE}
sudo echo "BLUE='\033[0;96m'" >> ${FILE}
sudo echo "GREEN='\033[0;92m'" >> ${FILE}
sudo echo "RED='\033[0;91m'" >> ${FILE}
sudo echo "YELLOW='\033[0;93m'" >> ${FILE}
#clear font
sudo echo "CLEAR='\033[0m'" >> ${FILE}
sudo echo if [[ \$\(lsb_release \-d\) != *16.04* ]]\; then >> ${FILE}
    sudo echo "echo -e ${RED}"The operating system is not Ubuntu 16.04. You must be running on ubuntu 16.04."\${CLEAR}" >> ${FILE}
  sudo echo exit 1 >> ${FILE}
sudo echo fi >> ${FILE}
#Menu to Confirm and Pull correct script
sudo echo echo >> ${FILE}
sudo echo echo >> ${FILE}
sudo echo echo -e \${BLUE}"NullEntry Masternode Installation"\${CLEAR} >> ${FILE}
sudo echo echo  >> ${FILE}
sudo echo echo  >> ${FILE}
sudo echo echo -e \${YELLOW}" For $Coin   Script Version:${SCRIPTVERSION}"\${CLEAR} >> ${FILE}
sudo echo echo -e \${YELLOW}"        Pre-Release Test"\${CLEAR} >> ${FILE}
sudo echo echo >> ${FILE}
sudo echo echo -e \${YELLOW}"Welcome to the $Coin Beta Automated Install Script by \${BLUE}NullEntry"\${CLEAR} >> ${FILE}
sudo echo echo -e \${RED}"THE SCRIPT IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND"\${CLEAR} >> ${FILE}
sudo echo echo -e \${YELLOW}"Durring this Process Please Hit [Enter] or Input What is Asked."\${CLEAR} >> ${FILE}
sudo echo echo >> ${FILE}
sudo echo echo -e \${GREEN}"Are you sure you want to install $COIN Masternode\(s\)\?"\${CLEAR} >> ${FILE}
sudo echo echo -e \${GREEN} "Press y for yes, and n for no followed by [ENTER]\:"\${CLEAR} >> ${FILE}
sudo echo read AGREE >> ${FILE}
sudo echo if [[ \$AGREE =~ \"y\" ]] \; then >> ${FILE}
sudo echo echo >> ${FILE}
sudo echo echo >> ${FILE}
sudo echo echo >> ${FILE}
sudo echo echo -e \${RED}"PLEASE READ"\${CLEAR} >> ${FILE}
# sudo  echo -e ${YELLOW}"Installing more then 2 Masternodes, Masternode may not function correctly"${CLEAR} >> ${FILE}
sudo echo echo -e \${YELLOW}"If you do not receive payment for multiple mastnodes, contact Support" \${CLEAR} >> ${FILE}
sudo echo echo -e \${YELLOW}"Find Sburns1369\#1584 on Discord - https://discord.gg/YhJ8v3g"\${CLEAR} >> ${FILE}
sudo echo echo >> ${FILE}
sudo echo echo -e \${GREEN}"Please enter the number \(1-2\) of $COIN Masternode\(s\)"\${CLEAR} >> ${FILE}
sudo echo echo -e \${GREEN}"you would like to install :"\${CLEAR} >> ${FILE}
sudo echo read NUMBER >> ${FILE}
sudo echo case \$NUMBER in >> ${FILE}
  sudo echo 1\)bash \<\(curl -Ls https://raw.githubusercontent.com/sburns1369/${COIN}_MN_Script/master/${COIN3l}_single.sh\)\;\; >> ${FILE}
  sudo echo 2\)bash \<\(curl -Ls https://raw.githubusercontent.com/sburns1369/${COIN}_MN_Script/master/${COIN3l}_2pack.sh\)\;\; >> ${FILE}
  sudo echo 3\)bash \<\(curl -Ls https://raw.githubusercontent.com/sburns1369/${COIN}_MN_Script/master/${COIN3l}_3pack.sh\)\;\; >> ${FILE}
sudo echo 4\)bash \<\(curl -Ls https://raw.githubusercontent.com/sburns1369/${COIN}_MN_Script/master/${COIN3l}_4pack.sh\)\;\; >> ${FILE}
sudo echo \*\)echo e \${RED}\"Invalid Option - Exiting Setup - Re-run to try again\"\${CLEAR}\;\; >> ${FILE}
sudo echo esac >> ${FILE}
sudo echo else >> ${FILE}
sudo echo echo -e "Exiting Setup!  You can re-run to try again" >> ${FILE}
sudo echo fi >> ${FILE}
echo 'End Run Cat Dump ~>' ${FILE}
cat ${FILE}
