#!/bin/bash

set -e
set -o pipefail
set -x

echo "⚠️ Warning: this Github Action is deprecated. Please usehttps://github.com/tidelift/alignment-action instead."

echo "Downloading latest CLI"
curl -s -o ./tidelift https://download.tidelift.com/cli/tidelift
chmod +x ./tidelift

echo "Current Tidelift CLI version"
./tidelift version

echo "Uploading manifests for alignment"
./tidelift alignment save --revision ${GITHUB_SHA} --branch ${GITHUB_REF##*/} --directory ${GITHUB_WORKSPACE}
echo "Waiting for the alignment to start"
sleep 15
./tidelift status --wait ${GITHUB_SHA}
