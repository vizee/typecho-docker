# !/bin/bash

set -e

pushd `dirname $0` > /dev/null

if [ ! -d app/ ]; then
    echo "downloading typecho"
    DOWNLOAD_URL=https://github.com/typecho/typecho/releases/download/v1.0-14.10.10-release/1.0.14.10.10.-release.tar.gz
    wget $DOWNLOAD_URL -O app.tar.gz
    tar xzf app.tar.gz
    mv build/ app/
fi

docker-compose build

popd > /dev/null
