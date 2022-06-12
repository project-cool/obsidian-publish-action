#!/bin/bash

set -e

echo "Input Parameters:"
echo "Log Level: ${INPUT_LOG_LEVEL}"
echo "Website ID: ${INPUT_WEBSITEID}"
echo "Branch: ${INPUT_BRANCH}"
echo "Image Resolution: ${INPUT_IMAGE_RESOLUTION}"
echo "Image Compression Factor: ${INPUT_COMPRESSION_FACTOR}"

if [ -z $INPUT_BRANCH ]; then
    echo "Branch not provided, using default: publish"
    branch="publish"
else 
    branch=$INPUT_BRANCH
fi

echo "[INFO] Cloning the docs repository: ${GITHUB_REPOSITORY}"
git clone -b $branch "https://github.com/${GITHUB_REPOSITORY}" /app/docs

cd /app/code
npm run start "/app/docs" "${INPUT_LOG_LEVEL}"

cd /app
cp /app/docs/mkdocs.yml /app
chmod +x /app/code/scripts/*


/app/code/scripts/compress.sh "/app/docs" "${INPUT_IMAGE_RESOLUTION}" "${INPUT_COMPRESSION_FACTOR}"
/app/code/scripts/build.sh "/app/docs" > /dev/null
/app/code/scripts/upload.sh "/app/docs" "${INPUT_WEBSITEID}" "${INPUT_TOKEN}"
