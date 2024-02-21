FROM ubuntu:22.04

WORKDIR /workdir
COPY .bashrc /root/.bashrc

RUN <<EOF
    apt-get update
    apt install build-essential -y
    apt-get install python3 -y
    apt-get install python3-pip -y
    apt-get install git git-core -y
    apt-get install openssh-server -y
    apt-get install sudo -y
    apt-get install vim -y    
    apt-get install curl -y
    apt-get install wget -y    
    mkdir /workdir
    chmod 777 /workdir    
    mkdir -p /var/run/sshd
    useradd -rm -d /home/skuarch -s /bin/bash -g root -G sudo -u 1000 skuarch
    ln -s /workdir /home/skuarch
    cp /root/.bashrc /home/skuarch/.bashrc    
    echo 'skuarch:dragon3s12' | chpasswd
    echo "skuarch ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
    echo "skuarch ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/skuarch
    bash -i -c "source ~/.bashrc"
    service ssh restart
EOF

# RUN echo 'skuarch:dragon3s12' | chpasswd
# RUN mkdir -p /var/run/sshd

EXPOSE 8080 8888 9090 8181 22

VOLUME [ "/workdir" ]

CMD ["/usr/sbin/sshd", "-D"]