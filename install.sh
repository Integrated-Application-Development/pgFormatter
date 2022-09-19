#!/bin/bash

source="$( cd "$( dirname "$0" )" && pwd )"
target=/var/www/html/pgFormatter
binary=/usr/local/bin/pg_format

pushd ${source}

rm -f ${binary}
perl Makefile.PL
make && make install

mkdir -p ${target}

cp -fp ${source}/icon_pgformatter.ico ${target}/
cp -fp ${source}/logo_pgformatter.png ${target}/

cp -fp ${binary} ${target}/pg_format.cgi
chmod +x ${target}/pg_format.cgi

chown apache.apache ${target}/*

popd