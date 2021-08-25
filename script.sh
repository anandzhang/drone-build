#!/bin/sh

curl \
    -X POST \
    -G \
    -H "Authorization: Bearer ${PLUGIN_TOKEN}" \
    -d "branch=${PLUGIN_BRANCH}&${PLUGIN_PARAMS//,/&}" \
    ${PLUGIN_SERVER}/api/repos/${PLUGIN_REPO}/builds
