#!/bin/bash
assert() {
  expected="$1"
  input="$2"

  ./mycaml "$input" > tmp.s
  cc -o test.tmp tmp.s
  ./test.tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

assert 0 1-1
assert 2 1+1

assert 0 0
assert 42 42

echo OK