boot: boot.asm
	nasm -f elf32 boot.asm

kernel: kernel.asm
	nasm -f elf32 kernel.asm

run: boot kernel
	ld -m elf_i386 -T linker.ld -o ./isodir/boot/hammer boot.o kernel.o
	grub-mkrescue -o hammer.iso ./isodir
	qemu-system-i386 -cdrom hammer.iso
