FROM centos:7

LABEL maintainer="Codicus" description="Centos VNC"

#ARG EXTRA_YUM_PACKAGES='sudo mc nmon iproute telnet vim'
ARG LOCALES='ru_RU.UTF-8 ru_RU.CP1251'
ARG GOSU_RELEASE="1.11"
ARG LOCALES='ru_RU.UTF-8 ru_RU.CP1251'

RUN yum -y install epel-release; \
  yum -y install i3 rxvt-unicode* tigervnc-server ${EXTRA_YUM_PACKAGES}; \
  yum clean all; \
  rm -vrf /var/cache/yum

ADD rootfs /
ADD https://github.com/tianon/gosu/releases/download/${GOSU_RELEASE}/gosu-amd64 /opt

RUN chmod a+xs /opt/gosu-amd64; \
  for locale in ${LOCALES}; \
  do localeARR=(${locale//./ }); \
  localedef -i ${localeARR[0]} -f ${localeARR[1]} ${locale}; \
  done

CMD ["/startup.sh"]

HEALTHCHECK --interval=60s --timeout=15s\
 CMD ss -lntp | grep -q ':5901'

EXPOSE 5901
