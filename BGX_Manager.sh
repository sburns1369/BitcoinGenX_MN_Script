#!/bin/bash
declare -i NC BGX BGXC BGXOld BGXMN0 BGXMN1 BGXMN2 BGXMN3 BGXMN4 BGXMN5 BGXMN6 BGXMN7 BGXMN8
#Counter
NC=0
#Coin MN found 0 false 1 true
BGX=0
#Masternode Counter
BGXC=0
#Coinname Lowercase
COINl=bitcoingenx
#Coin ticket symbol
COIN3=BGX
#path to NullEntryDev stuff
DPATH=/usr/local/nullentrydev/
IPATH=/home/bitcoingenx
COINCORE=.bitcoingenx
#IPCHECK
REGEX4='^([0-9]{0,3}:){1,7}[0-9a-fA-F]{0,4}$'
REGEX6='^([0-9a-fA-F]{0,4}:){1,7}[0-9a-fA-F]{0,4}$'
BLUE='\033[0;96m'
GREEN='\033[0;92m'
RED='\033[0;91m'
YELLOW='\033[0;93m'
CLEAR='\033[0m'
#Pause
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}
#Main menu
show_mainMenu() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo " M A I N - M E N U"
	echo "~~~~~~~~~~~~~~~~~~~~~"
  echo "1 - My Masternodes Status"
	echo "X - Exit"
}
# root menu - read options
read_MainMenuOptions(){
	local choice
	read -p "Enter choice " choice
	case $choice in
		1) find_BGXMasternodes ;;
		2) status_BGXMasternodes ;;
		x) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}
find_BGXMasternodes(){
  clear
  BGX=0
  #Old node check
  if [ -d /home/${COINl} ]; then
      echo -e ${GREEN}"Found BGX Legacy MN Installation Found - /home/${COINl}" ${CLEAR}
      bitcoingenx-cli -datadir=${IPATH}/${COINCORE} masternode status &> ${DPATH}BGXMN.tmp
        if grep -q "Hot node, waiting for remote activation" ${DPATH}BGXMN.tmp; then
          echo -e ${YELLOW} "Masternode Ready, waiting for activation from Wallet" ${CLEAR}
        elif grep -q "Loading block index..." ${DPATH}BGXMN.tmp; then
        echo -e ${YELLOW} "Masternode is still loading block Index, please wait." ${CLEAR}
        elif grep -q "Masternode successfully started" ${DPATH}BGXMN.tmp; then
          echo -e ${GREEN} "Masternode Successfully Started" ${CLEAR}
          bitcoingenx-cli -datadir=${IPATH}/${COINCORE} masternode status &> ${DPATH}BGXMN.tmp
          DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN.tmp | cut -d'"' -f4 | cut -d':' -f1)
            if [[ "$DISPIP" =~ (([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5]))$ ]]; then
              echo -e "Running on IPv4 :${YELLOW} ${DISPIP}" ${CLEAR}
            else
            DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN.tmp | cut -d'"' -f4 | cut -d':' -f1-8)
              echo -e "Running on IPv6 : ${YELLOW} ${DISPIP}" ${CLEAR}
            fi
          rm -r /usr/local/nullentrydev/BGXMN.tmp
  #        echo "Running on IP : ${DISPIP}"
        fi
  BGXOld="1"
  BGX=$BGX+1
  else
    echo -e ${RED}"No Installation Found for Classless Masternode - /home/${COINl}" ${CLEAR}
    echo "This may be normal for scripts pre 1.0" ${CLEAR}
    BGXMNOld="0"
  fi
  echo
  #end Old node check
#1 node check
if [ -d /home/${COINl}1 ]; then
    echo -e ${GREEN}"Found BGX-1  Installation Found - /home/${COINl}1" ${CLEAR}
    bitcoingenx-cli -datadir=${IPATH}1/${COINCORE} masternode status &> ${DPATH}BGXMN1.tmp
      if grep -q "Hot node, waiting for remote activation" ${DPATH}BGXMN1.tmp; then
        echo -e ${YELLOW} "Masternode Ready, waiting for activation from Wallet" ${CLEAR}
      elif grep -q "Loading block index..." ${DPATH}BGXMN1.tmp; then
      echo -e ${YELLOW} "Masternode is still loading block Index, please wait." ${CLEAR}
      elif grep -q "Masternode successfully started" ${DPATH}BGXMN1.tmp; then
        echo -e ${GREEN} "Masternode Successfully Started" ${CLEAR}
        bitcoingenx-cli -datadir=${IPATH}1/${COINCORE} masternode status &> ${DPATH}BGXMN1.tmp
        DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN1.tmp | cut -d'"' -f4 | cut -d':' -f1)
          if [[ "$DISPIP" =~ (([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5]))$ ]]; then
            echo -e "Running on IPv4 :${YELLOW} ${DISPIP}"${CLEAR}
          else
          DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN1.tmp | cut -d'"' -f4 | cut -d':' -f1-8)
            echo -e "Running on IPv6 :${YELLOW} ${DISPIP}" ${CLEAR}
          fi
        rm -r /usr/local/nullentrydev/BGXMN1.tmp
#        echo "Running on IP : ${DISPIP}"
      fi
BGXMN1="1"
BGX=$BGX+1
else
  echo -e ${RED}"No Installation Found for Masternode 1 - /home/${COINl}1" ${CLEAR}
  echo -e "This may be normal BGX-1 is Script 1.0 and newer Masternode" ${CLEAR}
  BGXMN1="0"
fi
echo
#end 1 node check
#2 node check
if [ -d /home/${COINl}2 ]; then
    echo -e ${GREEN}"Found BGX-2  Installation Found - /home/${COINl}2" ${CLEAR}
    bitcoingenx-cli -datadir=${IPATH}2/${COINCORE} masternode status &> ${DPATH}BGXMN2.tmp
      if grep -q "Hot node, waiting for remote activation" ${DPATH}BGXMN2.tmp; then
        echo -e ${YELLOW} "Masternode Ready, waiting for activation from Wallet" ${CLEAR}
      elif grep -q "Loading block index..." ${DPATH}BGXMN2.tmp; then
      echo -e ${YELLOW} "Masternode is still loading block Index, please wait." ${CLEAR}
      elif grep -q "Masternode successfully started" ${DPATH}BGXMN2.tmp; then
        echo -e ${GREEN} "Masternode Successfully Started" ${CLEAR}
        bitcoingenx-cli -datadir=${IPATH}2/${COINCORE} masternode status &> ${DPATH}BGXMN2.tmp
        DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN2.tmp | cut -d'"' -f4 | cut -d':' -f1)
          if [[ "$DISPIP" =~ (([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5]))$ ]]; then
            echo -e "Running on IPv4 :${YELLOW} ${DISPIP}"${CLEAR}
          else
          DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN2.tmp | cut -d'"' -f4 | cut -d':' -f1-8)
            echo -e "Running on IPv6 :${YELLOW} ${DISPIP}" ${CLEAR}
          fi
        rm -r /usr/local/nullentrydev/BGXMN2.tmp
#        echo "Running on IP : ${DISPIP}"
      fi
BGXMN2="1"
BGX=$BGX+1
else
  echo -e ${RED}"No Installation Found for Masternode 2 - /home/${COINl}2"${CLEAR}
  BGXMN2="0"
fi
echo
#end 2 node check
#3 node check
if [ -d /home/${COINl}3 ]; then
    echo -e ${GREEN}"Found BGX-3  Installation Found - /home/${COINl}3" ${CLEAR}
    bitcoingenx-cli -datadir=${IPATH}3/${COINCORE} masternode status &> ${DPATH}BGXMN3.tmp
      if grep -q "Hot node, waiting for remote activation" ${DPATH}BGXMN3.tmp; then
        echo -e ${YELLOW} "Masternode Ready, waiting for activation from Wallet" ${CLEAR}
      elif grep -q "Loading block index..." ${DPATH}BGXMN3.tmp; then
      echo -e ${YELLOW} "Masternode is still loading block Index, please wait." ${CLEAR}
      elif grep -q "Masternode successfully started" ${DPATH}BGXMN3.tmp; then
        echo -e ${GREEN} "Masternode Successfully Started" ${CLEAR}
        bitcoingenx-cli -datadir=${IPATH}3/${COINCORE} masternode status &> ${DPATH}BGXMN3.tmp
        DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN3.tmp | cut -d'"' -f4 | cut -d':' -f1)
          if [[ "$DISPIP" =~ (([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5]))$ ]]; then
            echo -e "Running on IPv4 :${YELLOW} ${DISPIP}"${CLEAR}
          else
          DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN3.tmp | cut -d'"' -f4 | cut -d':' -f1-8)
            echo -e "Running on IPv6 :${YELLOW} ${DISPIP}" ${CLEAR}
          fi
        rm -r /usr/local/nullentrydev/BGXMN3.tmp
#        echo "Running on IP : ${DISPIP}"
      fi
BGXMN3="1"
BGX=$BGX+1
else
  echo -e ${RED}"No Installation Found for Masternode 3 - /home/${COINl}3"${CLEAR}
  BGXMN3="0"
fi
echo
#end 3 node check
#4 node check
if [ -d /home/${COINl}4 ]; then
    echo -e ${GREEN}"Found BGX-4  Installation Found - /home/${COINl}4" ${CLEAR}
    bitcoingenx-cli -datadir=${IPATH}4/${COINCORE} masternode status &> ${DPATH}BGXMN4.tmp
      if grep -q "Hot node, waiting for remote activation" ${DPATH}BGXMN4.tmp; then
        echo -e ${YELLOW} "Masternode Ready, waiting for activation from Wallet" ${CLEAR}
      elif grep -q "Loading block index..." ${DPATH}BGXMN4.tmp; then
      echo -e ${YELLOW} "Masternode is still loading block Index, please wait." ${CLEAR}
      elif grep -q "Masternode successfully started" ${DPATH}BGXMN4.tmp; then
        echo -e ${GREEN} "Masternode Successfully Started" ${CLEAR}
        bitcoingenx-cli -datadir=${IPATH}4/${COINCORE} masternode status &> ${DPATH}BGXMN4.tmp
        DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN4.tmp | cut -d'"' -f4 | cut -d':' -f1)
          if [[ "$DISPIP" =~ (([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5]))$ ]]; then
            echo -e "Running on IPv4 : ${YELLOW} ${DISPIP}" ${CLEAR}
          else
          DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN4.tmp | cut -d'"' -f4 | cut -d':' -f1-8)
            echo -e "Running on IPv6 : ${YELLOW} $DISPIP" ${CLEAR}
          fi
        rm -r /usr/local/nullentrydev/BGXMN4.tmp
#        echo "Running on IP : ${DISPIP}"
      fi
BGXMN4="1"
BGX=$BGX+1
else
  echo -e ${RED}"No Installation Found for Masternode 4 - /home/${COINl}4"${CLEAR}
  BGXMN4="0"
fi
echo
#end 4 node check
#5 node check
if [ -d /home/${COINl}5 ]; then
    echo -e ${GREEN}"Found BGX-5  Installation Found - /home/${COINl}5" ${CLEAR}
    bitcoingenx-cli -datadir=${IPATH}5/${COINCORE} masternode status &> ${DPATH}BGXMN5.tmp
      if grep -q "Hot node, waiting for remote activation" ${DPATH}BGXMN5.tmp; then
        echo -e ${YELLOW} "Masternode Ready, waiting for activation from Wallet" ${CLEAR}
      elif grep -q "Loading block index..." ${DPATH}BGXMN5.tmp; then
      echo -e ${YELLOW} "Masternode is still loading block Index, please wait." ${CLEAR}
      elif grep -q "Masternode successfully started" ${DPATH}BGXMN5.tmp; then
        echo -e ${GREEN} "Masternode Successfully Started" ${CLEAR}
        bitcoingenx-cli -datadir=${IPATH}5/${COINCORE} masternode status &> ${DPATH}BGXMN5.tmp
        DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN5.tmp | cut -d'"' -f4 | cut -d':' -f1)
          if [[ "$DISPIP" =~ (([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5]))$ ]]; then
            echo -e "Running on IPv4 :${YELLOW} ${DISPIP}"${CLEAR}
          else
          DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN5.tmp | cut -d'"' -f4 | cut -d':' -f1-8)
            echo "Running on IPv6 :${YELLOW} ${DISPIP}" ${CLEAR}
          fi
        rm -r /usr/local/nullentrydev/BGXMN5.tmp
#        echo "Running on IP : ${DISPIP}"
      fi
BGXMN5="1"
BGX=$BGX+1
else
  echo -e ${RED}"No Installation Found for Masternode 5 - /home/${COINl}5"${CLEAR}
  BGXMN5="0"
fi
echo
#end 5 node check
#6 node check
if [ -d /home/${COINl}6 ]; then
    echo -e ${GREEN}"Found BGX-6  Installation Found - /home/${COINl}6" ${CLEAR}
    bitcoingenx-cli -datadir=${IPATH}6/${COINCORE} masternode status &> ${DPATH}BGXMN6.tmp
      if grep -q "Hot node, waiting for remote activation" ${DPATH}BGXMN6.tmp; then
        echo -e ${YELLOW} "Masternode Ready, waiting for activation from Wallet" ${CLEAR}
      elif grep -q "Loading block index..." ${DPATH}BGXMN6.tmp; then
      echo -e ${YELLOW} "Masternode is still loading block Index, please wait." ${CLEAR}
      elif grep -q "Masternode successfully started" ${DPATH}BGXMN6.tmp; then
        echo -e ${GREEN} "Masternode Successfully Started" ${CLEAR}
        bitcoingenx-cli -datadir=${IPATH}6/${COINCORE} masternode status &> ${DPATH}BGXMN6.tmp
        DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN6.tmp | cut -d'"' -f4 | cut -d':' -f1)
          if [[ "$DISPIP" =~ (([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5]))$ ]]; then
            echo -e "Running on IPv4 :${YELLOW} ${DISPIP}"${CLEAR}
          else
          DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN6.tmp | cut -d'"' -f4 | cut -d':' -f1-8)
            echo "Running on IPv6 :${YELLOW} ${DISPIP}" ${CLEAR}
          fi
        rm -r /usr/local/nullentrydev/BGXMN6.tmp
#        echo "Running on IP : ${DISPIP}"
      fi
BGXMN6="1"
BGX=$BGX+1
else
  echo -e ${RED}"No Installation Found for Masternode 6 - /home/${COINl}6"${CLEAR}
  BGXMN6="0"
fi
echo
#end 6 node check
#7 node check
if [ -d /home/${COINl}7 ]; then
    echo -e ${GREEN}"Found BGX-7  Installation Found - /home/${COINl}7" ${CLEAR}
    bitcoingenx-cli -datadir=${IPATH}7/${COINCORE} masternode status &> ${DPATH}BGXMN7.tmp
      if grep -q "Hot node, waiting for remote activation" ${DPATH}BGXMN7.tmp; then
        echo -e ${YELLOW} "Masternode Ready, waiting for activation from Wallet" ${CLEAR}
      elif grep -q "Loading block index..." ${DPATH}BGXMN7.tmp; then
      echo -e ${YELLOW} "Masternode is still loading block Index, please wait." ${CLEAR}
      elif grep -q "Masternode successfully started" ${DPATH}BGXMN7.tmp; then
        echo -e ${GREEN} "Masternode Successfully Started" ${CLEAR}
        bitcoingenx-cli -datadir=${IPATH}7/${COINCORE} masternode status &> ${DPATH}BGXMN7.tmp
        DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN7.tmp | cut -d'"' -f4 | cut -d':' -f1)
          if [[ "$DISPIP" =~ (([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5]))$ ]]; then
            echo -e "Running on IPv4 :${YELLOW} ${DISPIP}"${CLEAR}
          else
          DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN7.tmp | cut -d'"' -f4 | cut -d':' -f1-8)
            echo "Running on IPv6 :${YELLOW} ${DISPIP}" ${CLEAR}
          fi
        rm -r /usr/local/nullentrydev/BGXMN7.tmp
#        echo "Running on IP : ${DISPIP}"
      fi
BGXMN7="1"
BGX=$BGX+1
else
  echo -e ${RED}"No Installation Found for Masternode 7 - /home/${COINl}7"${CLEAR}
  BGXMN7="0"
fi
echo
#end 7 node check
#8 node check
if [ -d /home/${COINl}8 ]; then
    echo -e ${GREEN}"Found BGX-8  Installation Found - /home/${COINl}8" ${CLEAR}
    bitcoingenx-cli -datadir=${IPATH}8/${COINCORE} masternode status &> ${DPATH}BGXMN8.tmp
      if grep -q "Hot node, waiting for remote activation" ${DPATH}BGXMN8.tmp; then
        echo -e ${YELLOW} "Masternode Ready, waiting for activation from Wallet" ${CLEAR}
      elif grep -q "Loading block index..." ${DPATH}BGXMN8.tmp; then
      echo -e ${YELLOW} "Masternode is still loading block Index, please wait." ${CLEAR}
      elif grep -q "Masternode successfully started" ${DPATH}BGXMN8.tmp; then
        echo -e ${GREEN} "Masternode Successfully Started" ${CLEAR}
        bitcoingenx-cli -datadir=${IPATH}8/${COINCORE} masternode status &> ${DPATH}BGXMN8.tmp
        DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN8.tmp | cut -d'"' -f4 | cut -d':' -f1)
          if [[ "$DISPIP" =~ (([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5]))$ ]]; then
            echo -e "Running on IPv4 :${YELLOW} ${DISPIP}"${CLEAR}
          else
          DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN8.tmp | cut -d'"' -f4 | cut -d':' -f1-8)
            echo "Running on IPv6 :${YELLOW} ${DISPIP}" ${CLEAR}
          fi
        rm -r /usr/local/nullentrydev/BGXMN8.tmp
#        echo "Running on IP : ${DISPIP}"
      fi
BGXMN8="1"
BGX=$BGX+1
else
  echo -e ${RED}"No Installation Found for Masternode 8 - /home/${COINl}8"${CLEAR}
  BGXMN8="0"
fi
echo
#end 8 node check
#9 node check
if [ -d /home/${COINl}9 ]; then
    echo -e ${GREEN}"Found BGX-9  Installation Found - /home/${COINl}9" ${CLEAR}
    bitcoingenx-cli -datadir=${IPATH}9/${COINCORE} masternode status &> ${DPATH}BGXMN9.tmp
      if grep -q "Hot node, waiting for remote activation" ${DPATH}BGXMN9.tmp; then
        echo -e ${YELLOW} "Masternode Ready, waiting for activation from Wallet" ${CLEAR}
      elif grep -q "Loading block index..." ${DPATH}BGXMN9.tmp; then
      echo -e ${YELLOW} "Masternode is still loading block Index, please wait." ${CLEAR}
      elif grep -q "Masternode successfully started" ${DPATH}BGXMN9.tmp; then
        echo -e ${GREEN} "Masternode Successfully Started" ${CLEAR}
        bitcoingenx-cli -datadir=${IPATH}9/${COINCORE} masternode status &> ${DPATH}BGXMN9.tmp
        DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN9.tmp | cut -d'"' -f4 | cut -d':' -f1)
          if [[ "$DISPIP" =~ (([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5]))$ ]]; then
            echo -e "Running on IPv4 :${YELLOW} ${DISPIP}"${CLEAR}
          else
          DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN9.tmp | cut -d'"' -f4 | cut -d':' -f1-8)
            echo "Running on IPv6 :${YELLOW} ${DISPIP}" ${CLEAR}
          fi
        rm -r /usr/local/nullentrydev/BGXMN9.tmp
#        echo "Running on IP : ${DISPIP}"
      fi
BGXMN9="1"
BGX=$BGX+1
else
  echo -e ${RED}"No Installation Found for Masternode 9 - /home/${COINl}9"${CLEAR}
  BGXMN9="0"
fi
echo
#end 9 node check
#10 node check
if [ -d /home/${COINl}0 ]; then
    echo -e ${GREEN}"Found BGX-10  Installation Found - /home/${COINl}0" ${CLEAR}
    bitcoingenx-cli -datadir=${IPATH}0/${COINCORE} masternode status &> ${DPATH}BGXMN0.tmp
      if grep -q "Hot node, waiting for remote activation" ${DPATH}BGXMN0.tmp; then
        echo -e ${YELLOW} "Masternode Ready, waiting for activation from Wallet" ${CLEAR}
      elif grep -q "Loading block index..." ${DPATH}BGXMN0.tmp; then
      echo -e ${YELLOW} "Masternode is still loading block Index, please wait." ${CLEAR}
      elif grep -q "Masternode successfully started" ${DPATH}BGXMN0.tmp; then
        echo -e ${GREEN} "Masternode Successfully Started" ${CLEAR}
        bitcoingenx-cli -datadir=${IPATH}0/${COINCORE} masternode status &> ${DPATH}BGXMN0.tmp
        DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN0.tmp | cut -d'"' -f4 | cut -d':' -f1)
          if [[ "$DISPIP" =~ (([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5]))$ ]]; then
            echo -e "Running on IPv4 :${YELLOW} ${DISPIP}"${CLEAR}
          else
          DISPIP=$(sed -n '4p' < /usr/local/nullentrydev/BGXMN0.tmp | cut -d'"' -f4 | cut -d':' -f1-8)
            echo "Running on IPv6 :${YELLOW} ${DISPIP}" ${CLEAR}
          fi
        rm -r /usr/local/nullentrydev/BGXMN0.tmp
#        echo "Running on IP : ${DISPIP}"
      fi
BGXMN0="1"
BGX=$BGX+1
else
  echo -e ${RED}"No Installation Found for Masternode 10  - /home/${COINl}0" ${CLEAR}
  BGXMN0="0"
fi
echo
#end 10 node check
echo -e ${GREEN} "Total ${COINl} nodes found : ${YELLOW} $BGX" ${CLEAR}
echo
pause
}
#Program Core
while true
do
	show_mainMenu
  read_MainMenuOptions
done
