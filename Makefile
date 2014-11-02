build :
	sudo docker build -t pgroute . 

shell:
	sudo docker run -i -t pgroute /bin/bash -i
