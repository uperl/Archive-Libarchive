FROM plicease/ciperl:5.32-bullseye
LABEL maintainer="Graham Ollis <plicease@cpan.org>"
ARG unsupported=2.8.5
ARG oldest=no-default
ARG latest=no-default

RUN  apt-get update                            \
  && apt-get install --no-install-recommends   \
     pkg-config                                \
     libbz2-dev                                \
     liblz4-dev                                \
     liblzma-dev                               \
     libxml2-dev                               \
     libzstd-dev                               \
     zlib1g-dev                                \
     libacl1-dev                               \
     libext2fs-dev                             \
     libattr1-dev                              \
     sharutils                                 \
     nettle-dev                                \
     less                                      \
     man                                       \
     castxml                                   \
     libexpat1-dev                             \
     libffi-dev                                \
  && apt-get -q autoremove                     \
  && apt-get -q clean                          \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/build                \
  && cd /tmp/build                     \
  && curl -L https://www.libarchive.org/downloads/libarchive-${oldest}.tar.gz | tar zxf - \
  && cd libarchive-${oldest}           \
  && ./configure                       \
    --prefix=/opt/libarchive/${oldest} \
    --without-openssl                  \
    --with-nettle                      \
    --enable-bsdtar=static             \
    --enable-bsdcpio=static            \
    --enable-bsdcat=static             \
  && make                              \
  && make install                      \
  && cd /                              \
  && rm -rf /tmp/build

RUN mkdir -p /tmp/build                \
  && cd /tmp/build                     \
  && curl -L https://www.libarchive.org/downloads/libarchive-${unsupported}.tar.gz | tar zxf - \
  && cd libarchive-${unsupported}           \
  && chmod +x ./configure                   \
  && ./configure                            \
    --prefix=/opt/libarchive/${unsupported} \
    --without-openssl                       \
    --with-nettle                           \
    --enable-bsdtar=static                  \
    --enable-bsdcpio=static                 \
    --enable-bsdcat=static                  \
  && make                                   \
  && make install                           \
  && cd /                                   \
  && rm -rf /tmp/build

RUN mkdir -p /tmp/build                \
  && cd /tmp/build                     \
  && curl -L https://www.libarchive.org/downloads/libarchive-${latest}.tar.gz | tar zxf - \
  && cd libarchive-${latest}           \
  && ./configure                       \
    --prefix=/opt/libarchive/${latest} \
    --without-openssl                  \
    --with-nettle                      \
    --enable-bsdtar=static             \
    --enable-bsdcpio=static            \
    --enable-bsdcat=static             \
  && make                              \
  && make install                      \
  && cd /                              \
  && rm -rf /tmp/build

ENV MANPATH /opt/libarchive/${latest}/share/man

# TODO: also man
RUN cd /usr/bin && ln -s /opt/libarchive/${latest}/bin/* .                        \
  && cd /usr/lib/x86_64-linux-gnu && ln -s /opt/libarchive/${latest}/lib/lib* .   \
  && cd pkgconfig && ln -s /opt/libarchive/${latest}/lib/pkgconfig/* .            \
  && cd /usr/include && ln -s /opt/libarchive/${latest}/include/* .

RUN cpanm -n \
  File::chdir                                      \
  FFI::CheckLib                                    \
  FFI::Platypus                                    \
  FFI::Platypus::Type::PtrObject                   \
  FFI::ExtractSymbols                              \
  Const::Introspect::C                             \
  Clang::CastXML                                   \
  Template                                         \
  PerlX::Maybe                                     \
  Test2::V0                                        \
  Test::Script                                     \
  https://dist.wdlabs.com/App-castyml-0.01.tar.gz  \
  && rm -rf ~/cpanm
