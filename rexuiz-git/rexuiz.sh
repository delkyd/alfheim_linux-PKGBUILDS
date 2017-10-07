#!/bin/bash

myname="$(basename "$0")"
engine="darkplaces-rm"
basedir="/usr/share/rexuiz"
variant="sdl"
grep -q server <(echo "$myname") && variant="dedicated"
exename="${engine}-${variant}"

exec "${exename}" -basedir "${basedir}" "$@"
