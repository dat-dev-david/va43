all:
	nasm -f bin boot.asm -o bin/boot.bin
	nasm -f bin stagetwo.asm -o bin/boot2.bin

.PHONY: clean

clean:
	rm bin/boot.bin
	rm bin/boot2.bin