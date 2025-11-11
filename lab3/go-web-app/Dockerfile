FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY .. .
RUN go build -o main .

FROM alpine:3.21.3
WORKDIR /app
RUN addgroup -S mygrp && adduser -S myuser -G mygrp
COPY --from=builder /app/main .
RUN chmod +x main && chown myuser:mygrp main
USER myuser
CMD ["./main"]
