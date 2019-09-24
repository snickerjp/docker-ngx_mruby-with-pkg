#/bin/bash

# Copy build_config.rb
copy ngx_mruby/build_config.rb ngx_mruby-package-builder/ngx_mruby/build_config.rb

# build deb for ubuntu1804
cd ngx_mruby-package-builder
docker-compose build ubuntu1804

docker images
cd ..
