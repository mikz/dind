FROM ubuntu:trusty
MAINTAINER michal.cichra@gmail.com

ENV DOCKER_VERSION 1.2.0
ADD apt-install /usr/local/bin/
RUN apt-install iptables apparmor wget \
 && wget https://get.docker.io/builds/Linux/x86_64/docker-${DOCKER_VERSION} -q -O /usr/local/bin/docker \
 && chmod +x /usr/local/bin/docker
ADD dind /usr/local/bin/

# Define additional metadata for our image.
VOLUME ["/var/lib/docker"]
ENTRYPOINT ["dind"]
CMD ["bash"]
