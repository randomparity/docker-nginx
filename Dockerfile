FROM randomparity/docker-supervisor:latest
MAINTAINER David Christensen <randomparity@gmail.com>

ENV LAST_UPDATE_SICKBEARD 2015-01-30

# Install prerequisites and clone the SickBeard repository
RUN DEBIAN_FRONTEND=noninteractive apt-get -q update && \
    DEBIAN_FRONTEND=noninteractive apt-get -qy upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -qy install nginx

# We've got everything we need so clear out the apt data
RUN DEBAIN_FRONTEND=noninteractive apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/tmp/* && \
    rm -rf /tmp/*

EXPOSE 80

# Copy the supervisord configuration files into the container
COPY nginx.conf /etc/supervisor/conf.d/nginx.conf
# RUN echo "user=www-data" >> /etc/supervisor/conf.d/apache.conf

# No need to setup a CMD directive since that was handled in the FROM container.
