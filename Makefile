all:
	nasm -f bin boot/x86/x64/init.asm -o bin/init.bin

.PHONY: clean

clean:
	rm bin/init.bin