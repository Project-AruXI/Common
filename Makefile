CC = gcc
AR = ar
CFLAGS = -Wall -O2 -fPIC

all: libsecuredstring


libsecuredstring:
	$(CC) $(CFLAGS) -c libsecuredstring.c -o libsecuredstring.o
	$(AR) rcs libsecuredstring.a libsecuredstring.o

clean:
	rm -f *.o

.PHONY: all clean