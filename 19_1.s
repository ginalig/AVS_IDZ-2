	.file	"19.c"
	.intel_syntax noprefix
	.text
	.p2align 4
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
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	push	r12 # r12 = argc
	push	rbp # rbp = argv
	push	rbx # rbx = ans 
	cmp	edi, 3 #argc != 3
	je	.L8 
	lea	rsi, .LC0[rip] #rsi = "Incorrect input!"
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
.L9:
	pop	rbx # pop ans
	xor	eax, eax #eax = 0
	pop	rbp # pop argv
	pop	r12 # pop argc
	ret
.L8:
	mov	rdi, QWORD PTR 8[rsi] #rdi = argv[1]
	mov	rbx, rsi #rbx = argv
	lea	rsi, .LC1[rip] #rsi = "r"
	call	fopen@PLT #fopen(argv[1], "r")
	mov	rdi, rax #rdi = fp
	test	rax, rax #fp == NULL
	je	.L12 #if fp == NULL
	call	solve #ans = solve(fp)
	mov	rdi, QWORD PTR 16[rbx] #rdi = argv[2]
	lea	rsi, .LC3[rip] #rsi = "w"
	mov	ebp, eax #ebp = ans
	call	fopen@PLT #fopen(argv[2], "w")
	movsx	rcx, ebp #rcx = ans
	mov	esi, 1 
	lea	rdx, .LC4[rip] #rdx = "%ld"
	mov	r12, rax #r12 = fp2
	mov	rdi, rax #rdi = fp2
	xor	eax, eax #eax = 0
	call	__fprintf_chk@PLT
	mov	rdi, r12 #rdi = fp2
	call	fclose@PLT
	jmp	.L9
.L12:
	lea	rdi, .LC2[rip] #rdi = "File not found!"
	call	puts@PLT #puts("File not found!")
	jmp	.L9
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
