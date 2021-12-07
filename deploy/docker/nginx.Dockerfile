FROM nginx:alpine

COPY deploy/docker/conf.d/default.conf /etc/nginx/conf.d
COPY deploy/docker/genpass.sh /
COPY deploy/docker/allow-cloudflare.conf /etc/nginx/

RUN apk update
RUN apk add openssl

ARG BASIC_AUTH_USERNAME
ARG BASIC_AUTH_PASSWORD

RUN chmod +x /genpass.sh
RUN /genpass.sh