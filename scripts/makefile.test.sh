#!/bin/bash
# file: makefile.test.sh
# url: https://github.com/conneroisu/logsql/blob/master/scripts/makefile.test.sh
# title: makefile.test.sh
# description: A script to run tests and generate coverage reports
#
# Usage: make test

go test -v ./... -coverprofile=coverage.out

# if gocovsh is installed, then run it
if command -v gocovsh > /dev/null; then
  gocovsh
fi
