#!/bin/bash
set -eux

# https://github.com/kkos/oniguruma/releases
LIB_VERSION='6.9.10'
LIB_URL="https://github.com/kkos/oniguruma/releases/download/v${LIB_VERSION}/onig-${LIB_VERSION}.tar.gz"

srcDirName=$(downloadFile "$LIB_URL")
pushd "$srcDirName"

autoreconf -vfi
./configure
make -j"$(nproc)"
make install

popd
rm -rf "$srcDirName"
