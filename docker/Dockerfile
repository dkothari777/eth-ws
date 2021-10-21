# Downloaded from dockerhub
# https://hub.docker.com/layers/postgres/library/postgres/alpine3.14/images/sha256-b44c65c7ab83e08c24672b68fae053b363500b1f82302bd9e7191ab984c83fa8?context=explore
FROM postgres@sha256:b44c65c7ab83e08c24672b68fae053b363500b1f82302bd9e7191ab984c83fa8

RUN apk update
RUN apk add gzip

ADD data /data
ADD pg_scripts /docker-entrypoint-initdb.d

RUN cd /data/blocks/ && gzip -d *.tsv.gz

RUN cd /data/inputs/ && gzip -d *.tsv.gz

RUN cd /data/outputs/ && gzip -d *.tsv.gz

RUN cd /data/transactions/ && gzip -d *.tsv.gz
