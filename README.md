# md-ieee-latex-template

A simple Makefile pipeline to convert Markdown files into
IEEE-conference-article formatted PDFs using `pandoc`, Latex and BibTex.

## Installation

### Repo

Copy this repo as a Github template, or download/clone all the files to your
project.

### Pandoc

This pipeline entirely relies on `pandoc`, so you
[need to install it](https://pandoc.org/installing.html). Also make sure to
install the recommended Tex distribution and fonts for your system as described
on the pandoc installation page.

You should now see the version of pandoc, you have. This pipeline was tested
with the following version on macOS 10.15 with macOS's `GNU Make 3.81`.

```bash
$ pandoc -v
pandoc 2.11.3.2
```

### Other needed/handy tools

- `curl` needed to download files.
- `make` of course, as described.
- `prettier` formats and wraps your Markdown, _optional_.

## Usage

### Compilation

To compile the `paper.pdf` file from the `paper.md`, just run:

```bash
make
```

This will download some needed template files (only the first ever time), count
the words in the Markdown file and compile a PDF using pandoc and Latex.

### Citations

Pandoc comes with full support of Latex-like citations. Add all the works you
need to cite in `bib.bib` in BibTex format. Cite works with tags like this
`[@tag, page 23]`. For more information check out
[pandoc-citeproc](https://pandoc.org/MANUAL.html#citations).

### More PDFs

You can have as many PDFs as you want and rename/remove the `paper.pdf`. To do
that, just change the following line in the `Makefile`:

```Makefile
PDFS = paper.pdf
```

Probably to something like:

```Makefile
PDFS = chapter1.pdf chapter2.pdf
```

### Change metadata

The metadata like author, title, etc. can be set in the `layout.yml` file.

## Credits

This project is merely a combination/puzzle of some already existing projects,
tools and scripts:

- The main inspiration and much most of the Makefile & template code comes from
  [ieee-pandoc-template](https://github.com/stsewd/ieee-pandoc-template) by
  **@stsewd**.

- The IEEE class is directly loaded from [ctan.org](ctan.org).

- The IEEE citation style comes from the
  [Citation Style Language project](https://github.com/citation-style-language/styles).

- The word count script is from
  [pandocs' documentation](https://pandoc.org/lua-filters.html#counting-words-in-a-document).
