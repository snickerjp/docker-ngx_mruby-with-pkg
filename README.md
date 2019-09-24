# docker-ngx_mruby-with-pkg
Dockernize Nginx+ngx_mruby with deb-Package

---

## How to build

### install docker-compose

**Not use already installed `docker-compose`**

* 01_install_docker-compose.sh

```sh
cat 01_install_docker-compose.sh
bash 01_install_docker-compose.sh
```

### build .deb package

* 02_build_deb_pkg.sh

```sh
cat 02_build_deb_pkg.sh
bash 02_build_deb_pkg.sh
```

### build Docker image

* 03_build_docker-ngx_mruby.sh

```sh
cat 03_build_docker-ngx_mruby.sh
bash 03_build_docker-ngx_mruby.sh
```
