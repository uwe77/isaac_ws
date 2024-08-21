#!/usr/bin/env bash

REPOSITORY="uwwee/ubuntu"
TAG="isaacgym"

IMG="${REPOSITORY}:${TAG}"

docker image push "${IMG}"
