FROM ubuntu:18.04

ARG VERSION
ARG BUILD

COPY ./wps-office_${VERSION}.${BUILD}_amd64.deb /opt

RUN apt-get update && \
    apt-get install -y libxtst6 libfuse2 libgtk2.0-0 libcanberra-gtk-module libglu1-mesa xdg-utils libglapi-mesa libx11-xcb1 fonts-cns11643-sung gvfs gvfs-bin && \
    dpkg -i /opt/wps-office_${VERSION}.${BUILD}_amd64.deb && \
    rm /opt/wps-office_${VERSION}.${BUILD}_amd64.deb

