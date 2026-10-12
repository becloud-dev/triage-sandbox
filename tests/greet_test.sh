#!/bin/sh
# Test for bin/greet. Exit 1 on the first mismatch.
set -eu

dir=$(cd "$(dirname "$0")/.." && pwd)

out=$("$dir/bin/greet")
if [ "$out" != "hello" ]; then
  echo "FAIL: expected 'hello', got '$out'" >&2
  exit 1
fi

echo "ok"
