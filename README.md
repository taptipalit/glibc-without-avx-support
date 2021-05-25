# glibc-without-avx-support

The [Data-Only-Mitigation](https://github.com/taptipalit/data-only-attack-mitigation) and [DynPTA](https://github.com/taptipalit/dynpta) projects store encryption keys in the XMM registers through the life of the program. So they require that Glibc doesn't use the XMM registers. This project is glibc-2.23 modified to not these registers. 

The precompiled libraries are in `glibc-install/`

The files in `test/` and the script at `test/test_glibc.sh` shows an example of how to link with this glibc instead of the system-default one. 


## Compiling Glibc 

1. Create a directory outside of glibc-2.23 and change to that directory

`./glibc-2.23/configure --prefix=<CUSTOM_INSTALL_LOC> --host=x86_64-linux-gnu --build=x86_64-linux-gnu CFLAGS="-O2 -mno-avx"
 -disable-werror`

2. `make -jN`

3. Update `test/test_glibc.sh` to point to `<CUSTOM_INSTALL_LOC>`

4. Compile any library your application needs separately without XMM support and copy it over to `<CUSTOM_INSTALL_LOC>/lib`. The steps to do this will be library specific. Ideally though *all* of these libraries should be a part of the *Whole Program Analysis* and you shouldn't be linking the ELF libraries. 
