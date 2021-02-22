FROM memcached:1.4

USER root

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y iputils-ping
RUN apt-get install -y vnstat
RUN service vnstat start

USER memcache
