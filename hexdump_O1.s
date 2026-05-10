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
	.text
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
	movl	$.LC0, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
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
	call	fopen
	movq	%rax, %r14
	movl	$0, %r13d
	testq	%rax, %rax
	jne	.L4
	movl	$.LC2, %edi
	call	perror
	movl	$1, %eax
	jmp	.L1
.L5:
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
.L6:
	addq	$1, %rbx
	cmpq	$16, %rbx
	je	.L17
.L7:
	cmpq	%rbx, %rbp
	jbe	.L5
	movzbl	(%rsp,%rbx), %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	jmp	.L6
.L17:
	movl	$124, %edi
	call	putchar
	call	__ctype_b_loc
	movq	%rax, %r12
	movq	%rsp, %rbx
	leaq	0(%rbp,%rbx), %r15
	jmp	.L10
.L8:
	movl	$46, %edi
	call	putchar
.L9:
	addq	$1, %rbx
	cmpq	%r15, %rbx
	je	.L18
.L10:
	movzbl	(%rbx), %edi
	movzbl	%dil, %edx
	movq	(%r12), %rax
	testb	$64, 1(%rax,%rdx,2)
	je	.L8
	movzbl	%dil, %edi
	call	putchar
	jmp	.L9
.L18:
	movl	$.LC6, %edi
	call	puts
	addl	%ebp, %r13d
.L4:
	movq	%r14, %rcx
	movl	$16, %edx
	movl	$1, %esi
	movq	%rsp, %rdi
	call	fread
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L19
	movl	%r13d, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %ebx
	jmp	.L7
.L19:
	movq	%r14, %rdi
	call	fclose
	movl	$0, %eax
	jmp	.L1
	.cfi_endproc
.LFE13:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits
