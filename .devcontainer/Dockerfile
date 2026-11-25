FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-terminal \
    tigervnc-standalone-server \
    tigervnc-common \
    novnc \
    websockify \
    dbus-x11 \
    x11-xserver-utils \
    firefox \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Google Chrome for the desktop browser (Urban VPN extension)
RUN apt-get update && apt-get install -y wget \
 && wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
 && apt-get install -y ./google-chrome-stable_current_amd64.deb \
 && rm -f google-chrome-stable_current_amd64.deb \
 && apt-get clean && rm -rf /var/lib/apt/lists/*
