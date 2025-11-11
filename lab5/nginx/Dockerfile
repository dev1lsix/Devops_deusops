FROM alpine:3.18

RUN apk update && apk add --no-cache nginx

USER nginx:nginx

CMD [ "nginx",  "-g", "daemon off;" ]