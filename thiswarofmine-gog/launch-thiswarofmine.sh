#!/bin/bash

# This is a wrapper that works around the application's single-user design for multi-user systems.

set -e
set -u

game_dir="/opt/thiswarofmine-gog"
: ${XDG_DATA_HOME:=$HOME/.local/share}
user_dir="$XDG_DATA_HOME/thiswarofmine-gog"

make_user_dir() {
    echo "Creating a user directory for the game. This only needs to be done once, future runs will skip this step."

    mkdir -p "$user_dir/"

    # Read-only
    find "$game_dir/" -maxdepth 1 -print0 | xargs -0 ln -s -t "$user_dir/"

    echo "User directory has been created."
}

launch_game() {
    cd "$user_dir"
    ./KosovoLinux
}

if [ ! -d "$user_dir/Mods" ]
then
    echo "Updating user directory to v2 file layout"
    mv "$user_dir" "${user_dir}_v1"
fi

if [ ! -e "$user_dir/KosovoLinux" ]
then
    make_user_dir
fi

launch_game
