#!/bin/bash
rm -rf pkg/
rm -rf src/
rm -rf backup/
rm backup-git-1.0-1-x86_64.pkg.tar.xz
rm backup-git-1.1-1-x86_64.pkg.tar.xz
pacman -Rs backup-git
clear
