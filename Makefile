build :
	sudo docker build -t pgroute . 

shell:
	sudo docker run -P -i -t pgroute /bin/bash -i

server: build
	-sudo docker kill pgroute 
	-sudo docker rm pgroute 
	sudo docker run -P --name pgroute  -t pgroute 

start :
	sudo docker start -P pgroute
