	.file	"19.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	solve
	.type	solve, @function
solve:
	push	rbp # push rbp
	mov	rbp, rdi # rbp = fp
	push	rbx # push rbx
	xor	ebx, ebx
	sub	rsp, 8
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L4:
	sub	eax, 33 # c -= 33
	cmp	eax, 94 # c >= 94
	adc	rbx, 0 # c < 94 ? 0 : 1
.L2:
	mov	rdi, rbp # rdi = fp
	call	fgetc@PLT
	cmp	eax, -1 # c != EOF
	jne	.L4
	add	rsp, 8 # rsp + 1
	mov	eax, ebx # eax = rbx
	pop	rbx # pop rbx
	pop	rbp # pop rbp
	ret
	.size	solve, .-solve
	.section	.rodata.str1.1,"aMS",@progbits,1
