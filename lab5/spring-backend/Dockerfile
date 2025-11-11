FROM alpine AS builder

WORKDIR /app

RUN apk add maven --no-cache

COPY . .

RUN mvn package -DskipTests=true
###
FROM alpine

WORKDIR /app

RUN apk add openjdk21 --no-cache && \
    addgroup -S lab5 && \
    adduser -S lab5 -G lab5

USER lab5:lab5

COPY --from=builder /app/target/*.jar app.jar

CMD [ "java", "-jar", "app.jar" ] 