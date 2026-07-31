# Contributing

The source is organized by responsibility so content edits and layout edits remain easy to review.

## Source map

- `cv.tex`: document lifecycle and section order only.
- `tex/packages.tex`: package dependencies in rendering-sensitive order.
- `tex/style.tex`: colours, page geometry, typography, and list appearance.
- `tex/commands.tex`: reusable semantic CV commands.
- `tex/metadata.tex`: personal details and profile links.
- `sections/*.tex`: rendered CV content grouped by section.

## Rendering-sensitive boundaries

Each included `.tex` file intentionally ends with `%`, and each `\input{...}` directive in `cv.tex` also ends with `%`. Do not remove these markers: they prevent TeX from introducing whitespace at file boundaries and are required for pixel-identical rendering.

## Local validation

Install TeX Live, `latexmk`, and Poppler utilities, then run:

```bash
make check
```

The command compiles the document and verifies that the output is a searchable, two-page A4 PDF.

For layout-sensitive refactors, compare rasterized versions of the baseline and candidate PDFs at the same DPI. The repository CI performs structural checks; pixel-regression checks are run when reorganizing rendering-sensitive source.

## Publishing

Pull requests run the read-only `CV CI` workflow and expose the compiled PDF as a temporary artifact. The canonical `Yipeng_Xu_CV.pdf` is updated only by the `Publish CV PDF` workflow after changes reach `main`, or when that workflow is started manually.
