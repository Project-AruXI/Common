CC = gcc
AR = ar
CFLAGS = -Wall -O2 -fPIC


# LIBSS

libss:
	$(CC) $(CFLAGS) -c libsecuredstring.c -o libsecuredstring.o
	$(AR) rcs libsecuredstring.a libsecuredstring.o

libss-win: CC = zig cc
libss-win: CFLAGS += --target=x86_64-windows
libss-win:
	$(CC) $(CFLAGS) -c libsecuredstring.c -o libsecuredstring_win.o
	$(AR) rcs --target=pe-x86-64 libsecuredstring-win.a libsecuredstring_win.o

# LIBSDS

libsds:
	$(CC) $(CFLAGS) -c sds.c -o libsds.o
	$(AR) rcs libsds.a libsds.o

libsds-win: CC = zig cc
libsds-win: CFLAGS += --target=x86_64-windows
libsds-win:
	$(CC) $(CFLAGS) -c sds.c -o libsds_win.o
	$(AR) rcs --target=pe-x86-64 libsds-win.a libsds_win.o

# LIBARGPARSE

libargparse:
	$(CC) $(CFLAGS) -c argparse.c -o libargparse.o
	$(AR) rcs libargparse.a libargparse.o

libargparse-win: CC = zig cc
libargparse-win: CFLAGS += --target=x86_64-windows
libargparse-win:
	$(CC) $(CFLAGS) -c argparse.c -o libargparse_win.o
	$(AR) rcs --target=pe-x86-64 libargparse-win.a libargparse_win.o


clean:
	rm -f *.o

.PHONY: all clean