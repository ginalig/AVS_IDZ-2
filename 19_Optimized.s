	.file	"19.c"
	.intel_syntax noprefix
	.text
	.globl	solve
	.type	solve, @function
solve:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -8[rbp], 0
	jmp	.L2
.L3:
	cmp	DWORD PTR -12[rbp], 32
	jle	.L2
	cmp	DWORD PTR -12[rbp], 126
	jg	.L2
	add	QWORD PTR -8[rbp], 1
.L2:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	fgetc@PLT
	mov	DWORD PTR -12[rbp], eax
	cmp	DWORD PTR -12[rbp], -1
	jne	.L3
	mov	rax, QWORD PTR -8[rbp]
	leave
	ret
	.size	solve, .-solve
	.section	.rodata
.LC0:
	.string	"Incorrect input!"
.LC1:
	.string	"r"
.LC2:
	.string	"File not found!"
.LC3:
	.string	"w"
.LC4:
	.string	"%ld"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	DWORD PTR -36[rbp], edi
	mov	QWORD PTR -48[rbp], rsi
	cmp	DWORD PTR -36[rbp], 3
	je	.L6
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L7
.L6:
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC1[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	cmp	QWORD PTR -24[rbp], 0
	jne	.L8
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L7
.L8:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	solve
	cdqe
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, .LC4[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
.L7:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
