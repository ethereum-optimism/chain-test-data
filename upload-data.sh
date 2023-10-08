#!/bin/bash
set -euo pipefail
SOURCE_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

#GH="op plugin run -- gh"
GH="gh"

cd "${SOURCE_DIR}/optimism/op-program"
make capture-chain-test-data

cd "${SOURCE_DIR}"
RELEASE_NAME=$(git describe --tags)
echo "Creating release. Note: Job can only run once per tag, to rerun create a new tag or manually delete the existing release."
$GH release create --latest --title "${RELEASE_NAME}" --notes "Chain test data ${RELEASE_NAME}" "${RELEASE_NAME}"

$GH release upload "${RELEASE_NAME}" ${SOURCE_DIR}/optimism/op-program/compat-tests/*.tar.bz
