#!/bin/bash -e

source $(dirname "$0")/ci.sh

run_f "$(dirname "$0")/unit.ios.sh"

pushd detox/test
run_f "npm run build:ios"
run_f "npm run e2e:ios-ci"
cp coverage/lcov.info coverage/e2e.lcov
# run_f "npm run verify-artifacts:ios"
popd
