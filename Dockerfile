FROM ubuntu:trusty
MAINTAINER michal.cichra@gmail.com

RUN apt-get update -q  \
 && apt-get install -qy iptables ca-certificates apt-transport-https apparmor \
 && echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list\
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9 \
 && apt-get update -q \
 && apt-get install -qy lxc-docker \
 && apt-get -q -y clean \
 && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

ADD dind /usr/local/bin/dind

# Define additional metadata for our image.
VOLUME ["/var/lib/docker"]
ENTRYPOINT ["dind"]
CMD ["bash"]
