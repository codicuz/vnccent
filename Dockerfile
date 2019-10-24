FROM centos:7

ARG VNC_PASSWD="resu2020"

LABEL maintainer="Codicus" description="Centos VNC"

COPY ["src", "/src"]

RUN chmod -R +x /src; mkdir /root/.vnc; cp /src/xstartup /root/.vnc/xstartup; cp /src/startup.sh /; \
  /src/install.sh; /src/configure.sh; \
  chmod -R 600 /root/.vnc; chmod +x /root/.vnc/xstartup; rm -rfv /src

CMD ["/startup.sh"]