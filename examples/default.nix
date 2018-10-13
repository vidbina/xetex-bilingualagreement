{
  makeFontsConf,
  montserrat,
  pkgs,
  stdenv,
}:

stdenv.mkDerivation rec {
  name = "bilingualagreement-test-env";
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

  FONTCONFIG_FILE = makeFontsConf { fontDirectories = [ montserrat ]; };

  shellHook = ''
    # https://github.com/NixOS/nix/issues/1056
    export TERMINFO=/run/current-system/sw/share/terminfo
    real_TERM=$TERM; TERM=xterm; TERM=$real_TERM; unset real_TERM
  '';
}
