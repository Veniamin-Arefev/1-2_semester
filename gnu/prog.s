	.file	"prog.c"
	.intel_syntax noprefix
	.text
	.globl	exchange
	.type	exchange, @function
exchange:
	endbr32
	push	ebp
	mov	ebp, esp
	sub	esp, 16
	mov	DWORD PTR [ebp-4], 1
	mov	DWORD PTR [ebp-8], 0
	jmp	.L2
.L3:
	mov	eax, DWORD PTR [ebp-8]
	add	DWORD PTR [ebp-4], eax
	add	DWORD PTR [ebp-8], 1
.L2:
	mov	eax, DWORD PTR [ebp+12]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	cmp	DWORD PTR [ebp-8], eax
	jl	.L3
	mov	eax, DWORD PTR [ebp-4]
	leave
	ret
	.size	exchange, .-exchange
	.section	.rodata
.LC0:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
	endbr32
	lea	ecx, [esp+4]
	and	esp, -16
	push	DWORD PTR [ecx-4]
	push	ebp
	mov	ebp, esp
	push	ecx
	sub	esp, 20
	sub	esp, 12
	push	40
	call	malloc
	add	esp, 16
	mov	DWORD PTR [ebp-12], eax
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [eax], 3
	mov	eax, DWORD PTR [ebp-12]
	add	eax, 4
	mov	DWORD PTR [eax], 7
	mov	eax, DWORD PTR [ebp-12]
	add	eax, 8
	mov	DWORD PTR [eax], 6
	mov	eax, DWORD PTR [ebp-12]
	add	eax, 12
	mov	DWORD PTR [eax], 9
	mov	eax, DWORD PTR [ebp-12]
	add	eax, 16
	mov	DWORD PTR [eax], 2
	mov	eax, DWORD PTR [ebp-12]
	add	eax, 20
	mov	DWORD PTR [eax], 1
	mov	eax, DWORD PTR [ebp-12]
	add	eax, 24
	mov	DWORD PTR [eax], 8
	mov	eax, DWORD PTR [ebp-12]
	add	eax, 28
	mov	DWORD PTR [eax], 5
	sub	esp, 8
	push	8
	push	DWORD PTR [ebp-12]
	call	exchange
	add	esp, 16
	sub	esp, 8
	push	eax
	push	OFFSET FLAT:.LC0
	call	printf
	add	esp, 16
	mov	eax, 0
	mov	ecx, DWORD PTR [ebp-4]
	leave
	lea	esp, [ecx-4]
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-10ubuntu2) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 4
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 4
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 4
4:
