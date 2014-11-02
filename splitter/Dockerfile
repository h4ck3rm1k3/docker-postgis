FROM debian:sid
MAINTAINER James Michael DuPont <h4ck3rm1k3@thefr33.com>
RUN echo "deb  http://ftp.utexas.edu/debian/ sid main contrib " > /etc/apt/sources.list
RUN echo "deb http://ftp.utexas.edu/debian/ experimental main" >> /etc/apt/sources.list
RUN apt-get -y update
RUN apt-get -y install aptitude locales
RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8

RUN echo "DEBEMAIL=h4ck3rm1k3@thefr33.com" > ~/.bash_aliases
RUN echo "DEBFULLNAME='James Michael DuPont'" >> ~/.bash_aliases

RUN apt-get -y -t experimental install git  cmake packaging-dev checkinstall libboost-graph-dev libpq-dev libexpat1-dev

RUN git config --global user.name "James Michael DuPont" 
RUN git config --global user.email "h4ck3rm1k3@thefr33.com"
RUN git config --global core.editor emacs-nox
RUN git config --global color.ui true

RUN echo 'Acquire::http { Proxy "http://172.17.42.1:3142"; };' >> /etc/apt/apt.conf.d/01proxy
RUN echo "deb-src  http://ftp.utexas.edu/debian/ sid main contrib " >> /etc/apt/sources.list
RUN echo "deb-src http://ftp.utexas.edu/debian/ experimental main" >> /etc/apt/sources.list
RUN apt-get -y update
RUN apt-get -y build-dep  -texperimental osmosis
RUN apt-get -t experimental -y install libjpeg62-turbo  emacs-nox libgcc1  proj-bin

RUN apt-get  -f -t experimental -y install libarmadillo4 libdap11 libdapclient3 libdapserver7 libepsilon1 libfreexl1 libgeos-c1 libhdf4-0-alt libhdf5-8
RUN apt-get -t experimental -y install `apt-cache depends libgdal1h | awk '/Depends:/{print$2}'`

RUN apt-get  -t experimental -y install apt-src 
RUN apt-get  -f -t experimental -y install libproj-dev libnetcdf-dev  netcdf-bin libjasper-dev libpng-dev libjpeg-dev libgif-dev libwebp-dev libhdf4-alt-dev libhdf5-dev libpcre3-dev libxerces-c-dev unixodbc-dev  doxygen d-shlibs libgeos-dev libmysqlclient-dev python-all-dev  python-numpy  libcurl4-gnutls-dev  libsqlite3-dev libogdi3.2-dev chrpath swig libproj-dev libdap-dev libxml2-dev libspatialite-dev  libepsilon-dev  libpoppler-private-dev liblzma-dev libopenjpeg-dev libarmadillo-dev libfreexl-dev  libkml-dev  liburiparser-dev
RUN apt-get -t experimental -y install `apt-cache depends osmium | awk '/Depends:/{print$2}'`

RUN mkdir -p /opt/libgdal1h && cd /opt/libgdal1h && apt-src  install libgdal1h && apt-src  build libgdal1h
RUN cd /opt/libgdal1h && dpkg -i *.deb

RUN apt-get -y build-dep -texperimental osmium
RUN apt-get -y install -texperimental libosmium-dev  
RUN apt-get -y install -texperimental libxml2-dev 

RUN mkdir -p /opt/ && cd /opt/ && git clone https://github.com/h4ck3rm1k3/osm-history-splitter.git
RUN cd /opt/osm-history-splitter/ && git pull origin master && autoreconf &&  ./configure && make

# osmosis
RUN mkdir -p /opt/ && cd /opt/ && git clone https://github.com/h4ck3rm1k3/osmosis.git
RUN cd /opt/osmosis/ && git pull origin master 
RUN cd /opt/osmosis/ && ./gradlew 
RUN cd /opt/osmosis/ && ./gradlew assemble



