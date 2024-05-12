# Use the official MySQL image from the Docker Hub
FROM mysql:latest

# Environment variables
ENV MYSQL_DATABASE=studentdatabase
ENV MYSQL_ROOT_PASSWORD=root

# Add the content of the init.sql/ directory to your image
# All scripts in docker-entrypoint-initdb.d/ are automatically
# executed during container startup
WORKDIR /var/lib/mysql
COPY ./student.sql /docker-entrypoint-initdb.d/

