#!/bin/bash

set -e

echo "[INFO] Cloning the docs repostiory: ${GITHUB_REPOSITORY}"
git clone -b publish "https://github.com/${GITHUB_REPOSITORY}" /app/docs

echo "${INPUT_LOG_LEVEL}"
echo "${INPUT_WEBSITEID}"
echo "${INPUT_BRANCH}"
echo "${INPUT_IMAGE_RESOLUTION}"
echo "${INPUT_COMPRESSION_FACTOR}"

exit 1

cd /app/code
npm run start "/app/docs" "${INPUT_LOG_LEVEL}"

cd /app
cp /app/docs/mkdocs.yml /app
chmod +x /app/code/scripts/compress.sh /app/code/scripts/build.sh /app/code/scripts/upload.sh
/app/code/scripts/compress.sh "/app/docs"
/app/code/scripts/build.sh "/app/docs"
/app/code/scripts/upload.sh "/app/docs" "${INPUT_WEBSITEID}" "gtnoI3u0hGeUmOTISm8fV-FLRF0FVpmJLNbh5KevkEo"
