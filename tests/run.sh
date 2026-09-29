#!/usr/bin/env bash
# Test runner for Safe Division.
# Usage: bash tests/run.sh ./build/solution
# Runs the program on every tests/*.in file and compares what it prints
# with the matching tests/*.out file.

prog="$1"
if [ -z "$prog" ] || [ ! -f "$prog" ]; then
    echo "usage: bash tests/run.sh <program>"
    exit 2
fi

# Stop a program that runs for more than 5 seconds (if 'timeout' exists).
runner=()
if command -v timeout >/dev/null 2>&1; then
    runner=(timeout 5)
fi

tmp=$(mktemp)
pass=0
fail=0

for in_file in tests/*.in; do
    name=$(basename "$in_file" .in)
    out_file="tests/$name.out"

    { "${runner[@]}" "$prog" < "$in_file" > "$tmp"; } 2>/dev/null
    code=$?

    got=$(tr -d '\r' < "$tmp")
    expected=$(tr -d '\r' < "$out_file")
    input=$(tr -d '\r' < "$in_file" | tr '\n' ' ' | sed 's/ *$//')

    if [ "$code" -eq 124 ]; then
        problem="the program ran too long (more than 5 seconds)"
    elif [ "$code" -gt 1 ]; then
        problem="the program crashed (exit code $code)"
    elif [ "$got" != "$expected" ]; then
        problem="wrong output"
    else
        problem=""
    fi

    if [ -z "$problem" ]; then
        echo "PASS $name"
        pass=$((pass + 1))
    else
        echo "FAIL $name: $problem"
        echo "    input:    $input"
        echo "    expected: $expected"
        if [ -z "$got" ]; then
            echo "    got:      (nothing)"
        else
            echo "    got:      $got"
        fi
        fail=$((fail + 1))
    fi
done

rm -f "$tmp"
echo "Tests: $pass passed, $fail failed"
[ "$fail" -eq 0 ]
