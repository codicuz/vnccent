FROM centos:7

ENV LANG="en_US.UTF-8"
ARG USERNAME="user"
ARG ROOT_PASS="toor2020"
ARG USER_PASS="resu2020"
ARG EXTRA_YUM_PACKAGES='sudo mc nmon iproute telnet vim'
ARG LOCALES='ru_RU.UTF-8 ru_RU.CP1251'

LABEL maintainer="Codicus" description="Centos VNC"

ADD ["src", "/src"]

RUN useradd $USERNAME; chmod +x /src/*.sh; \
  yum -y install epel-release; \
  yum -y update; \
  yum -y install i3* rxvt-unicode* tigervnc-server ${EXTRA_YUM_PACKAGES}; \
  yum clean all; rm -rfv /var/cache/yum; \
  /src/configure.sh; rm -rfv /src

RUN for locale in ${LOCALES}; \
  do localeARR=(${locale//./ }); \
  localedef -i ${localeARR[0]} -f ${localeARR[1]} ${locale}; done

USER $USERNAME

HEALTHCHECK --interval=60s --timeout=15s \
  CMD ss -lntp | grep -q ':5901'

CMD ["/startup.sh"]

WORKDIR /home/$USERNAME
EXPOSE 5901