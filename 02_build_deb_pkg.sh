#/bin/bash

# Copy build_config.rb
cp ngx_mruby/build_config.rb ngx_mruby-package-builder/ngx_mruby/build_config.rb

# build deb for ubuntu1804
cd ngx_mruby-package-builder
docker-compose -p ngxmrubypackagebuilder build ubuntu1804

docker images
cd ..
