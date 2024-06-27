FROM alpine

RUN apk update && apk upgrade

ENV BUILD_DEPS autoconf automake bash build-base file g++ gcc git libc-dev libtool linux-headers make pkgconf re2c

RUN apk add --update --no-cache --virtual .build-deps $BUILD_DEPS

WORKDIR /tmp/btcdeb

COPY . .

RUN ./autogen.sh

RUN ./configure

RUN make clean

RUN make

RUN make install
