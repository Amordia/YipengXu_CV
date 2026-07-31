# Yipeng Xu - Curriculum Vitae

[![CV CI](https://github.com/Amordia/YipengXu_CV/actions/workflows/build-cv.yml/badge.svg)](https://github.com/Amordia/YipengXu_CV/actions/workflows/build-cv.yml)

This repository contains the academic curriculum vitae of **Yipeng Xu**, including its LaTeX source, validation tooling, and automated PDF publication.

[**View or download the canonical CV (PDF)**](./Yipeng_Xu_CV.pdf)

## Repository layout

```text
.
├── cv.tex                       # Stable LaTeX entry point
├── src/                         # Effective CV source, preserved verbatim
├── scripts/verify-pdf.sh        # Structural PDF validation
├── Makefile                     # Local build, check, watch, and cleanup targets
└── .github/workflows/
    ├── build-cv.yml             # Read-only CI for pushes and pull requests
    └── publish-cv.yml           # Publishes the canonical PDF from main
```

## Build locally

Requirements:

- TeX Live with `latexmk` and `pdflatex`
- Poppler utilities (`pdfinfo` and `pdftotext`) for `make check`

```bash
make build
make check
```

Useful maintenance commands:

```bash
make watch      # rebuild while editing
make clean      # remove auxiliary files
make distclean  # also remove cv.pdf
make help
```

The local build output is `cv.pdf`. The public, canonical filename is `Yipeng_Xu_CV.pdf`.

## Automation model

- **CV CI** compiles with TeX Live 2025, validates the two-page A4 PDF, and uploads it as a temporary workflow artifact. It has read-only repository permissions.
- **Publish CV PDF** is the only workflow with write permission. It runs after source changes reach `main` and commits `Yipeng_Xu_CV.pdf` only when the generated file changed.
- Dependabot checks GitHub Actions dependencies monthly.

## Content and rendering stability

The engineering configuration is kept outside the effective LaTeX source. Changes to tooling should not modify `cv.tex` or `src/*.tex`; this prevents accidental changes to wording, line wrapping, pagination, or visual layout.

## License

The LaTeX source and repository tooling are released under the [MIT License](./LICENSE). The biographical and scholarly content remains © Yipeng Xu.
