	.file	"hexdump.c"
	.text
	.section	.rodata
.LC0:
	.string	"Usage: %s <filename>\n"
.LC1:
	.string	"rb"
.LC2:
	.string	"Error opening file"
.LC3:
	.string	"%08x "
.LC4:
	.string	"%02x "
.LC5:
	.string	"   "
.LC6:
	.string	"|"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	cmpl	$2, -68(%rbp)
	je	.L2
	movq	-80(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$1, %eax
	jmp	.L15
.L2:
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movl	$.LC1, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L4
	movl	$.LC2, %edi
	call	perror
	movl	$1, %eax
	jmp	.L15
.L4:
	movl	$0, -4(%rbp)
	jmp	.L5
.L14:
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movq	$0, -16(%rbp)
	jmp	.L6
.L9:
	movq	-16(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jnb	.L7
	leaq	-64(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	jmp	.L8
.L7:
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
.L8:
	addq	$1, -16(%rbp)
.L6:
	cmpq	$15, -16(%rbp)
	jbe	.L9
	movl	$124, %edi
	call	putchar
	movq	$0, -24(%rbp)
	jmp	.L10
.L13:
	call	__ctype_b_loc
	movq	(%rax), %rdx
	leaq	-64(%rbp), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$16384, %eax
	testl	%eax, %eax
	je	.L11
	leaq	-64(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %edi
	call	putchar
	jmp	.L12
.L11:
	movl	$46, %edi
	call	putchar
.L12:
	addq	$1, -24(%rbp)
.L10:
	movq	-24(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jb	.L13
	movl	$.LC6, %edi
	call	puts
	movq	-40(%rbp), %rax
	addl	%eax, -4(%rbp)
.L5:
	movq	-32(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L14
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	$0, %eax
.L15:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits
