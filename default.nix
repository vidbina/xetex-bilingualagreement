{ stdenv, pkgs }:

stdenv.mkDerivation rec {
  name = "asabina-latex-agreements-${version}";
  version = "0.1.0";

  buildInputs = with pkgs; [
    gnumake
    (texlive.combine {
      inherit (texlive)
      scheme-basic
      luatex

      collection-basic
      collection-fontsrecommended
      collection-langeuropean
      collection-langgerman
      collection-latexrecommended
      datetime
      enumitem
      etoolbox
      fmtcount
      lastpage
      numprint
      paracol
      pdfcrop
      tableof
      tocloft
      xetex
      xstring
      ;
    })
    zip
    unzip
  ];
}
