#/bin/bash

function my_error() {
    # エラー処理
    exit 1
}

# Copy build_config.rb

function copy_build_config() {
    cp ngx_mruby/build_config.rb ngx_mruby-package-builder/ngx_mruby/build_config.rb
}

# build deb for ubuntu1804
function build_deb() {
    cd ngx_mruby-package-builder
    docker-compose -p ngxmrubypackagebuilder build ubuntu1804
    docker images
    cd ..
}

# main
copy_build_config && build_deb || my_error
