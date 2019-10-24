FROM centos:7

ARG VNC_PASSWD="resu2020"

LABEL maintainer="Codicus" description="Centos VNC"

COPY ["src", "/src"]

RUN chmod -R +x /src; mkdir /root/.vnc; cp /src/xstartup /root/.vnc/xstartup; cp /src/startup.sh /; \
  /src/install.sh; /src/configure.sh; \
  chmod -R 600 /root/.vnc; chmod +x /root/.vnc/xstartup; rm -rfv /src

HEALTHCHECK --interval=60s --timeout=15s \
 CMD ss -lntp | grep -q ':5900'

CMD ["/startup.sh"]

WORKDIR /root
EXPOSE 5900