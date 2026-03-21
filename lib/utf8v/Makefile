all: lib test

lib: utf8v.v
	v -cc gcc -shared -g utf8v.v -o ../libutf8v.so

lib-win: utf8v.v
	v -os windows utf8v.v -shared -g -o ../libutf8v.dll

test: libutf8v.h ../libutf8v.so utf8test.c
	gcc utf8test.c ../libutf8v.so -g -o utf8test -Wl,-rpath=.

test-win: libutf8v.h libutf8v.dll utf8test.c
	zig cc --target=x86_64-windows-gnu utf8test.c -g ../libutf8v.dll -o utf8test.exe -Wl,-rpath=.
	cp ../libutf8v.dll utf8test.exe utf8test.pdb utf8test.c /mnt/c/Users/jorge/Documents/Programming

clean:
	rm -f ../*.so utf8test
	rm -f ../*.dll utf8test.exe utf8test.pdb libutf8v.def