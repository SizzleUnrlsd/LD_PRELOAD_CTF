CC=gcc
CFLAGS=-g -Wall
LDFLAGS=-ldl

all: ctf0 strcpy_print.so run_with_ld_preload

ctf0: c_del.c
	$(CC) $(CFLAGS) -o ctf0 c_del.c del_buffer.c

strcpy_print.so: strcpy_print.c
	$(CC) -shared -fPIC -o strcpy_print.so strcpy_print.c $(LDFLAGS)

run_with_ld_preload: ctf0 strcpy_print.so
	LD_PRELOAD=./strcpy_print.so ./ctf0

run_without_ld_preload: ctf0
	./ctf0

clean:
	rm -f ctf0 strcpy_print.so
