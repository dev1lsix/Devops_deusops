FROM alpine

WORKDIR /app

EXPOSE 3000

RUN apk add npm --no-cache && \
    addgroup -S lab5 && \
    adduser -S lab5 -G lab5
    
COPY package.json package.json

RUN npm install --force --legacy-peer-deps && \
    chown -R lab5:lab5 /app

USER lab5:lab5

COPY src    /app/src
COPY public /app/public

CMD [ "npm", "start" ]