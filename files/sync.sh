#!/bin/bash

function folder_parse() {

if [ "$1" == "folder" ]; then

    curl -s -X GET -H "X-API-Key: $SYNCTHING_API" http://$SYNCTHING_URL:8384/rest/system/config | jq ".folders[] | select(.label | contains(\"$NAME\"))" | jq '.id' | sed 's/^/{\"{#FOLDER_ID}\":/;s/$/},/' | tr -cd '[:print:]' | sed 's/^/{\"data\":[/;s/,$/]}/'

fi

}

function device_parse() {

if [ "$1" == "device" ]; then

    curl -s -X GET -H "X-API-Key: $SYNCTHING_API" http://$SYNCTHING_URL:8384/rest/system/config | jq ".devices[] | select(.deviceID | contains(\"$ID\"))" | jq -n '{data: [inputs|{ "{#DEVICE_NAME}": .name , "{#DEVICE_ID}": .deviceID }]}'

fi

}

folder_parse $1
device_parse $1