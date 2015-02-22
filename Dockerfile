# php ubuntu dockerfile

# pull base image
FROM dockerfile/ubuntu

RUN apt-get update
RUN apt-get -yq install curl apache2 libapache2-mod-php5 php5-mysql php5-gd php5-curl php-pear php-apc

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh && /bin/bash -l

