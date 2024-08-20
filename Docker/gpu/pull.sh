#!/usr/bin/env bash

REPOSITORY="uwwee/isaac"
TAG="latest"

IMG="${REPOSITORY}:${TAG}"

docker pull "${IMG}"
