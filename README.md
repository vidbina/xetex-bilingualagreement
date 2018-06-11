# Usage

Look at 00.tex for a general layout of an agreement.

Build the agreement using the command

```
make 00.pdf
```

and note that def.tex and layout.tex are sourced inside the 00.tex file.

In order to devise your own agreements, copy 00.tex to the namesake of the
agreement number you are going for i.e.: for agreement _20180608-01_ one would
need to copy 00.tex to 20180608-01.tex.

> If one wants to use a different naming scheme for agreements that doesn't
> correspond to agreement numbers, one would need to explictly define the agreement
> number using the `\AgreementNumber` function otherwise the agreement number
> presented in the document will correspond to the filename.

The new agreement may be built using the make command for the target PDF i.e.:
`make 20180608-01.pdf` in this case.

Feel free to define custom definitions for your organization (.e.g:
def.acme.tex) by substituting the `\input{def}` line in your agreement file to
a more generic

```latex
\input{def.acme}
```

which should allow you to use multiple definitions for different agreements.

## Logos

Note how def.tex allows for the definition of a `\InvoiceSenderFooterLogo` and
an `\InvoiceLogo`. Define these as necessary and ensure that they files are
present at the specified paths.

## i18n

Note how def.tex allows for the definition of `\InvoiceNumberStyle`. Consult
the documentation of [numprint][numprint-doc] for more information regarding
the formatting of numbers. And consult babel for other internationalization
features.

Note how the several packages and their corresponding options are specified by
means of `\afterpackages` to produce a German document.

```latex
\def\afterpackages{
  \usepackage[german]{babel}
  \usepackage{datetime}
}
```

[numprint-doc]: https://www.ctan.org/pkg/numprint
