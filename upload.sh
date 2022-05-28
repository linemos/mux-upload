#!/usr/bin/env bash

PATH_TO_MOVIES=${1}
printf "***\n\nPath to movies: ${PATH_TO_MOVIES}\n"

export $(grep -v '^#' .mux.env | xargs)

printf "***\n\nCreate an authanticated mux url\n"

RESPONSE=$(curl https://api.mux.com/video/v1/uploads \
  -X POST \
  -H "Content-Type: application/json" \
  -u ${MUX_TOKEN_ID}:${MUX_TOKEN_SECRET} \
  -d '{ "new_asset_settings": { "playback_policy": ["public"] }, "cors_origin": "*" }')

UPLOAD_URL=$(echo ${RESPONSE} | jq -r '.data.url')

printf "***\n\nUploading to url: ${UPLOAD_URL}\n"

for movie in $PATH_TO_MOVIES
do
  printf "Processing $movie file...\n"

  curl -X PUT -T ${movie} "${UPLOAD_URL}"

done

printf "***\n\nDone uploading movies...\n"
