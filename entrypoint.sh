#!/bin/bash

set -e

echo "Cloning the docs repostiory: ${GITHUB_REPOSITORY}"
# git clone "https://github.com/${GITHUB_REPOSITORY}" /app/docs
git clone "https://github.com/arkalim/obsidian-vault" /app/docs
# ls -alh /app/docs
