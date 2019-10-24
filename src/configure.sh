#!/bin/bash

cp /etc/X11/Xresources /root/.Xresources
printf "$VNC_PASSWD" | vncpasswd -f > /root/.vnc/passwd
