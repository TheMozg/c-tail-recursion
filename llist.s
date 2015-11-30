	.file	"llist.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.globl	list_create
	.type	list_create, @function
list_create:
.LFB38:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %ebx
	movl	$16, %edi
	call	malloc
	movl	%ebx, (%rax)
	movq	$0, 8(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE38:
	.size	list_create, .-list_create
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.globl	list_add_front
	.type	list_add_front, @function
list_add_front:
.LFB39:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movl	$16, %edi
	movl	%esi, %ebp
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	malloc
	movq	(%rbx), %rdx
	movl	%ebp, (%rax)
	movq	%rax, (%rbx)
	movq	%rdx, 8(%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	list_add_front, .-list_add_front
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.text.unlikely
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.globl	list_add_back
	.type	list_add_back, @function
list_add_back:
.LFB40:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	%esi, %r12d
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	(%rdi), %rbx
	testq	%rbx, %rbx
	jne	.L10
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L9:
	movq	%rax, %rbx
.L10:
	movq	8(%rbx), %rax
	testq	%rax, %rax
	jne	.L9
	movl	$16, %edi
	call	malloc
	movl	%r12d, (%rax)
	movq	$0, 8(%rax)
	movq	%rax, 8(%rbx)
.L5:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L13:
	.cfi_restore_state
	movq	%rdi, %rbp
	movl	$16, %edi
	call	malloc
	movl	%r12d, (%rax)
	movq	$0, 8(%rax)
	movq	%rax, 0(%rbp)
	jmp	.L5
	.cfi_endproc
.LFE40:
	.size	list_add_back, .-list_add_back
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.text.unlikely
.LCOLDB3:
	.text
.LHOTB3:
	.p2align 4,,15
	.globl	list_node_at
	.type	list_node_at, @function
list_node_at:
.LFB41:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L19
	testq	%rsi, %rsi
	je	.L20
	movq	8(%rdi), %rax
	movl	$1, %edx
	testq	%rax, %rax
	jne	.L21
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L18:
	movq	8(%rax), %rax
	addq	$1, %rdx
	testq	%rax, %rax
	je	.L15
.L21:
	cmpq	%rdx, %rsi
	jne	.L18
	rep ret
.L20:
	movq	%rdi, %rax
.L15:
	rep ret
.L23:
	rep ret
.L19:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE41:
	.size	list_node_at, .-list_node_at
	.section	.text.unlikely
.LCOLDE3:
	.text
.LHOTE3:
	.section	.text.unlikely
.LCOLDB4:
	.text
.LHOTB4:
	.p2align 4,,15
	.globl	list_get_at
	.type	list_get_at, @function
list_get_at:
.LFB42:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L30
	testq	%rsi, %rsi
	je	.L26
	movq	8(%rdi), %rdi
	movl	$1, %eax
	testq	%rdi, %rdi
	jne	.L33
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L37:
	movq	8(%rdi), %rdi
	addq	$1, %rax
	testq	%rdi, %rdi
	je	.L30
.L33:
	cmpq	%rax, %rsi
	jne	.L37
.L26:
	movl	(%rdi), %eax
	movl	%eax, (%rdx)
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L30:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE42:
	.size	list_get_at, .-list_get_at
	.section	.text.unlikely
.LCOLDE4:
	.text
.LHOTE4:
	.section	.text.unlikely
.LCOLDB5:
	.text
.LHOTB5:
	.p2align 4,,15
	.globl	list_sum
	.type	list_sum, @function
list_sum:
.LFB43:
	.cfi_startproc
	testq	%rdi, %rdi
	movl	%esi, %eax
	je	.L39
	.p2align 4,,10
	.p2align 3
.L40:
	addl	(%rdi), %eax
	movq	8(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L40
.L39:
	rep ret
	.cfi_endproc
.LFE43:
	.size	list_sum, .-list_sum
	.section	.text.unlikely
.LCOLDE5:
	.text
.LHOTE5:
	.section	.text.unlikely
.LCOLDB6:
	.text
.LHOTB6:
	.p2align 4,,15
	.globl	list_free
	.type	list_free, @function
list_free:
.LFB44:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L53
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.p2align 4,,10
	.p2align 3
.L49:
	movq	8(%rdi), %rbx
	call	free
	testq	%rbx, %rbx
	movq	%rbx, %rdi
	jne	.L49
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.L53:
	rep ret
	.cfi_endproc
.LFE44:
	.size	list_free, .-list_free
	.section	.text.unlikely
.LCOLDE6:
	.text
.LHOTE6:
	.ident	"GCC: (Ubuntu 5.2.1-22ubuntu2) 5.2.1 20151010"
	.section	.note.GNU-stack,"",@progbits
