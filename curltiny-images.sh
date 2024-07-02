#!/bin/bash

input=$1

if [ -z "$input" ]; then
	echo is necessary specify a file
	exit 1
fi
response=$(curl --user api:API_KEY --data-binary @$input -i\
	https://api.tinify.com/shrink)
location=$(echo "$response" | grep -i "location:" | awk '{print $2}' | tr -d '\r')

if [ ! $location ]; then
	"Some error ocurred while trying to Download"
	exit 1 
fi

filename="tiny-$input"
wget -O $filename $location 

echo "Download finalizado"

