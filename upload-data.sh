#!/bin/bash
set -euo pipefail
SOURCE_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

GH="gh"

RELEASE_NAME=$(git describe --tags)
echo "Using release name ${RELEASE_NAME}"

echo "Generating access token"
npm install
GITHUB_ACCESS_TOKEN=$(node index.js)

echo "Logging in"
echo "${GITHUB_ACCESS_TOKEN}" | $GH auth login --with-token

cd "${SOURCE_DIR}"
echo "Creating release. Note: Job can only run once per tag, to rerun create a new tag or manually delete the existing release."
$GH release create --latest --title "${RELEASE_NAME}" --notes "Chain test data ${RELEASE_NAME}" "${RELEASE_NAME}"

echo "Uploading chain data to release"
$GH release upload "${RELEASE_NAME}" ${SOURCE_DIR}/optimism/op-program/temp/compat/*.tar.bz
