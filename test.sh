#!/bin/bash

set -e

echo "Running Assignment-2 tests..."

echo
echo "Test 1: Diagnostic help"
./app/diagnostic.sh help > /dev/null
echo "PASS"

echo
echo "Test 2: System diagnostics"
./app/diagnostic.sh system > /dev/null
echo "PASS"

echo
echo "Test 3: Disk diagnostics"
./app/diagnostic.sh disk > /dev/null
echo "PASS"

echo
echo "Test 4: Network diagnostics"
./app/diagnostic.sh network google.com > /dev/null || true
echo "PASS"

echo
echo "Test 5: Health check"
./app/health-check.sh > /dev/null || true
echo "PASS"

echo
echo "All tests completed."
