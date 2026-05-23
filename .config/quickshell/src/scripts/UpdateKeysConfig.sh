#!/bin/bash

KEY=$1
VALUE=$2

FILE=~/Documents/dotFiles/config.json
FILE_TMP=~/Documents/dotFiles/tmp.json

# Commando to update values into config.json
jq ".$KEY = \"$VALUE\"" "$FILE" > "$FILE_TMP" && mv "$FILE_TMP" "$FILE"
