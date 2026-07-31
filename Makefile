SHELL := /bin/bash

LATEXMK ?= latexmk
ROOT_TEX ?= cv.tex
PDF ?= cv.pdf
EXPECTED_PAGES ?= 2

LATEXMK_FLAGS := -pdf -interaction=nonstopmode -halt-on-error -file-line-error

.PHONY: all build check verify watch clean distclean help

all: build

build:
	$(LATEXMK) $(LATEXMK_FLAGS) $(ROOT_TEX)

check: build verify

verify:
	EXPECTED_PAGES=$(EXPECTED_PAGES) bash scripts/verify-pdf.sh "$(PDF)"

watch:
	$(LATEXMK) $(LATEXMK_FLAGS) -pvc $(ROOT_TEX)

clean:
	$(LATEXMK) -c $(ROOT_TEX)

# Remove the generated PDF as well as auxiliary files.
distclean:
	$(LATEXMK) -C $(ROOT_TEX)

help:
	@printf '%s\n' \
	  'make build      Compile cv.tex to cv.pdf' \
	  'make check      Compile and validate the PDF' \
	  'make verify     Validate an existing PDF' \
	  'make watch      Rebuild automatically while editing' \
	  'make clean      Remove auxiliary LaTeX files' \
	  'make distclean  Remove auxiliary files and cv.pdf'
