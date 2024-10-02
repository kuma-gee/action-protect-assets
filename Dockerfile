FROM alpine:3.20.3

RUN apk add --no-cache bash unzip

# For some reason the installed packages are not available inside the entrypoint script ??
# COPY entrypoint.sh /entrypoint.sh

COPY unpack.sh /unpack.sh

ENTRYPOINT ["/unpack.sh"]
