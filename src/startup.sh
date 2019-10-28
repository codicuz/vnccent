#!/bin/bash -x

VNC_PASSWORD="${VNC_PASSWORD:-resu2020}"
VNC_GEOMETRY="${VNC_GEOMETRY:-800x600}"

if [ -z "${HOME}" ] || [ "${HOME}" = "/" ]
then
  echo 'ERROR: Wrong ENV $HOME is set. Aborting'
  exit 1
fi

echo "Info: make vnc password in ${HOME}/.vnc"
printf '%s\n' ${VNC_PASSWORD} ${VNC_PASSWORD} n | vncpasswd

exec vncserver -fg -geometry ${VNC_GEOMETRY}