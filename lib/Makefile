CC = gcc
AR = ar
CFLAGS = -Wall -O2 -fPIC

# lib dirs
LIBSS_DIR = securedstring
LIBSDS_DIR = sds
LIBARGPARSE_DIR = argparse
LIBUTF8V_DIR = utf8v



# LIBSS

all: libss libss-win libsds libsds-win libargparse libargparse-win libutf8v libutf8v-win

libss:
	$(CC) $(CFLAGS) -c $(LIBSS_DIR)/libsecuredstring.c -o libsecuredstring.o
	$(AR) rcs libsecuredstring.a libsecuredstring.o

libss-win: CC = zig cc
libss-win: CFLAGS += --target=x86_64-windows
libss-win:
	$(CC) $(CFLAGS) -c $(LIBSS_DIR)/libsecuredstring.c -o libsecuredstring_win.o
	$(AR) rcs --target=pe-x86-64 libsecuredstring-win.a libsecuredstring_win.o

# LIBSDS

libsds:
	$(CC) $(CFLAGS) -c $(LIBSDS_DIR)/sds.c -o libsds.o
	$(AR) rcs libsds.a libsds.o

libsds-win: CC = zig cc
libsds-win: CFLAGS += --target=x86_64-windows
libsds-win:
	$(CC) $(CFLAGS) -c $(LIBSDS_DIR)/sds.c -o libsds_win.o
	$(AR) rcs --target=pe-x86-64 libsds-win.a libsds_win.o

# LIBARGPARSE

libargparse:
	$(CC) $(CFLAGS) -c $(LIBARGPARSE_DIR)/argparse.c -o libargparse.o
	$(AR) rcs libargparse.a libargparse.o

libargparse-win: CC = zig cc
libargparse-win: CFLAGS += --target=x86_64-windows
libargparse-win:
	$(CC) $(CFLAGS) -c $(LIBARGPARSE_DIR)/argparse.c -o libargparse_win.o
	$(AR) rcs --target=pe-x86-64 libargparse-win.a libargparse_win.o

# LIBUTF8V

libutf8v:
	$(MAKE) -C $(LIBUTF8V_DIR) lib

libutf8v-win:
	$(MAKE) -C $(LIBUTF8V_DIR) lib-win


clean:
	rm -f *.o

.PHONY: all clean