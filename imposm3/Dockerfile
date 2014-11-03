FROM osmsplitter:latest
MAINTAINER James Michael DuPont <h4ck3rm1k3@thefr33.com>

# IMPOSM
RUN apt-get install -t experimental -y golang git mercurial libleveldb-dev libgeos-dev libgeos++-dev  python-nose python-psycopg2 python-shapely 
#postgis osmosis
RUN mkdir -p /opt/golang/src/github.com/omniscale/ && cd /opt/golang/src/github.com/omniscale/ && git clone https://github.com/jmikedupont/imposm3.git
ENV GOPATH /opt/golang/
RUN go get github.com/tools/godep
RUN make -C /opt/golang/src/github.com/omniscale/imposm3 build 
#install