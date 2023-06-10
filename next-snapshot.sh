#!/usr/bin/env bash

set -eu

VERSION=$(cat VERSION.txt)
SNAPSHOT_VERSION=$(echo "$VERSION" | while IFS=. read -r major minor patch; do
                   echo "$major.$minor.$((patch+1))"
               done)
if [ -e project.clj ]; then
  sed -i -e "1 s/$(cat VERSION.txt)/$SNAPSHOT_VERSION-SNAPSHOT/g" project.clj
fi
echo "$SNAPSHOT_VERSION" > SNAPSHOT_VERSION.txt
if [ -e project.clj ]; then
  git add project.clj
fi
git add SNAPSHOT_VERSION.txt
git commit -m "chore: prepare next development iteration"
