{ stdenv, pkgs }:

let
  bilingualagreement = pkgs.stdenv.mkDerivation rec {
    name = "bilingualagreement";
    src = ./src;
    installPhase = ''
      mkdir -p $out/tex/latex
      cp bilingualagreement.sty $out/tex/latex
    '';
    pname = name;
    tlType = "run";
  };
in stdenv.mkDerivation rec {
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

      bilingualagreement = {
        pkgs = [ bilingualagreement ];
      };
    })
    zip
    unzip
  ];

  shellHook = ''
    # https://github.com/NixOS/nix/issues/1056
    export TERMINFO=/run/current-system/sw/share/terminfo
    real_TERM=$TERM; TERM=xterm; TERM=$real_TERM; unset real_TERM
  '';
}
