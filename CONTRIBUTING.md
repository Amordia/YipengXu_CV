# Contributing

This repository intentionally separates CV content from build and release automation.

## Editing the CV

- `cv.tex` is the entry point.
- The effective LaTeX source is stored in `src/part_00.tex` through `src/part_03.tex`.
- Do not reformat or move LaTeX commands merely for style: small whitespace changes can affect line and page breaks.

## Local validation

Install a TeX Live distribution, `latexmk`, and Poppler utilities, then run:

```bash
make check
```

The command compiles the document and verifies that the output is a searchable, two-page A4 PDF.

## Publishing

Pull requests run the read-only `CV CI` workflow and expose the compiled PDF as a temporary workflow artifact. The canonical `Yipeng_Xu_CV.pdf` is updated only by the `Publish CV PDF` workflow after changes reach `main`, or when that workflow is started manually.
