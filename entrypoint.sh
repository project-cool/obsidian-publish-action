#!/bin/bash

set -e

echo "Cloning the docs repostiory: ${GITHUB_REPOSITORY}"
# git clone -b publish "https://github.com/${GITHUB_REPOSITORY}" /app/docs
git clone -b publish "https://github.com/arkalim/obsidian-vault" /app/docs
mkdocs new test
ls -alh /app/docs
ls -alh /app/code
python3 
