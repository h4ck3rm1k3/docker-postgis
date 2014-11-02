FROM debian:sid
MAINTAINER James Michael DuPont <h4ck3rm1k3@thefr33.com>
RUN echo "deb  http://ftp.utexas.edu/debian/ sid main contrib " > /etc/apt/sources.list
RUN echo "deb http://ftp.utexas.edu/debian/ experimental main" >> /etc/apt/sources.list
RUN echo 'Acquire::http { Proxy "http://172.17.42.1:3142"; };' >> /etc/apt/apt.conf.d/01proxy
RUN echo "deb-src  http://ftp.utexas.edu/debian/ sid main contrib " >> /etc/apt/sources.list
RUN echo "deb-src http://ftp.utexas.edu/debian/ experimental main" >> /etc/apt/sources.list

RUN apt-get -y update
RUN apt-get -y install aptitude locales
RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8

RUN echo "DEBEMAIL=h4ck3rm1k3@thefr33.com" > ~/.bash_aliases
RUN echo "DEBFULLNAME='James Michael DuPont'" >> ~/.bash_aliases

RUN mkdir -p /opt/ && cd /opt/ && git clone   https://github.com/h4ck3rm1k3/imposm3.git