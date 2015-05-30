	.file	"functions.c"
	.globl	n
	.data
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.long	1000000
	.comm	i,4,4
	.text
	.globl	loadArray
	.type	loadArray, @function
loadArray:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	movl	$0, (%esp)
	call	time
	movl	%eax, (%esp)
	call	srand
	movl	$0, i
	jmp	.L2
.L3:
	movl	i, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ebx
	movl	$1000, 4(%esp)
	movl	$0, (%esp)
	call	getRandomNumber
	movl	%eax, (%ebx)
	movl	i, %eax
	addl	$1, %eax
	movl	%eax, i
.L2:
	movl	i, %edx
	movl	n, %eax
	cmpl	%eax, %edx
	jl	.L3
	addl	$20, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	loadArray, .-loadArray
	.globl	sortArray
	.type	sortArray, @function
sortArray:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	n, %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	quickSort
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	sortArray, .-sortArray
	.section	.rodata
.LC0:
	.string	"%d\n"
	.text
	.globl	printArray
	.type	printArray, @function
printArray:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$0, i
	jmp	.L6
.L7:
	movl	i, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	movl	i, %eax
	addl	$1, %eax
	movl	%eax, i
.L6:
	movl	i, %edx
	movl	n, %eax
	cmpl	%eax, %edx
	jl	.L7
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	printArray, .-printArray
	.globl	getRandomNumber
	.type	getRandomNumber, @function
getRandomNumber:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$0, -12(%ebp)
	movl	$0, -20(%ebp)
	movl	$0, -16(%ebp)
	movl	8(%ebp), %eax
	cmpl	12(%ebp), %eax
	jge	.L9
	movl	8(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	12(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -16(%ebp)
	jmp	.L10
.L9:
	movl	12(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -20(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
.L10:
	call	rand
	movl	-20(%ebp), %edx
	movl	-16(%ebp), %ecx
	subl	%edx, %ecx
	cltd
	idivl	%ecx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	getRandomNumber, .-getRandomNumber
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
