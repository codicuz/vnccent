#!/bin/bash

yum -y install epel-release
yum -y update
yum -y install sudo mc nmon iproute telnet vim i3* rxvt-unicode tigervnc-server tigervnc-server-minimal
yum clean all
