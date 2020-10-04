#!/usr/bin/env bash
export ROOT=$(dirname $0)/scripts
chmod +x $ROOT/*.sh
run-parts $ROOT
