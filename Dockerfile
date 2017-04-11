FROM inkton/nest.core

MAINTAINER nest.yt

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ADD start-app.sh /etc/my_init.d/

# set up the packages
RUN  sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list' && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893 && \
    apt-get update -y  && \
    apt-get install -y sudo git jq && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir /usr/local/tree && \
    git clone https://github.com/inkton/nest.git /usr/local/tree/nest && \
    chmod +x /etc/my_init.d/start-app.sh

WORKDIR "/var/app"

EXPOSE 5000
