#!/bin/bash

echo "root:$ROOT_PASS" | chpasswd
echo "$USERNAME:$USER_PASS" | chpasswd
echo "$USERNAME ALL=(ALL) ALL" >> /etc/sudoers
cp /src/.Xresources /home/$USERNAME/.Xresources
printf "$VNC_PASSWD" | vncpasswd -f > /home/$USERNAME/.vnc/passwd
chown -R $USERNAME:$USERNAME /home/$USERNAM
chmod -R 600 /home/$USERNAME/.vnc
chmod 700 /home/$USERNAME/.vnc
chmod +x /home/$USERNAME/.vnc/xstartup;
localedef -i ru_RU -f UTF-8 ru_RU.UTF-8
localedef -i ru_RU -f CP1251 ru_RU.CP1251