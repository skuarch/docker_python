FROM ubuntu:22.04

WORKDIR /workdir

RUN <<EOF
    apt-get update
    apt install build-essential -y
    apt-get install python3 -y
    apt install python3-pip -y
    mkdir /workdir
    chmod 777 /workdir
    apt-get install -y openssh-server    
    useradd -rm -d /home/skuarch -s /bin/bash -g root -G sudo -u 1000 skuarch
EOF

RUN echo 'skuarch:dragon3s12' | chpasswd
RUN mkdir /var/run/sshd

EXPOSE 8080 22

VOLUME [ "/workdir" ]

# CMD ["/usr/sbin/sshd", "-D"]