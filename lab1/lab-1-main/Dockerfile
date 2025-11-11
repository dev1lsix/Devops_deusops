FROM alpine:3.14

RUN apk add --no-cache nginx \
    && addgroup -S nginxgroup \
    && adduser -S -G nginxgroup nginxuser \
    && chown -R nginxuser:nginxgroup /var/lib/nginx \
    && chown -R nginxuser:nginxgroup /var/log/nginx \
    && chown -R nginxuser:nginxgroup /etc/nginx \
    && chown -R nginxuser:nginxgroup /run/nginx

COPY ./default.conf /etc/nginx/http.d/
COPY ./nginx.conf /etc/nginx/

EXPOSE 80

USER nginxuser

VOLUME /var/lib/nginx/html


CMD ["nginx", "-g", "daemon off;"]

