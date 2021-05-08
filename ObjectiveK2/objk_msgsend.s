## OKObject objK_msgSend(OKObject self, OKMsg cmd) {
## 	  if( !self ) return NULL;
## 	  OKImp imp = objK_msgFind(self, cmd);
## 	  return ((OKObject(*)(void))imp)();
## }


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
## ADDED: Fix up the stack to what it was when we were called, also restore the BP to before our call.
addq	$32, %rsp
popq	%rbp
## CHANGED: Instead of callq, jump to the looked-up function so it returns to OUR caller.
jmp	*%rax
movq	%rax, -8(%rbp)
LBB1_3:
movq	-8(%rbp), %rax
addq	$32, %rsp
popq	%rbp
retq
.cfi_endproc
									## -- End function
.subsections_via_symbols
