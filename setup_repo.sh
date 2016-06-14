#!/bin/sh
set -ex

wget http://distribute.kde.org/kdeflatpak.asc
flatpak remote-add kde http://distribute.kde.org/flatpak-testing/ --gpg-import=kdeflatpak.asc
flatpak install kde org.kde.Platform
flatpak install kde org.kde.Sdk
