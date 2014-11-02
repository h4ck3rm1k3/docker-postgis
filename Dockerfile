FROM debian:sid
MAINTAINER James Michael DuPont <h4ck3rm1k3@thefr33.com>

           
#RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN echo "deb  http://ftp.utexas.edu/debian/ sid main contrib " > /etc/apt/sources.list
RUN echo "deb http://ftp.utexas.edu/debian/ experimental main" >> /etc/apt/sources.list
RUN apt-get -y update
RUN apt-get -y install aptitude locales
#RUN wget --quiet --no-check-certificate -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
#RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" >> /etc/apt/sources.list
#RUN apt-get -y update
#RUN apt-get -y upgrade


RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8


RUN aptitude -t experimental -y install postgresql-9.4-pgrouting postgis postgresql-9.4-postgis-2.1 postgresql-9.4 emacs-nox libgcc1 libstdc++6 libgdal1h postgis


run echo "host    all             all             127.0.0.1/32		trust" > /etc/postgresql/9.4/main/pg_hba.conf
run echo "host    all             all             ::1/128	        trust" >> /etc/postgresql/9.4/main/pg_hba.conf
run echo "local   all             all					trust" >> /etc/postgresql/9.4/main/pg_hba.conf
run echo "local   all             postgres				trust" >> /etc/postgresql/9.4/main/pg_hba.conf

#CMD cat /etc/postgresql/9.4/main/pg_hba.conf

RUN /etc/init.d/postgresql start

RUN createdb routing -U postgres -O postgres
#RUN psql -U postgres -d routing -c 'create extension postgis;'
#RUN psql -U postgres -d routing -c 'create extension pgrouting;'
#RUN psql -U postgres -d routing -c 'create extension hstore;'
#RUN psql -U postgres -d routing -c 'create extension "uuid-ossp";'



#RUN service postgresql start 
#RUN /bin/su postgres -c "createuser -d -s -r -l docker"
#RUN /bin/su postgres -c "psql postgres -c \"ALTER USER docker WITH ENCRYPTED PASSWORD 'docker'\"" 
#RUN service postgresql stop

#RUN echo "listen_addresses = '*'" >> /etc/postgresql/9.4/main/postgresql.conf
#RUN echo "port = 5432" >> /etc/postgresql/9.4/main/postgresql.conf

EXPOSE 5432

#ADD start.sh /start.sh
#RUN chmod 0755 /start.sh

#CMD ["/start.sh"]

