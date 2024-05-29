#!/bin/bash
# file: makefile.lint.sh
# url: https://github.com/conneroisu/logsql/blob/main/scripts/makefile.lint.sh
# description: Runs all linters on the logsql repository.
# 
# Usage: make lint

# if gum is not installed just echo the messages
if ! command -v gum &>/dev/null; then
	echo "running staticcheck"
	staticcheck ./...
	echo "running golangci-lint"
	golangci-lint run
	echo "running sqlc vet"
	sqlc vet
	echo "done"
	exit 0
fi

gum spin --spinner dot --title "Running Static Check" --show-output -- \
	staticcheck ./...

gum spin --spinner dot --title "Running GolangCI Lint" --show-output -- \
	golangci-lint run

gum spin --spinner dot --title "Running SQLC Vet" --show-output -- \
	sqlc vet
