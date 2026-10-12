#!/bin/sh
# Test for bin/greet. Exit 1 on the first mismatch.
set -eu

dir=$(cd "$(dirname "$0")/.." && pwd)

out=$("$dir/bin/greet")
if [ "$out" != "hello" ]; then
  echo "FAIL: expected 'hello', got '$out'" >&2
  exit 1
fi

help=$("$dir/bin/greet" --help) && help_status=0 || help_status=$?
if [ "$help" != "usage: greet [--help]" ]; then
  echo "FAIL: expected 'usage: greet [--help]', got '$help'" >&2
  exit 1
fi

if [ "$help_status" -ne 0 ]; then
  echo "FAIL: expected exit 0 for --help, got $help_status" >&2
  exit 1
fi

echo "ok"
