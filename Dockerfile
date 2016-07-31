FROM debian:jessie

#Based off of Daniel Alan Miller <dalanmiller@rethinkdb.com>'s Dockerfile

EXPOSE 28015 29015 8080

RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 1614552E5765227AEC39EFCFA7E00EF33A8F2399
RUN echo "deb http://download.rethinkdb.com/apt jessie main" > /etc/apt/sources.list.d/rethinkdb.list

ENV RETHINKDB_PACKAGE_VERSION 2.0.4~0jessie

RUN apt-get update \
  && apt-get install -y rethinkdb=$RETHINKDB_PACKAGE_VERSION \
  && rm -rf /var/lib/apt/lists/*

VOLUME ["/data"]

WORKDIR /data

CMD ["rethinkdb", "--bind", "all"]
