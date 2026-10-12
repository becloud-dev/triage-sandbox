#!/bin/sh
# Fixture for the fail path of the development execution: runs the real test, then fails when
# ROUND is set. The workflow sets ROUND only in its own test run, so the executor sees a pass.
set -eu
sh "$(dirname "$0")/greet_test.sh"
[ -z "${ROUND:-}" ]
