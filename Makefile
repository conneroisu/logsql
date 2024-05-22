# -include .env
#  file: Makefile
#  url: https://github.com/conneroisu/logsql/blob/main/Makefile
#  description: Makefile for logsql

export MAKEFLAGS += --always-make --print-directory
SHELLFLAGS = -e

PHONY: fmt
fmt:
	@sh ./scripts/makefile.fmt.sh

PHONY: test
test:
	@sh ./scripts/makefile.test.sh

PHONY: lint
lint:
	@sh ./scripts/makefile.lint.sh

PHONY: tidy
tidy:
	@sh ./scripts/makefile.tidy.sh

PHONY: scrape
scrape:
	@sh ./scripts/makefile.scrape.sh
