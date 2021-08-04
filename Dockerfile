FROM ubuntu:20.04
WORKDIR /workdir
COPY . .
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/root/.local/lib/shellspec:$PATH"
ENV TZ=US/Pacific
RUN apt update && apt install --yes \
    binutils-dev \
    cmake \
    curl \
    git \
    gnutls-bin \
    jq \
    libcurl4-openssl-dev \
    libdw-dev \
    libiberty-dev \
    libssl-dev \
    make \
    pip \
    shellcheck \
    zlib1g-dev
RUN pip install \
    jsonschema
# Install ShellSpec
RUN curl --fail --location https://git.io/shellspec --show-error --silent | sh -s -- --yes
RUN shellspec --init
# Install kcov
RUN git clone https://github.com/SimonKagstrom/kcov.git && \
    cd kcov && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install
