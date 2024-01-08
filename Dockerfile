ARG BUILD_FROM=alpine
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Copy data for add-on
COPY ./*.js /plejd/
COPY ./package.json /plejd/
COPY ./config.json /plejd/

ARG BUILD_ARCH

# Install Node
RUN apk add --no-cache jq
RUN \
  apk add --no-cache --virtual .build-dependencies \
  g++ \
  gcc \
  libc-dev \
  linux-headers \
  make \
  python3 \
  bluez \
  eudev-dev \
  zlib-dev \
  \
  && apk add --no-cache \
  git \
  nodejs \
  npm \
  dbus-dev \
  glib-dev 

WORKDIR /plejd
RUN npm install \
  --no-audit \
  --no-update-notifier \
  --unsafe-perm

COPY ./entrypoint.sh /plejd/
COPY ./options.data.tmpl /plejd/

ENTRYPOINT ["/bin/sh", "/plejd/entrypoint.sh"]