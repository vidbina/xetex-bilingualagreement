FROM lnl7/nix:2018-09-21

WORKDIR /tmp/build

COPY *.nix ./
COPY src src/

#RUN nix-store -r $(nix-instantiate)

RUN nix-env -if default.nix

CMD load-env-xetex-bilingualagreements
