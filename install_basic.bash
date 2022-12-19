#!/bin/bash

Kazam () {
  if [ "`sudo dpkg -l | grep kazam | wc -l`" == 1 ]; 
then
  echo "Kazam Already installed!"
  else 
  	echo "installing Kazam"
  	echo  -ne "\n" | sudo add-apt-repository ppa:sylvain-pineau/kazam  >/dev/null
	sudo apt-get update >/dev/null
	sudo apt-get install kazam -y >/dev/null
	sudo apt-get install python3-cairo python3-xlib -y >/dev/null
	echo "Kazam installed"
fi
}
Skype (){
if [ "`sudo dpkg -l | grep skype | wc -l`" == 1 ]; 
then
  echo "skype Already installed!"
  else 
  	echo "installing skype"
	wget https://go.skype.com/skypeforlinux-64.deb -P /tmp/soft>/dev/null
	sudo apt-get install /tmp/soft/skypeforlinux-64.deb >/dev/null
	echo "skype installed"
fi
}
Slack (){
if [ "`sudo dpkg -l | grep slack | wc -l`" == 1 ]; 
then
  echo "slack Already installed!"
  else 
  	echo "installing slack"
	wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb -P /tmp/soft >/dev/null
	sudo apt-get install /tmp/soft/slack-desktop-*.deb >/dev/null
	echo "slack installed"
fi
}

Chrome (){
if [ "`sudo dpkg -l | grep chrome | wc -l`" == 1 ]; then
  echo "chrome Already installed!"
  else 
  	echo "installing chrome"
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp/soft >/dev/null
	sudo apt-get install /tmp/soft/google-chrome-stable_current_amd64.deb >/dev/null
	echo "chrome installed"
fi
}

Anydesk (){
if [ "`sudo dpkg -l | grep anydesk | wc -l`" == 1 ]; then
  echo "anydesk Already installed!"
  else 
  	echo "installing anydesk"
	wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add - >/dev/null
	echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list >/dev/null
	sudo apt-get update -y >/dev/null
	sudo apt-get install anydesk -y >/dev/null
	echo "anydesk installed"
fi
}

Owncloud () {
if [ "`sudo dpkg -l | grep owncloud | wc -l`" == 1 ]; then
  echo "owncloud  Already installed!"
  else 
  	echo "installing owncloud "
	
	wget -nv https://download.owncloud.com/desktop/ownCloud/stable/2.10/linux/Ubuntu_20.04/Release.key -O - | sudo apt-key add - >/dev/null
	echo 'deb https://download.owncloud.com/desktop/ownCloud/stable/2.10/linux/Ubuntu_20.04/ /' | sudo tee -a /etc/apt/sources.list.d/owncloud.list >/dev/null
	sudo apt-get update -y>/dev/null
	sudo apt-get install owncloud-client -y>/dev/null
	echo "owncloud  installed"
fi
}

soft=("Kazam" "Skype" "Slack" "Chrome" "Anydesk" "Owncloud")
mkdir -p /tmp/soft
for i in ${!soft[@]}; do
  read -p "Enter Y to install ${soft[$i]}: " reply
  if [ "`echo $reply | tr '[:upper:]' '[:lower:]'`" = "y" ]; then
  ${soft[$i]}
else
    echo "Skiping ${soft[$i]}"
fi
 
done
