FROM lnl7/nix:2018-09-21

WORKDIR /tmp/build

COPY default.nix .
COPY shell.nix .

#RUN nix-store -r $(nix-instantiate)

RUN nix-env -if default.nix

CMD load-env-xetex-bilingualagreements