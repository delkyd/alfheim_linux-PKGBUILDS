#!/usr/bin/bash

# get last pkgver
pkgver=$(curl -s "https://ftp.mozilla.org/pub/devedition/releases/" | awk -F'/' '/href.*releases\// {print $5}' | sort -Vr | head -n1)
echo "last FF-dev release: ${pkgver}"
[ "$1" == "-v" ] && exit 0
[ -e "PKGBUILD" ] || exit 1

sed -i -e "s/pkgver=.*/pkgver=${pkgver}/" ./PKGBUILD

#makepkg -g -f -p PKGBUILD
updpkgsums

makepkg --printsrcinfo >.SRCINFO

makepkg -scf

rm SHA512SUMS-*
