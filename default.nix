{ pkgs ? import <nixpkgs> {} }:

let
  myEnvFun = pkgs.myEnvFun;
in myEnvFun rec {
  name = "xetex-bilingualagreements";
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
