# Нигай Александр БПИ-219

# Вариант 19

# Отчет по ИДЗ №2

## Выполнено на 7 баллов

### Код на C

```c
#include <stdio.h>
#include <stdlib.h>

int solve(FILE *fp) {
    long res = 0;
    int c;
    while ((c = fgetc(fp)) != EOF) {
        if (c >= 33 && c <= 126) {
            res++;
        }
    }
    return res;
}

int main(int argc, char *argv[]) {
    long ans;
    FILE *fp;
    if (argc != 3) {
        printf("Incorrect input!");
        return 0;
    }
    fp = fopen(argv[1], "r");
    if (!fp) {
        printf("File not found!\n");
        return 0;
    }
    ans = solve(fp);
    FILE *fp2;
    fp2 = fopen(argv[2], "w");
    fprintf(fp2, "%ld", ans);
    fclose(fp2);
    return 0;
}
```

### Компиляция программы без оптимизаций

```sh
gcc -masm=intel -S 19.c -o 19.s
```

### Компиляция программы с оптимизацией

```sh
gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables -fcf-protection=none 19.c -o 19_Optimized.s
```



### Разбиение Asm кода на две единицы компиляции

#### 19_1.s

```assembly
	.file	"19_registers.c"
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

```

#### 19_2.s

```assembly
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

```

### Использование регистров процессора

Для хранения локальных переменных были использованы регистры **rbx**, **rsp**, **rbp**, **r12** (в комментариях подчеркнуто).

### Тестовые прогоны

Все тестовые входные данные лежат в директории */test_input*, они представляют из себя файлы с текстом в кодировке ASCII.

Выходные данные тестов для программ 19.out, 19_Optimized.out, 19_1_2.out (программа из двух единиц компиляции) находятся в соответствующих директориях.

Тестирование показало, что все программы на одних данных выдавали один результат.

