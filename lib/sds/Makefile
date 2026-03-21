CC=gcc

all: sds-test

sds-test: sds.c sds.h testhelp.h sdsalloc.h
	$(CC) -o sds-test sds.c -Wall -std=c99 -pedantic -O2 -DSDS_TEST_MAIN
	@echo ">>> Type ./sds-test to run the sds.c unit tests."

clean: 
	rm -f *.o

static_lib: sds.c sds.h sdsalloc.h
	$(CC) -c -o sds.o sds.c -Wall -std=c99 -pedantic -O2
	ar rcs libsds.a sds.o
	@echo ">>> Static library created: libsds.a"

dynamic_lib: sds.c sds.h sdsalloc.h
	$(CC) -fPIC -c -o sds.o sds.c -Wall -std=c99 -pedantic -O2
	$(CC) -shared -o libsds.so sds.o
	@echo ">>> Dynamic library created: libsds.so"
