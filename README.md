# glibc-without-avx-support

The [Data-Only-Mitigation](https://github.com/taptipalit/data-only-attack-mitigation) and [DynPTA](https://github.com/taptipalit/dynpta) projects store encryption keys in the XMM registers through the life of the program. So they require that Glibc doesn't use the XMM registers. This project is glibc-2.23 modified to not these registers. 

The precompiled libraries are in `glibc-install/`

The files in `test/` and the script at `test/test_glibc.sh` shows an example of how to link with this glibc instead of the system-default one. 


## Compiling Glibc 

1. Create a directory outside of glibc-2.23 and change to that directory

`../glibc-2.23/configure --prefix=<CUSTOM_INSTALL_LOC> -disable-werror`

2. `make -jN`

3. Update `test/test_glibc.sh` to point to `<CUSTOM_INSTALL_LOC>`
