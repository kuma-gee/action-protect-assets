FROM alpine:3.20.3

COPY entrypoint.sh /entrypoint.sh
COPY unpack.sh /unpack.sh

ENTRYPOINT ["/entrypoint.sh"]
