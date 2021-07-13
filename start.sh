#!/bin/sh

export VERSION=${1:-11.1.0}
export BUILD=${2:-9615}
DEB=wps-office_${VERSION}.${BUILD}_amd64.deb

{
  echo "Downloading $DEB"

  cd build
  wget -c https://wdl1.cache.wps.cn/wps/download/ep/Linux2019/${BUILD}/${DEB}
}

docker-compose up -d

## to resolve `cannot connect to X server` problem
containerId=$(docker ps -l -q)
export container_hostname=$(docker inspect --format='{{ .Config.Hostname }}' $containerId)

xhost +host:$container_hostname
docker start $containerId
