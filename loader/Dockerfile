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

RUN mkdir -p /opt/ && cd /opt/ && git clone https://github.com/h4ck3rm1k3/osm2pgrouting.git
RUN cd /opt/osm2pgrouting/ && cmake .
RUN cd /opt/osm2pgrouting/ && make

# run the import
#./osm2pgrouting -conf mapconfig.xml -file inputdata.osm -dbname indianhills -user mdupont -host localhost -passwd test -clean

## Nominatim
RUN cd /opt/ && git clone https://github.com/openlawrence/Nominatim.git
RUN cd /opt/Nominatim



#RUN cd /opt/ && git clone https://github.com/h4ck3rm1k3/osm2pgrouting.git
#RUN mkdir -p /opt/ && cd /opt/ && git clone https://github.com/IndianHillsLawrence/saferoutes2school.git
