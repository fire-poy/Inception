# base operating system
FROM alpine:3.16.3

# installation of nginx
RUN apk update && \
	apk upgrade && \
	apk add nginx=1.22.1-r0

# LINE 13: creation of directory to store the certificate and ssl key
# LINE 14: Download tool for the creation of the SSL certificate
# LINE 15: SSL certificate and key creation
# LINE 17: Creating a folder to store nginx configuration files
RUN mkdir -p /etc/nginx/ssl && \
	apk add openssl && \
	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key \
	-subj "/C=CH/ST=VD/L=Lausanne/O=42/OU=42/CN=mpons.42.fr/UID=mpons" && \
	mkdir -p /var/run/nginx


RUN	mkdir -p /etc/nginx/wordpress

# copy the configuration file from the repository to the container
COPY conf/nginx.conf /etc/nginx/nginx.conf

# RUN apk add --no-cache tini
# # Tini is now available at /sbin/tini
# ENTRYPOINT ["/sbin/tini", "--"]

# Launch NGINX service in the foreground so that the container does not stop
CMD [ "nginx", "-g", "daemon off;" ]
