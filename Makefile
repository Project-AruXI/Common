CC = gcc
AR = ar
CFLAGS = -Wall -O2 -fPIC

all: libsecuredstring


libsecuredstring:
	$(CC) $(CFLAGS) -c libsecuredstring.c -o libsecuredstring.o
	$(AR) rcs libsecuredstring.a libsecuredstring.o

libsds:
	$(CC) $(CFLAGS) -c sds.c -o libsds.o
	$(AR) rcs libsds.a libsds.o

clean:
	rm -f *.o

.PHONY: all clean
