{ stdenv, pkgs }:

let
  redefinedInvoice = let
    invoice = pkgs.stdenv.mkDerivation rec {
      version = "2011-10-01";
      pname = "invoice";
      tlType = "run";

      name = "${pname}-${version}";

      src = ./invoice;

      buildInputs = with pkgs; [
        tree
        #unzip
      ];

      dontBuild = true;

      unpackPhase = ''
        echo "nothing to unpack";
      '';

      installPhase = ''
        mkdir -p $out/tex/latex/invoice
        cp -r $src/texinput $out/tex/latex/invoice
      '';
    };
  in { pkgs = [ invoice ]; };
in stdenv.mkDerivation rec {
  name = "asabina-latex-${version}";
  version = "0.1.0";

  buildInputs = with pkgs; [
    (texlive.combine {
      inherit (texlive)
      scheme-basic
      luatex

      biblatex
      blindtext
      collection-langeuropean
      collection-basic
      collection-fontsrecommended
      collection-latexrecommended
      #graphics-def
      etoolbox
      datetime
      fmtcount
      german
      IEEEtran
      lastpage
      layouts
      logreq
      numprint
      pdfcrop
      realscripts
      tabu
      varwidth
      xargs
      xtab
      xetex
      graphics-def
      xltxtra
      xstring;
      #inherit redefinedInvoice;
    })
    zip
    unzip
  ];

  #shellHook = ''
  #  #export PATH="$PATH:${pkgs.arduino-core}/share/arduino/"
  #'';
}
