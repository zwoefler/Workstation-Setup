#!/bin/bash

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

# Start Spotify
spotify &

# Start Terminal
gnome-terminal &

# Start Obsidian
obsidian &

