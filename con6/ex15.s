	.file	"ex15.c"
	.intel_syntax noprefix
	.text
	.comm	fin,4,4
	.comm	fout,4,4
	.globl	find
	.type	find, @function
find:
	push	ebp
	mov	ebp, esp
	push	edi
	push	esi
	push	ebx
	sub	esp, 20
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [ebp-24], eax
	mov	eax, DWORD PTR [ebp+16]
	mov	DWORD PTR [ebp-20], eax
	cmp	DWORD PTR [ebp+8], 0
	jne	.L2
	mov	eax, 0
	jmp	.L3
.L2:
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+8]
	mov	ebx, eax
	xor	ebx, DWORD PTR [ebp-24]
	mov	esi, ebx
	mov	eax, edx
	xor	eax, DWORD PTR [ebp-20]
	mov	edi, eax
	mov	eax, edi
	or	eax, esi
	test	eax, eax
	jne	.L4
	mov	eax, DWORD PTR [ebp+8]
	jmp	.L3
.L4:
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [ebp-20], edx
	ja	.L5
	cmp	DWORD PTR [ebp-20], edx
	jb	.L13
	cmp	DWORD PTR [ebp-24], eax
	jnb	.L5
.L13:
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+20]
	test	eax, eax
	je	.L14
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR [ebp+8], eax
	jmp	.L2
.L5:
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+24]
	test	eax, eax
	je	.L15
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR [ebp+8], eax
	jmp	.L2
.L14:
	nop
	jmp	.L9
.L15:
	nop
.L9:
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+8]
	mov	ebx, eax
	xor	ebx, DWORD PTR [ebp-24]
	mov	DWORD PTR [ebp-32], ebx
	mov	eax, edx
	xor	eax, DWORD PTR [ebp-20]
	mov	DWORD PTR [ebp-28], eax
	mov	eax, DWORD PTR [ebp-28]
	or	eax, DWORD PTR [ebp-32]
	test	eax, eax
	jne	.L11
	mov	eax, DWORD PTR [ebp+8]
	jmp	.L3
.L11:
	mov	eax, 0
.L3:
	add	esp, 20
	pop	ebx
	pop	esi
	pop	edi
	pop	ebp
	ret
	.size	find, .-find
	.globl	freetree
	.type	freetree, @function
freetree:
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	cmp	DWORD PTR [ebp+8], 0
	je	.L18
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+20]
	sub	esp, 12
	push	eax
	call	freetree
	add	esp, 16
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+24]
	sub	esp, 12
	push	eax
	call	freetree
	add	esp, 16
	sub	esp, 12
	push	DWORD PTR [ebp+8]
	call	free
	add	esp, 16
.L18:
	nop
	leave
	ret
	.size	freetree, .-freetree
	.type	height, @function
height:
	push	ebp
	mov	ebp, esp
	cmp	DWORD PTR [ebp+8], 0
	je	.L20
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+16]
	jmp	.L22
.L20:
	mov	eax, 0
.L22:
	pop	ebp
	ret
	.size	height, .-height
	.type	max, @function
max:
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD PTR [ebp+8]
	cmp	DWORD PTR [ebp+12], eax
	cmovge	eax, DWORD PTR [ebp+12]
	pop	ebp
	ret
	.size	max, .-max
	.type	SingleRotateWithLeft, @function
SingleRotateWithLeft:
	push	ebp
	mov	ebp, esp
	push	ebx
	sub	esp, 16
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR [ebp-8], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	edx, DWORD PTR [ebp-8]
	mov	edx, DWORD PTR [edx+24]
	mov	DWORD PTR [eax+20], edx
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ebp-8]
	mov	DWORD PTR [eax+24], edx
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	height
	add	esp, 4
	mov	ebx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	height
	add	esp, 4
	push	ebx
	push	eax
	call	max
	add	esp, 8
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	add	edx, 1
	mov	DWORD PTR [eax+16], edx
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	ebx, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [ebp-8]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	height
	add	esp, 4
	push	ebx
	push	eax
	call	max
	add	esp, 8
	lea	edx, [eax+1]
	mov	eax, DWORD PTR [ebp-8]
	mov	DWORD PTR [eax+16], edx
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [ebp-8]
	mov	DWORD PTR [eax], edx
	nop
	mov	ebx, DWORD PTR [ebp-4]
	leave
	ret
	.size	SingleRotateWithLeft, .-SingleRotateWithLeft
	.type	SingleRotateWithRight, @function
SingleRotateWithRight:
	push	ebp
	mov	ebp, esp
	push	ebx
	sub	esp, 16
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR [ebp-8], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	edx, DWORD PTR [ebp-8]
	mov	edx, DWORD PTR [edx+20]
	mov	DWORD PTR [eax+24], edx
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ebp-8]
	mov	DWORD PTR [eax+20], edx
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	height
	add	esp, 4
	mov	ebx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	height
	add	esp, 4
	push	ebx
	push	eax
	call	max
	add	esp, 8
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	add	edx, 1
	mov	DWORD PTR [eax+16], edx
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	ebx, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [ebp-8]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	height
	add	esp, 4
	push	ebx
	push	eax
	call	max
	add	esp, 8
	lea	edx, [eax+1]
	mov	eax, DWORD PTR [ebp-8]
	mov	DWORD PTR [eax+16], edx
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [ebp-8]
	mov	DWORD PTR [eax], edx
	nop
	mov	ebx, DWORD PTR [ebp-4]
	leave
	ret
	.size	SingleRotateWithRight, .-SingleRotateWithRight
	.type	DoubleRotateWithLeft, @function
DoubleRotateWithLeft:
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	add	eax, 20
	push	eax
	call	SingleRotateWithRight
	add	esp, 4
	push	DWORD PTR [ebp+8]
	call	SingleRotateWithLeft
	add	esp, 4
	nop
	leave
	ret
	.size	DoubleRotateWithLeft, .-DoubleRotateWithLeft
	.type	DoubleRotateWithRight, @function
DoubleRotateWithRight:
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	add	eax, 24
	push	eax
	call	SingleRotateWithLeft
	add	esp, 4
	push	DWORD PTR [ebp+8]
	call	SingleRotateWithRight
	add	esp, 4
	nop
	leave
	ret
	.size	DoubleRotateWithRight, .-DoubleRotateWithRight
	.globl	insert
	.type	insert, @function
insert:
	push	ebp
	mov	ebp, esp
	push	ebx
	sub	esp, 36
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [ebp-32], eax
	mov	eax, DWORD PTR [ebp+16]
	mov	DWORD PTR [ebp-28], eax
	mov	eax, DWORD PTR [ebp+20]
	mov	DWORD PTR [ebp-40], eax
	mov	eax, DWORD PTR [ebp+24]
	mov	DWORD PTR [ebp-36], eax
	cmp	DWORD PTR [ebp+8], 0
	je	.L30
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	test	eax, eax
	jne	.L31
.L30:
	sub	esp, 12
	push	28
	call	malloc
	add	esp, 16
	mov	DWORD PTR [ebp-12], eax
	mov	ecx, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [ebp-32]
	mov	edx, DWORD PTR [ebp-28]
	mov	DWORD PTR [ecx+8], eax
	mov	DWORD PTR [ecx+12], edx
	mov	ecx, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [ebp-40]
	mov	edx, DWORD PTR [ebp-36]
	mov	DWORD PTR [ecx], eax
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [eax+16], 1
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [eax+20], 0
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [eax+24], 0
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [eax+16], 1
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [ebp-12]
	mov	DWORD PTR [eax], edx
	jmp	.L29
.L31:
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	edx, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [ebp-28], edx
	ja	.L33
	cmp	DWORD PTR [ebp-28], edx
	jb	.L42
	cmp	DWORD PTR [ebp-32], eax
	ja	.L33
.L42:
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	add	eax, 20
	sub	esp, 12
	push	DWORD PTR [ebp-36]
	push	DWORD PTR [ebp-40]
	push	DWORD PTR [ebp-28]
	push	DWORD PTR [ebp-32]
	push	eax
	call	insert
	add	esp, 32
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+20]
	sub	esp, 12
	push	eax
	call	height
	add	esp, 16
	mov	ebx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+24]
	sub	esp, 12
	push	eax
	call	height
	add	esp, 16
	sub	ebx, eax
	mov	eax, ebx
	cmp	eax, 2
	jne	.L38
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+20]
	mov	edx, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [ebp-28], edx
	ja	.L36
	cmp	DWORD PTR [ebp-28], edx
	jb	.L43
	cmp	DWORD PTR [ebp-32], eax
	jnb	.L36
.L43:
	sub	esp, 12
	push	DWORD PTR [ebp+8]
	call	SingleRotateWithLeft
	add	esp, 16
	jmp	.L38
.L36:
	sub	esp, 12
	push	DWORD PTR [ebp+8]
	call	DoubleRotateWithLeft
	add	esp, 16
	jmp	.L38
.L33:
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	edx, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [ebp-28], edx
	jb	.L38
	cmp	DWORD PTR [ebp-28], edx
	ja	.L44
	cmp	DWORD PTR [ebp-32], eax
	jbe	.L38
.L44:
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	add	eax, 24
	sub	esp, 12
	push	DWORD PTR [ebp-36]
	push	DWORD PTR [ebp-40]
	push	DWORD PTR [ebp-28]
	push	DWORD PTR [ebp-32]
	push	eax
	call	insert
	add	esp, 32
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+24]
	sub	esp, 12
	push	eax
	call	height
	add	esp, 16
	mov	ebx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+20]
	sub	esp, 12
	push	eax
	call	height
	add	esp, 16
	sub	ebx, eax
	mov	eax, ebx
	cmp	eax, 2
	jne	.L38
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+24]
	mov	edx, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [ebp-28], edx
	jb	.L40
	cmp	DWORD PTR [ebp-28], edx
	ja	.L45
	cmp	DWORD PTR [ebp-32], eax
	jbe	.L40
.L45:
	sub	esp, 12
	push	DWORD PTR [ebp+8]
	call	SingleRotateWithRight
	add	esp, 16
	jmp	.L38
.L40:
	sub	esp, 12
	push	DWORD PTR [ebp+8]
	call	DoubleRotateWithRight
	add	esp, 16
.L38:
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+24]
	sub	esp, 12
	push	eax
	call	height
	add	esp, 16
	mov	ebx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+20]
	sub	esp, 12
	push	eax
	call	height
	add	esp, 16
	sub	esp, 8
	push	ebx
	push	eax
	call	max
	add	esp, 16
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	add	edx, 1
	mov	DWORD PTR [eax+16], edx
.L29:
	mov	ebx, DWORD PTR [ebp-4]
	leave
	ret
	.size	insert, .-insert
	.globl	myhash
	.type	myhash, @function
myhash:
	push	ebp
	mov	ebp, esp
	push	ebx
	sub	esp, 52
	mov	DWORD PTR [ebp-16], 0
	mov	DWORD PTR [ebp-12], 0
	sub	esp, 12
	push	DWORD PTR [ebp+8]
	call	strlen
	add	esp, 16
	mov	DWORD PTR [ebp-44], eax
	mov	DWORD PTR [ebp-24], 1
	mov	DWORD PTR [ebp-20], 0
	mov	DWORD PTR [ebp-28], 0
	jmp	.L47
.L51:
	mov	DWORD PTR [ebp-40], 30
	mov	DWORD PTR [ebp-36], 0
	mov	edx, DWORD PTR [ebp-28]
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	cmp	al, 45
	jne	.L48
	mov	DWORD PTR [ebp-40], 29
	mov	DWORD PTR [ebp-36], 0
	jmp	.L49
.L48:
	mov	edx, DWORD PTR [ebp-28]
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	cmp	al, 46
	jne	.L50
	mov	DWORD PTR [ebp-40], 28
	mov	DWORD PTR [ebp-36], 0
	jmp	.L49
.L50:
	mov	edx, DWORD PTR [ebp-28]
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	movsx	eax, al
	sub	eax, 97
	cdq
	mov	DWORD PTR [ebp-40], eax
	mov	DWORD PTR [ebp-36], edx
.L49:
	mov	eax, DWORD PTR [ebp-24]
	mov	edx, DWORD PTR [ebp-20]
	mov	ecx, DWORD PTR [ebp-40]
	mov	ebx, ecx
	imul	ebx, edx
	mov	ecx, DWORD PTR [ebp-36]
	imul	ecx, eax
	add	ecx, ebx
	mul	DWORD PTR [ebp-40]
	add	ecx, edx
	mov	edx, ecx
	add	DWORD PTR [ebp-16], eax
	adc	DWORD PTR [ebp-12], edx
	mov	eax, DWORD PTR [ebp-20]
	imul	edx, eax, 63
	mov	eax, DWORD PTR [ebp-24]
	imul	eax, eax, 0
	lea	ecx, [edx+eax]
	mov	eax, 63
	mul	DWORD PTR [ebp-24]
	add	ecx, edx
	mov	edx, ecx
	mov	DWORD PTR [ebp-24], eax
	mov	DWORD PTR [ebp-20], edx
	mov	DWORD PTR [ebp-24], eax
	mov	DWORD PTR [ebp-20], edx
	add	DWORD PTR [ebp-28], 1
.L47:
	mov	eax, DWORD PTR [ebp-28]
	cmp	eax, DWORD PTR [ebp-44]
	jl	.L51
	mov	eax, DWORD PTR [ebp-16]
	mov	edx, DWORD PTR [ebp-12]
	mov	ebx, DWORD PTR [ebp-4]
	leave
	ret
	.size	myhash, .-myhash
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"./input.txt"
.LC2:
	.string	"w"
.LC3:
	.string	"./output.txt"
.LC4:
	.string	"%d"
.LC5:
	.string	"%s %llu"
.LC6:
	.string	"%llu\n"
.LC7:
	.string	"-1\n"
	.text
	.globl	main
	.type	main, @function
main:
	lea	ecx, [esp+4]
	and	esp, -16
	push	DWORD PTR [ecx-4]
	push	ebp
	mov	ebp, esp
	push	ecx
	sub	esp, 164
	sub	esp, 8
	push	OFFSET FLAT:.LC0
	push	OFFSET FLAT:.LC1
	call	fopen
	add	esp, 16
	mov	DWORD PTR fin, eax
	sub	esp, 8
	push	OFFSET FLAT:.LC2
	push	OFFSET FLAT:.LC3
	call	fopen
	add	esp, 16
	mov	DWORD PTR fout, eax
	mov	DWORD PTR [ebp-48], 0
	mov	eax, DWORD PTR fin
	sub	esp, 4
	lea	edx, [ebp-52]
	push	edx
	push	OFFSET FLAT:.LC4
	push	eax
	call	__isoc99_fscanf
	add	esp, 16
	mov	DWORD PTR [ebp-12], 0
	jmp	.L54
.L57:
	mov	eax, DWORD PTR fin
	lea	edx, [ebp-168]
	push	edx
	lea	edx, [ebp-157]
	push	edx
	push	OFFSET FLAT:.LC5
	push	eax
	call	__isoc99_fscanf
	add	esp, 16
	sub	esp, 12
	lea	eax, [ebp-157]
	push	eax
	call	myhash
	add	esp, 16
	mov	DWORD PTR [ebp-40], eax
	mov	DWORD PTR [ebp-36], edx
	mov	eax, DWORD PTR [ebp-48]
	sub	esp, 4
	push	DWORD PTR [ebp-36]
	push	DWORD PTR [ebp-40]
	push	eax
	call	find
	add	esp, 16
	mov	DWORD PTR [ebp-44], eax
	cmp	DWORD PTR [ebp-44], 0
	je	.L55
	mov	eax, DWORD PTR [ebp-168]
	mov	edx, DWORD PTR [ebp-164]
	mov	ecx, DWORD PTR [ebp-44]
	mov	DWORD PTR [ecx], eax
	mov	DWORD PTR [ecx+4], edx
	jmp	.L56
.L55:
	mov	eax, DWORD PTR [ebp-168]
	mov	edx, DWORD PTR [ebp-164]
	sub	esp, 12
	push	edx
	push	eax
	push	DWORD PTR [ebp-36]
	push	DWORD PTR [ebp-40]
	lea	eax, [ebp-48]
	push	eax
	call	insert
	add	esp, 32
.L56:
	add	DWORD PTR [ebp-12], 1
.L54:
	mov	eax, DWORD PTR [ebp-52]
	cmp	DWORD PTR [ebp-12], eax
	jl	.L57
	mov	eax, DWORD PTR fin
	sub	esp, 4
	lea	edx, [ebp-52]
	push	edx
	push	OFFSET FLAT:.LC4
	push	eax
	call	__isoc99_fscanf
	add	esp, 16
	mov	DWORD PTR [ebp-16], 0
	jmp	.L58
.L61:
	mov	eax, DWORD PTR fin
	lea	edx, [ebp-168]
	push	edx
	lea	edx, [ebp-157]
	push	edx
	push	OFFSET FLAT:.LC5
	push	eax
	call	__isoc99_fscanf
	add	esp, 16
	sub	esp, 12
	lea	eax, [ebp-157]
	push	eax
	call	myhash
	add	esp, 16
	mov	DWORD PTR [ebp-24], eax
	mov	DWORD PTR [ebp-20], edx
	mov	eax, DWORD PTR [ebp-48]
	sub	esp, 4
	push	DWORD PTR [ebp-20]
	push	DWORD PTR [ebp-24]
	push	eax
	call	find
	add	esp, 16
	mov	DWORD PTR [ebp-28], eax
	cmp	DWORD PTR [ebp-28], 0
	je	.L59
	mov	eax, DWORD PTR [ebp-28]
	mov	edx, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR fout
	push	edx
	push	eax
	push	OFFSET FLAT:.LC6
	push	ecx
	call	fprintf
	add	esp, 16
	jmp	.L60
.L59:
	mov	eax, DWORD PTR fout
	push	eax
	push	3
	push	1
	push	OFFSET FLAT:.LC7
	call	fwrite
	add	esp, 16
.L60:
	add	DWORD PTR [ebp-16], 1
.L58:
	mov	eax, DWORD PTR [ebp-52]
	cmp	DWORD PTR [ebp-16], eax
	jl	.L61
	mov	eax, DWORD PTR fin
	sub	esp, 12
	push	eax
	call	fclose
	add	esp, 16
	mov	eax, DWORD PTR fout
	sub	esp, 12
	push	eax
	call	fclose
	add	esp, 16
	mov	eax, 0
	mov	ecx, DWORD PTR [ebp-4]
	leave
	lea	esp, [ecx-4]
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
