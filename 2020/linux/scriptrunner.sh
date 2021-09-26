#!/usr/bin/env bash
export ROOT=$(dirname $0)/scripts
chmod +x $ROOT/*.sh
for file in $ROOT/*.sh; do
  $file
done
