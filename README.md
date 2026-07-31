# Yipeng Xu - Curriculum Vitae

[![CV CI](https://github.com/Amordia/YipengXu_CV/actions/workflows/build-cv.yml/badge.svg)](https://github.com/Amordia/YipengXu_CV/actions/workflows/build-cv.yml)

This repository contains the academic curriculum vitae of **Yipeng Xu**, including its maintainable LaTeX source, validation tooling, and automated PDF publication.

[**Open the CV in GitHub's PDF viewer**](https://github.com/Amordia/YipengXu_CV/blob/main/Yipeng_Xu_CV.pdf) · [**Download the PDF directly**](https://raw.githubusercontent.com/Amordia/YipengXu_CV/main/Yipeng_Xu_CV.pdf)

## Repository layout

```text
.
├── cv.tex                       # Minimal document entry point
├── tex/
│   ├── packages.tex             # Required LaTeX dependencies
│   ├── style.tex                # Geometry, colours, and typography
│   ├── commands.tex             # Reusable CV macros
│   └── metadata.tex             # Name, email, links, and update date
├── sections/                    # CV content grouped by semantic section
├── scripts/verify-pdf.sh        # Structural PDF validation
├── Makefile                     # Local build, check, watch, and cleanup targets
└── .github/workflows/
    ├── build-cv.yml             # Read-only CI for pushes and pull requests
    └── publish-cv.yml           # Publishes the canonical PDF from main
```

## Editing

- Change personal details in `tex/metadata.tex`.
- Change reusable layout primitives in `tex/style.tex` and `tex/commands.tex`.
- Change CV wording in the corresponding file under `sections/`.
- Keep the `%` at the end of included `.tex` files and the `\input{...}%` lines in `cv.tex`; these suppress boundary whitespace and preserve the verified layout.

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

## Rendering stability

The refactored source preserves the original CV content and rendering. The baseline and refactored PDFs were rasterized at 200 DPI and compared page by page with zero changed pixels.

## Automation model

- **CV CI** compiles with TeX Live 2025, validates the two-page A4 PDF, and uploads it as a temporary workflow artifact. It has read-only repository permissions.
- **Publish CV PDF** is the only workflow with write permission. It runs after source changes reach `main` and commits `Yipeng_Xu_CV.pdf` only when the generated file changed.
- Dependabot checks GitHub Actions dependencies monthly.

## License

The LaTeX source and repository tooling are released under the [MIT License](./LICENSE). The biographical and scholarly content remains © Yipeng Xu.
