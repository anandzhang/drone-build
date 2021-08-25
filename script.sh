#!/bin/sh

curl \
    -X POST \
    -H "Authorization: Bearer ${PLUGIN_TOKEN}" \
    ${PLUGIN_SERVER}/api/repos/${PLUGIN_REPO}/builds?branch=${PLUGIN_BRANCH}
