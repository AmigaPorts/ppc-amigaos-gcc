FROM amigadev/docker-base:latest

WORKDIR /work

COPY ./ /work/

RUN bin/gild clone 
RUN bin/gild checkout binutils 2.23.2 
RUN bin/gild checkout gcc 8 
RUN make -C native-build gcc-cross CROSS_PREFIX=/opt/ppc-amigaos -j4

RUN rm -rf /work/*
