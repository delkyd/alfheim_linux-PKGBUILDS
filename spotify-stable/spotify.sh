#!/bin/sh
LD_PRELOAD=libcurl.so.3 /opt/spotify/spotify "$@"
