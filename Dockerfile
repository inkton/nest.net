FROM inkton/nest.core

MAINTAINER nest.yt

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ADD start-app.sh /etc/my_init.d/

# set up package cache
RUN curl -o /tmp/packagescache.tar.gz https://dist.asp.net/packagecache/aspnetcore.packagecache-1.0.1-debian.8-x64.tar.gz && \
    mkdir /var/packagescache && cd /var/packagescache && \
    tar xvf /tmp/packagescache.tar.gz && \
    rm /tmp/packagescache.tar.gz && \
    apt-get update -y && apt-get install -y sudo git jq && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir /usr/local/tree && \
    git clone https://github.com/inkton/nest.git /usr/local/tree/nest && \
    git clone https://github.com/inkton/nester.git /usr/local/tree/nester && \
    pip install --upgrade pip virtualenv daemonize && \
    cd /usr/local/tree/nester && make install && \    
    chmod +x /etc/my_init.d/start-app.sh

# set env var for packages cache
ENV DOTNET_HOSTING_OPTIMIZATION_CACHE /var/packagescache

WORKDIR "/var/app"

EXPOSE 5000
