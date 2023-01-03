FROM alpine:3.16.3 

RUN apk update
RUN apk add nginx
RUN apk add vim
RUN apk add curl
RUN mkdir -p /etc/nginx/ssl
RUN apk add openssl

#La commande req crée et traite principalement des demandes de certificats au format PKCS#10. 
#Elle peut en outre créer des certificats auto-signés.
#RUN openssl req -x509

