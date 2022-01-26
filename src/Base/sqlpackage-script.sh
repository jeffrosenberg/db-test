#! /usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_NAME="${1:-Base}"
TEST_PASSWORD="${2:-testP@ssword}"

# I don't really need a script for this,
# it's here more as documentation since I 
# rarely use this test project

sqlpackage \
  /Action:Script \
  /SourceFile:"${SCRIPT_DIR}/bin/Debug/netstandard2.0/Base.dacpac" \
  /DeployScriptPath:${HOME}/Documents/Working/script.sql \
  /Profile:"${SCRIPT_DIR}/Publish/test.publish.xml" \
  /TargetUser:sa \
  /TargetPassword:"${TEST_PASSWORD}"