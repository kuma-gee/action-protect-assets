FROM alpine:3.20.3

RUN apk add --no-cache bash unzip

COPY unpack.sh /unpack.sh

ENTRYPOINT ["/unpack.sh"]
