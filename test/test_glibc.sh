#!/usr/bin/env bash
glibc_install=/mnt/Projects/tpalit/glibc/glibc-install
set -eux
rm -rf tmp
mkdir tmp
gcc \
    -L "${glibc_install}/lib" \
    -I "${glibc_install}/include" \
    -Wl,--rpath="${glibc_install}/lib" \
    -Wl,--dynamic-linker="${glibc_install}/lib/ld-linux-x86-64.so.2" \
    -static \
    -std=c11 \
    -o tmp/test_glibc.out \
    -v \
    test_glibc.c \
    -pthread \
    ;
sudo chroot tmp /test_glibc.out

