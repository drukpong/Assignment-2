#!/bin/bash

echo "================================"
echo "   ASSIGNMENT 2 GRADING"
echo "================================"

score=0
total=5

echo
echo "Checking diagnostic help..."
if ./app/diagnostic.sh help > /dev/null 2>&1; then
    echo "PASS"
    score=$((score + 1))
else
    echo "FAIL"
fi

echo
echo "Checking system diagnostics..."
if ./app/diagnostic.sh system > /dev/null 2>&1; then
    echo "PASS"
    score=$((score + 1))
else
    echo "FAIL"
fi

echo
echo "Checking disk diagnostics..."
if ./app/diagnostic.sh disk > /dev/null 2>&1; then
    echo "PASS"
    score=$((score + 1))
else
    echo "FAIL"
fi

echo
echo "Checking network diagnostics..."
if ./app/diagnostic.sh network google.com > /dev/null 2>&1; then
    echo "PASS"
    score=$((score + 1))
else
    echo "FAIL"
fi

echo
echo "Checking health-check..."
if ./app/health-check.sh > /dev/null 2>&1; then
    echo "PASS"
    score=$((score + 1))
else
    echo "FAIL"
fi

echo
echo "================================"
echo "Score: $score/$total"
echo "================================"

if [ "$score" -eq "$total" ]; then
    echo "ASSIGNMENT PASSED"
else
    echo "ASSIGNMENT NEEDS FIXES"
fi
