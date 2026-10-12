#!/bin/sh
# Test for bin/greet. Exit 1 on the first mismatch.
set -eu

dir=$(cd "$(dirname "$0")/.." && pwd)

out=$("$dir/bin/greet")
if [ "$out" != "hello" ]; then
  echo "FAIL: expected 'hello', got '$out'" >&2
  exit 1
fi

# The exact-match check also makes the output one line. Exit status is
# captured so a non-zero status fails with a FAIL line instead of aborting.
status=0
out=$("$dir/bin/greet" --version) || status=$?
if [ "$out" != "greet 1.0" ]; then
  echo "FAIL: expected 'greet 1.0' for --version, got '$out'" >&2
  exit 1
fi
if [ "$status" -ne 0 ]; then
  echo "FAIL: expected exit 0 for --version, got $status" >&2
  exit 1
fi

echo "ok"
