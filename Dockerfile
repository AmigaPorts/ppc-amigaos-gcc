FROM ubuntu:19.04

RUN apt-get update && apt-get install -y \
    autoconf \
    bison \
    flex \
    g++ \
    gcc \
    gettext \
    git \
    lhasa \
    libgmpxx4ldbl \
    libgmp-dev \
    libmpfr6 \
    libmpfr-dev \
    libmpc3 \
    libmpc-dev \
    libncurses-dev \
    make \
    rsync \
    texinfo\
    wget \
	python

WORKDIR /work

COPY ./ /work/

RUN ls -lah bin

RUN python gild/bin/gild clone
RUN python gild/bin/gild checkout binutils 2.23.2
RUN python gild/bin/gild checkout gcc 8
RUN make -C native-build gcc-cross CROSS_PREFIX=/opt/ppc-amigaos 
