build :
	sudo docker build -t osmsplitter . 

shell:
	# run and link to the running pgroute db
	sudo docker run  -i -t osmsplitter --link pgroute:db /bin/bash -i

server:
	sudo docker run --name osmsplitter --link pgroute:db -t osmsplitter
