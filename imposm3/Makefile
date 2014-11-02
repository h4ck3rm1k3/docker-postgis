
build :
	sudo docker build -t imposm3 . 

shell:
	sudo docker run  -i -t imposm3 --link pgroute:db /bin/bash -i

server:
	sudo docker run --name imposm3 --link pgroute:db -t imposm3
