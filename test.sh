#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

red() {
  x=$1
  echo "${RED}${x}${NC}"
}

green() {
  x=$1
  echo "${GREEN}${x}${NC}"
}

assert() {
  expected="$1"
  input="$2"

  ./mycaml "$input" > tmp.s
  cc -o test.tmp tmp.s
  ./test.tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo -e "$(green OK) $input => $actual"
  else
    echo -e "$(red   NG) $input => $expected expected, but got $actual"
    exit 1
  fi
}

assert 21 42/2
assert 42 21*2
assert 0 1-1
assert 2 1+1

assert 0 0
assert 42 42

echo -e $(green "All OK")