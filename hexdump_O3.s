	.file	"hexdump.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
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
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB13:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	cmpl	$2, %edi
	je	.L2
	movq	(%rsi), %rdx
	movq	stderr(%rip), %rdi
	movl	$.LC0, %esi
	xorl	%eax, %eax
	call	fprintf
	movl	$1, %eax
.L1:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L2:
	.cfi_restore_state
	movq	8(%rsi), %rdi
	movl	$.LC1, %esi
	xorl	%r12d, %r12d
	call	fopen
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L19
	.p2align 4,,10
	.p2align 3
.L4:
	movq	%r13, %rcx
	movl	$16, %edx
	movl	$1, %esi
	movq	%rsp, %rdi
	call	fread
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L20
	movl	%r12d, %esi
	movl	$.LC3, %edi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	printf
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L22:
	movzbl	(%rsp,%rbx), %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	printf
	cmpq	$16, %rbx
	je	.L21
.L7:
	cmpq	%rbx, %rbp
	ja	.L22
	movl	$.LC5, %edi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	printf
	cmpq	$16, %rbx
	jne	.L7
.L21:
	movl	$124, %edi
	movq	%rsp, %rbx
	leaq	(%rsp,%rbp), %r14
	call	putchar
	call	__ctype_b_loc
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L10:
	movzbl	(%rbx), %edx
	movq	(%r15), %rax
	movq	%rdx, %rdi
	testb	$64, 1(%rax,%rdx,2)
	jne	.L17
	movl	$46, %edi
.L17:
	call	putchar
	addq	$1, %rbx
	cmpq	%rbx, %r14
	jne	.L10
	movl	$.LC6, %edi
	addl	%ebp, %r12d
	call	puts
	jmp	.L4
.L20:
	movq	%r13, %rdi
	call	fclose
	xorl	%eax, %eax
	jmp	.L1
.L19:
	movl	$.LC2, %edi
	call	perror
	movl	$1, %eax
	jmp	.L1
	.cfi_endproc
.LFE13:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits
