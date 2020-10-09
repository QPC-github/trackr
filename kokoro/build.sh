#!/bin/bash

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# Fail on any error.

set -e

# Display commands to stderr.
set -x

# Download the build tools and accept its license before gradle tries to do it.
echo y | $ANDROID_HOME/tools/bin/sdkmanager "build-tools;30.0.2" > /dev/null

GRADLE_FLAGS=()
if [[ -n "$GRADLE_DEBUG" ]]; then
  GRADLE_FLAGS=( --debug --stacktrace )
fi

cd $KOKORO_ARTIFACTS_DIR/git/trackr
./gradlew "${GRADLE_FLAGS[@]}" build