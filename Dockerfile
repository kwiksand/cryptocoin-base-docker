FROM ubuntu:16.04

ENV GOSU_VERSION=1.10

RUN apt-get update && \
    apt-get install -y ntp git build-essential libssl-dev libdb-dev libdb++-dev libboost-all-dev libqrencode-dev autoconf automake pkg-config unzip curl wget make bsdmainutils autotools-dev libtool libevent-dev libgmp-dev jq && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:bitcoin/bitcoin && \
    apt-get update && \
    apt-get install -y libdb4.8-dev libdb4.8++-dev

# Install secp256k1 
RUN cd /root && \
    git clone https://github.com/bitcoin/secp256k1.git && \
    cd secp256k1 && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install

# Install GoSU
RUN cd /root && gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
  && curl -o /usr/local/bin/gosu -L https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-$(dpkg --print-architecture) \
    && curl -L https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-$(dpkg --print-architecture).asc | gpg --verify - /usr/local/bin/gosu \
    && chmod +x /usr/local/bin/gosu

# Install miniupnp
RUN cd /root && wget http://miniupnp.free.fr/files/download.php?file=miniupnpc-1.8.tar.gz && tar -zxf download.php\?file\=miniupnpc-1.8.tar.gz && cd miniupnpc-1.8/ && \
    make && make install && cd .. && rm -rf miniupnpc-1.8 download.php\?file\=miniupnpc-1.8.tar.gz
