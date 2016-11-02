FROM phusion/baseimage:0.9.19

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
    chmod +x /etc/my_init.d/start-app.sh

# set env var for packages cache
ENV DOTNET_HOSTING_OPTIMIZATION_CACHE /var/packagescache

WORKDIR "/var/app"

EXPOSE 5000
