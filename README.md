# resume-typst

Typst source for my one-page, ATS-friendly resume.

Email and phone are left out of this public copy. Reach me through
[LinkedIn](https://www.linkedin.com/in/pablojakubowicz/) or
[pablojaku.com](https://pablojaku.com).

## Build

```sh
typst compile cv.typ
```

Produces `cv.pdf` (US Letter). Requires [Typst](https://typst.app) 0.13 or newer.

The body font is Palatino, which ships with macOS. On other systems Typst falls
back to its bundled Libertinus Serif.

## ATS choices

The layout is single-column and plain on purpose so applicant tracking systems
parse it cleanly:

- Standard section headings: Summary, Professional Experience, Research Experience,
  Technical Skills, Education
- Labeled contact fields and plain-text URLs
- ASCII text layer: no smart quotes, ligatures, or hyphenation. The only
  non-ASCII glyph is the bullet
- Full month names and reverse-chronological roles
