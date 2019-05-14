#define _GNU_SOURCE
#include <assert.h>
#include <gnu/libc-version.h>
#include <stdatomic.h>
#include <stdio.h>


int main(int argc, char **argv) {
    /* Basic library version check. */
    printf("gnu_get_libc_version() = %s\n", gnu_get_libc_version());
    char name[100];
    memset(name, 0, 100);
    strcpy(name, "Tapti");
    printf("%s\n", name);
    return 0;
}

