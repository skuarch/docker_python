> create image

docker build --no-cache -t python:latest .

> local nfs volumen

docker run --name python -i -t -p 8080:8080 -p 8888:8888 -p 9090:9090 -p 8181:8181 -p 22:22 -v $(readlink -f /home/skuarch/Docker/volumes/python):/workdir python

> before create /home/skuarch/Docker/volumes/python directory

sometimes is necesary to restart ssh server

> service ssh restart
> or 
> docker exec -it python service ssh restart

don't forget to delete the know hosts in case of errors

> rm -f .ssh/known_hosts