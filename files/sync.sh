#!/bin/bash

curl -s -X GET -H "X-API-Key: $SYNCTHING_API" http://$SYNCTHING_URL:8384/rest/system/config | jq ".folders[] | select(.label | contains(\"$NAME\"))" | jq '.id' | sed 's/^/{\"{#FOLDER_ID}\":/;s/$/},/' | tr -cd '[:print:]' | sed 's/^/{\"data\":[/;s/,$/]}/'
