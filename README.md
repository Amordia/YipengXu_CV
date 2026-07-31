# Yipeng Xu — Curriculum Vitae

This repository contains the current academic curriculum vitae of **Yipeng Xu**, including the LaTeX source and a compiled PDF.

[**View or download the latest CV (PDF)**](./Yipeng_Xu_CV.pdf)

## Contents

- `cv.tex` — LaTeX source
- `Yipeng_Xu_CV.pdf` — compiled CV
- `Makefile` — local build and cleanup commands

## Build locally

A TeX distribution with `latexmk` and `pdflatex` is required.

```bash
make
```

The generated file is `cv.pdf`. To remove auxiliary build files:

```bash
make clean
```

## License

The LaTeX source is released under the [MIT License](./LICENSE). The biographical and scholarly content remains © Yipeng Xu.
