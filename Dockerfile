FROM ubuntu:22.04

RUN <<EOF
    apt-get update
    apt install build-essential -y
    apt-get install python3 -y
    apt install python3-pip -y
    mkdir /workdir
    chmod 777 /workdir
EOF

EXPOSE 8080

VOLUME [ "/workdir" ]