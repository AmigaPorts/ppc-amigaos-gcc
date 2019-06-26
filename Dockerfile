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

RUN git config --global user.email "you@example.com" && \
	git config --global user.name "Your Name"

RUN bin/gild clone 
RUN bin/gild checkout binutils 2.23.2 
#	&& bin/gild checkout coreutils 5.2 \
RUN bin/gild checkout gcc 8 
#	&& make -C native-build -j4 \
RUN make -C native-build gcc-cross CROSS_PREFIX=/opt/ppc-amigaos -j4
