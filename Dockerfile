FROM amigadev/docker-base:latest

WORKDIR /work

COPY ./ /work/

RUN bin/gild clone 
RUN bin/gild checkout binutils 2.23.2 
#	&& bin/gild checkout coreutils 5.2 \
RUN bin/gild checkout gcc 8 
#	&& make -C native-build -j4 \
RUN make -C native-build gcc-cross CROSS_PREFIX=/opt/ppc-amigaos -j4
