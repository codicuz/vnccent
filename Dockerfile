FROM centos-vnc:i3

ENV JAVA_HOME=/usr/java/latest
ENV LD_LIBRARY_PATH=/usr/lib/oracle/12.2/client64/lib:/usr/lib/oracle/12.2/client/lib
ENV TNS_ADMIN=/opt
ENV NLS_LANG=RUSSIAN_RUSSIA.AL32UTF8

COPY ["rootfs", "/"]

RUN yum -y install zip unzip libaio libaio.i686 glibc.i686 java /distr/*.rpm; \
  yum clean all; rm -rfv /distr/
