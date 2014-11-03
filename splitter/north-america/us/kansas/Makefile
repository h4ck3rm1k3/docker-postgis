build :
	sudo docker build -t osmsplitter_north-america_us_kansas  . 

shell:
	-sudo docker rm osmsplitter_north-america_us_kansas
	sudo docker run --name osmsplitter_north-america_us_kansas -i -t --link pgroute:db osmsplitter_north-america_us_kansas  /bin/bash -i

shell2:
	sudo docker start  osmsplitter_north-america_us_kansas 
	sudo docker attach  osmsplitter_north-america_us_kansas 

runimport: build
	sudo docker run  -i -t --link pgroute:db osmsplitter_north-america_us_kansas /bin/bash /var/lib/splitter/north-america/us/kansas/runimport.sh

server:
	sudo docker run --name osmsplitter_north-america_us_kansas --link pgroute:db -t osmsplitter_north-america_us_kansas

extract:
	sudo docker cp osmsplitter_north-america_us_kansas:/var/lib/splitter/north-america/us/kansas/kansas-latest.osm.pbf /tmp/
