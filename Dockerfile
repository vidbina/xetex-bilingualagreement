FROM nixos/nix:2.1.1

WORKDIR /tmp/build

COPY *.nix ./
COPY src src/

RUN nix-env -if default.nix --show-trace
