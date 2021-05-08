	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.globl	_objK_msgFind                   ## -- Begin function objK_msgFind
	.p2align	4, 0x90
_objK_msgFind:                          ## @objK_msgFind
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
                                        ## kill: def $rax killed $eax
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_objK_msgSend                   ## -- Begin function objK_msgSend
	.p2align	4, 0x90
_objK_msgSend:                          ## @objK_msgSend
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	cmpq	$0, -16(%rbp)
	jne	LBB1_2
## %bb.1:
	movq	$0, -8(%rbp)
	jmp	LBB1_3
LBB1_2:
	movq	-16(%rbp), %rdi
	movq	-24(%rbp), %rsi
	callq	_objK_msgFind
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	-16(%rbp), %rdi
	movq	-24(%rbp), %rsi
	callq	*%rax
	movq	%rax, -8(%rbp)
LBB1_3:
	movq	-8(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	leaq	-24(%rbp), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$42, %edx
	callq	_objK_msgSend
	xorl	%ecx, %ecx
	movq	%rax, -32(%rbp)
	movl	%ecx, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"alloc"

.subsections_via_symbols
