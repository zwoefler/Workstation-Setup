#!/bin/bash

flatpak_list_filter() {
    query="$1"
    output=$(flatpak list)
    echo "$output" | awk '{print $2}' | grep "$query"
}

# Start Microsoft Teams
teams &

# Read URLs from .env file
while read -r line; do
  urls+=("$line")
done < .env

# Start Firefox with multiple tabs
for url in "${urls[@]}"; do
  firefox -new-tab "$url" &
done

# Start Terminal
gnome-terminal &

# Start Obsidian
flatpak_list=("obsidian")
echo "EXECUTING OBSIDIAN"
for item in "${flatpak_list[@]}"
do
    result=$(flatpak_list_filter "$item")
    if [ -n "$result" ]; then
        flatpak run $result
    else
        echo "Item $item does not exist"
    fi
done


# Start Spotifyv
spotify &
