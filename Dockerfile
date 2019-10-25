FROM centos:7

ENV LANG=ru_RU.UTF-8
ARG USERNAME="user"
ARG VNC_PASSWD="resu2020"
ARG ROOT_PASS="toor2020"
ARG USER_PASS="resu2020"

LABEL maintainer="Codicus" description="Centos VNC"

COPY ["src", "/src"]

RUN useradd $USERNAME; chmod +x /src/*.sh; mkdir /home/$USERNAME/.vnc; cp /src/xstartup /home/$USERNAME/.vnc/xstartup; cp /src/startup.sh /; \
  /src/install.sh; /src/configure.sh; \
  rm -rfv /src

USER $USERNAME

HEALTHCHECK --interval=60s --timeout=15s \
  CMD ss -lntp | grep -q ':5901'

CMD ["/startup.sh"]

WORKDIR /home/$USERNAME
EXPOSE 5901