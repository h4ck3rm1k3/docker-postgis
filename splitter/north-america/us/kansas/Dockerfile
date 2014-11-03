FROM imposm3:latest
MAINTAINER James Michael DuPont <h4ck3rm1k3@thefr33.com>
VOLUME /var/lib/splitter/
RUN mkdir -p /var/lib/splitter/north-america/us/kansas 

# to download this:
#RUN cd /var/lib/splitter/north-america/us/kansas  && wget http://download.geofabrik.de/north-america/us/kansas-latest.osm.pbf

## to insert a copy 
add kansas-latest.osm.pbf /var/lib/splitter/north-america/us/kansas/kansas-latest.osm.pbf

#ENV PATH2 

#RUN PATH=$PATH://opt/osmosis/package/bin opt/golang/src/github.com/omniscale/imposm3/imposm3 import -connection postgis://docker:docker@db/routing \
#    -mapping /opt/golang/src/github.com/omniscale/imposm3/test/complete_db_mapping.json -read /var/lib/splitter/north-america/us/kansas/kansas-latest.osm.pbf -write

add runimport.sh /var/lib/splitter/north-america/us/kansas/runimport.sh
RUN chmod +x /var/lib/splitter/north-america/us/kansas/runimport.sh