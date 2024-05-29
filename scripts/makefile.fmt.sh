#!/bin/bash
# file: makefile.fmt.sh
# url: https://github.com/conneroisu/logsql/blob/main/scripts/makefile.fmt.sh
# description: This script formats the Go files using gofmt and golines.
#
# Usage: make fmt
GO_FILES := $(shell find . -name '*.go' | grep -v /vendor/)
targets=(
	"*.go"
	"**/*.go"
	"**/**/*.go"
	"**/**/**/*.go"
	"**/**/**/**/*.go"
	"**/**/**/**/**/*.go"
)

# For each of the targets, run gofmt and goline.
for target in "${targets[@]}"; do
	if ls $target &>/dev/null; then
		if ! command -v gum &>/dev/null; then
			echo "formatting $target with gofmt"
			gofmt -w $target
			echo "formatting $target with golines"
			goline -w --max-len=79 $target
		else
			gum spin --spinner dot --title "Formatting Go Files with 'go fmt' in $target" --show-output -- \
				go fmt $target
			gum spin --spinner dot --title "Formatting Go Files with 'golines' in $target" --show-output -- \
				golines -w --max-len=79 $target
		fi
	else
		continue
	fi
done
