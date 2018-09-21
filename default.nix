{ stdenv, pkgs }:

stdenv.mkDerivation rec {
  name = "asabina-latex-agreements-${version}";
  version = "0.1.0";

  buildInputs = with pkgs; [
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
      numprint
      paracol
      tableof
      tocloft
      xetex
      ;
    })
    zip
    unzip
  ];
}
