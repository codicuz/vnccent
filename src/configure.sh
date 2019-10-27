#!/bin/bash

echo "root:$ROOT_PASS" | chpasswd
echo "$USERNAME:$USER_PASS" | chpasswd
echo "$USERNAME ALL=(ALL) ALL" >> /etc/sudoers
chmod +x /src/*.sh
mkdir /home/$USERNAME/.vnc
cp /src/xstartup /home/$USERNAME/.vnc/xstartup
cp /src/.Xresources /home/$USERNAME/.Xresources
cp /src/startup.sh /
chown -R $USERNAME:$USERNAME /home/$USERNAME
chmod +x /home/$USERNAME/.vnc/xstartup;