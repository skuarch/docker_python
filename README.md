> create image

docker build --no-cache -t python:latest .

> mounting local volume

docker volume create python
docker run --name python -i -t -p 8080:8080 -v python:/workdir python

> local nfs volumen

docker run --name python -i -t -p 8080:8080 -v $(readlink -f /home/skuarch/Docker/volumes/python):/workdir python

> before create /home/skuarch/Docker/volumes/python directory
