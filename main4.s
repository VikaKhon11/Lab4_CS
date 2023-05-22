.include "defs.h"

.section .bss

buffer: .byte 0

.section .text

.global _start

_start:
	movq $buffer, %rsi
	movq $1, %rdx
loop:
	movq $SYS_READ, %rax
	movq $STDIN, %rdi
	syscall

	addb $13, buffer

	movq $SYS_WRITE, %rax
	movq $STDOUT, %rdi
	syscall

	jmp loop

end:
	movq $SYS_EXIT, %rax
	movq $0, %rdi
	syscall

