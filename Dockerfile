FROM centos-vnc:i3

ENV JAVA_HOME=/usr/java/latest
ENV LD_LIBRARY_PATH=/usr/lib/oracle/12.2/client64/lib:/usr/lib/oracle/12.2/client/lib
ENV TNS_ADMIN=/opt
ENV NLS_LANG=RUSSIAN_RUSSIA.AL32UTF8

COPY ["rootfs", "/"]

RUN yum -y install /distr/*.rpm; rm -rfv /distr/