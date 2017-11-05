FROM resin/armv7hf-debian

LABEL maintainer="syed.samiruddin@gmail.com"

RUN [ "cross-build-start" ]

RUN apt-get update && \
    apt-get install wget && \
    wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key && \
    apt-key add mosquitto-repo.gpg.key && \
    wget -P /etc/apt/sources.list.d/ http://repo.mosquitto.org/debian/mosquitto-jessie.list

RUN apt-get update && \
    apt-get install mosquitto

EXPOSE 1883

RUN [ "cross-build-end" ]

CMD ["/usr/sbin/mosquitto"]