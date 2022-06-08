#!/bin/bash

if [[ -f forge-installer.jar ]]; then
	echo "forge-installer.jar is present, which indicates the pack is already installed."
	echo "Delete forge-installer.jar if you intended to install or if the previous installation stopped halfway."
	read -n 1 -s -r -p "Press any key to continue..."
	exit 1
fi

if [[ $(java -version 2>&1 | awk -F '"' '/version/ {print $2}') < "17" ]]; then 
	echo "Java is too old."
	exit 1
fi

mkdir mods
echo "Downloading modpack files..."
if command -v wget > /dev/null; then
	cat mods.csv | sed -r 's/\r//g' | sed -r 's/(.+),(.+)/-c "wget -c \1 -O \2"/g' | xargs -n2 bash
elif command -v curl > /dev/null; then
	cat mods.csv | sed -r 's/\r//g' | sed -r 's/(.+),(.+)/-c "curl -L -C - \1 -o \2"/g' | xargs -n2 bash
else
	echo "No downloading command found."
	echo "Install `curl` or `wget` and try again."
	exit 1
fi

echo "Installing server..."
java -jar forge-installer.jar --installServer

read -n 1 -s -r -p "Press any key to continue..."
