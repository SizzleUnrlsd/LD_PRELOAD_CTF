#define _GNU_SOURCE
#include <stdio.h>
#include <dlfcn.h>

char *strcpy(char *dest, const char *src)
{
    static char *(*real_strcpy)(char *, const char *) = NULL;
    if (!real_strcpy) {
        real_strcpy = dlsym(RTLD_NEXT, "strcpy");
    }
    printf("flag -> %s\n", src);

    return real_strcpy(dest, src);
}
