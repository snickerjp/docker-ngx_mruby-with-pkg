#/bin/bash

function my_error() {
    # エラー処理
    exit 1
}

# build deb for ubuntu1804
function build_docker_image() {
    docker build -t snickerjp/docker-ngx_mruby-with-pkg .
    docker images
}

# main

build_docker_image || my_error
