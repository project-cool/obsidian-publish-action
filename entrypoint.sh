#!/bin/bash

set -e

echo "Cloning the docs repostiory: ${GITHUB_REPOSITORY}"
git clone "https://github.com/${GITHUB_REPOSITORY}" /app/docs
echo "`ls -alh /app/docs`"
ls -alh /app/docs
