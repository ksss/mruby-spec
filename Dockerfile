FROM alpine
MAINTAINER ksss <co000ri@gmail.com>

RUN apk update && apk upgrade && apk add --no-cache make git ruby ruby-dev gcc bison musl-dev valgrind gdb

ADD . /mruby-spec
WORKDIR /mruby-spec

RUN make compile
