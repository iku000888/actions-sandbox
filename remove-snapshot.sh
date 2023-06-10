#!/usr/bin/env bash

set -eu

if [ -e project.clj ]; then
  sed -i -e "1 s/$(cat SNAPSHOT_VERSION.txt)-SNAPSHOT/$(cat VERSION.txt)/g" project.clj
  git add project.clj
fi
