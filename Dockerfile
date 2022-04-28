FROM ocaml/opam:alpine-ocaml-4.14 AS build
RUN sudo ln -f /usr/bin/opam-2.1 /usr/bin/opam
RUN opam init --reinit -ni
RUN opam install solo5

FROM scratch
ENTRYPOINT []
CMD []
WORKDIR /
COPY --from=build /home/opam/.opam/4.14/bin/solo5-hvt /sbin/solo5-hvt
CMD ["/sbin/solo5-hvt"]
