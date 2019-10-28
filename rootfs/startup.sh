#!/bin/sh -x

GOSU="/usr/local/bin/gosu-amd64"
DEFAULT_HOME="/opt/default/home/"
VNC_PASSWORD="${VNC_PASSWORD:-resu2020}"
VNC_GEOMETRY="${VNC_GEOMETRY:-1280x720}"

if [ -z "${HOME}" ] || [ "${HOME}" = "/" ]
then
 echo 'ERROR: Wrong ENV $HOME is set. Aborting'
 exit 1
fi

if [ -f ${GOSU} ] 
then
  id=$(id -u)
  echo "Creating user with uid $id."
  gosu-amd64 0 bash -c "useradd -u $id user"
else
  echo "Gosu is not present. Error"
  exit 1
fi

[ -d ${HOME}/.vnc ] || (
 echo "Info: Bootstrapping ${HOME} directory from ${DEFAULT_HOME}"
 mkdir -vp "${HOME}/.vnc"
 cp -var "${DEFAULT_HOME}/." "${DEFAULT_HOME}/.vnc" "${HOME}/"
 printf '%s\n' ${VNC_PASSWORD} ${VNC_PASSWORD} n | vncpasswd
)

# start VNC server

exec vncserver -fg -geometry ${VNC_GEOMETRY}
