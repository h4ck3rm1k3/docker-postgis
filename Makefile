build :
	sudo docker build -t pgroute . 

shell:
	sudo docker run -i -t pgroute /bin/bash -i

server:
	sudo docker run --name pgroute  -t pgroute 

start :
	sudo docker start pgroute
