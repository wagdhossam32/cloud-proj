FROM httpd:2.4
RUN apt-get update && apt-get install -y libapache2-mod-php php php-mysql
COPY ./public-html/ /usr/local/apache2/htdocs/
