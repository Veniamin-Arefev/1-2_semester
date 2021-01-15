%include "io.inc"
CEXTERN fopen
CEXTERN fclose
CEXTERN fscanf
CEXTERN fprintf
CEXTERN free
CEXTERN malloc
CEXTERN fwrite
CEXTERN strlen
section .data
    fin dd 4,4
    fout dd 4,4
    
section	.rodata
    LC0 db "a+", 0
    LC1 db "input.txt", 0
    LC2 db "a+", 0
    LC3 db "output.txt", 0
    LC4 db "%d", 0
    LC5 db "%%s %llu", 0
    LC6 db "%%llu\n", 0
    LC7 db "-1\n", 0
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
	lea	ecx, [esp+4]
	and	esp, -16
	push	DWORD  [ecx-4]
	push	ebp
	mov	ebp, esp
	push	ecx
	sub	esp, 164
	sub	esp, 8
	push	LC0
	push	LC1
	call	fopen
	add	esp, 16
	mov	DWORD  [fin], eax
	sub	esp, 8
	push	LC2
	push	LC3
	call	fopen
	add	esp, 16
	mov	DWORD  [fout], eax
	mov	DWORD  [ebp-48], 0
	mov	eax, DWORD  [fin]
	sub	esp, 4
	lea	edx, [ebp-52]
	push	edx
	push	LC4
	push	eax
	call	fscanf
	add	esp, 16
	mov	DWORD  [ebp-12], 0
	jmp	.L54
.L57:
	mov	eax, DWORD  [fin]
	lea	edx, [ebp-168]
	push	edx
	lea	edx, [ebp-157]
	push	edx
	push	LC5
	push	eax
	call	fscanf
	add	esp, 16
	sub	esp, 12
	lea	eax, [ebp-157]
	push	eax
	call	myhash
	add	esp, 16
	mov	DWORD  [ebp-40], eax
	mov	DWORD  [ebp-36], edx
	mov	eax, DWORD  [ebp-48]
	sub	esp, 4
	push	DWORD  [ebp-36]
	push	DWORD  [ebp-40]
	push	eax
	call	find
	add	esp, 16
	mov	DWORD  [ebp-44], eax
	cmp	DWORD  [ebp-44], 0
	je	.L55
	mov	eax, DWORD  [ebp-168]
	mov	edx, DWORD  [ebp-164]
	mov	ecx, DWORD  [ebp-44]
	mov	DWORD  [ecx], eax
	mov	DWORD  [ecx+4], edx
	jmp	.L56
.L55:
	mov	eax, DWORD  [ebp-168]
	mov	edx, DWORD  [ebp-164]
	sub	esp, 12
	push	edx
	push	eax
	push	DWORD  [ebp-36]
	push	DWORD  [ebp-40]
	lea	eax, [ebp-48]
	push	eax
	call	insert
	add	esp, 32
.L56:
	add	DWORD  [ebp-12], 1
.L54:
	mov	eax, DWORD  [ebp-52]
	cmp	DWORD  [ebp-12], eax
	jl	.L57
	mov	eax, DWORD  [fin]
	sub	esp, 4
	lea	edx, [ebp-52]
	push	edx
	push	LC4
	push	eax
	call	fscanf
	add	esp, 16
	mov	DWORD  [ebp-16], 0
	jmp	.L58
.L61:
	mov	eax, DWORD  fin
	lea	edx, [ebp-168]
	push	edx
	lea	edx, [ebp-157]
	push	edx
	push	LC5
	push	eax
	call	fscanf
	add	esp, 16
	sub	esp, 12
	lea	eax, [ebp-157]
	push	eax
	call	myhash
	add	esp, 16
	mov	DWORD  [ebp-24], eax
	mov	DWORD  [ebp-20], edx
	mov	eax, DWORD  [ebp-48]
	sub	esp, 4
	push	DWORD  [ebp-20]
	push	DWORD  [ebp-24]
	push	eax
	call	find
	add	esp, 16
	mov	DWORD  [ebp-28], eax
	cmp	DWORD  [ebp-28], 0
	je	.L59
	mov	eax, DWORD  [ebp-28]
	mov	edx, DWORD  [eax+4]
	mov	eax, DWORD  [eax]
	mov	ecx, DWORD  [fout]
	push	edx
	push	eax
	push	LC6
	push	ecx
	call	fprintf
	add	esp, 16
	jmp	.L60
.L59:
	mov	eax, DWORD  [fout]
	push	eax
	push	3
	push	1
	push	LC7
	call	fwrite
	add	esp, 16
.L60:
	add	DWORD  [ebp-16], 1
.L58:
	mov	eax, DWORD  [ebp-52]
	cmp	DWORD  [ebp-16], eax
	jl	.L61
	mov	eax, DWORD [fin]
	sub	esp, 12
	push	eax
	call	fclose
	add	esp, 16
	mov	eax, DWORD  [fout]
	sub	esp, 12
	push	eax
	call	fclose
	add	esp, 16
	mov	eax, 0
	mov	ecx, DWORD  [ebp-4]
	leave
	lea	esp, [ecx-4]
	ret

find:
	push	ebp
	mov	ebp, esp
	push	edi
	push	esi
	push	ebx
	sub	esp, 20
	mov	eax, DWORD  [ebp+12]
	mov	DWORD  [ebp-24], eax
	mov	eax, DWORD  [ebp+16]
	mov	DWORD  [ebp-20], eax
	cmp	DWORD  [ebp+8], 0
	jne	.L2
	mov	eax, 0
	jmp	.L3
.L2:
	mov	eax, DWORD  [ebp+8]
	mov	edx, DWORD  [eax+12]
	mov	eax, DWORD  [eax+8]
	mov	ebx, eax
	xor	ebx, DWORD  [ebp-24]
	mov	esi, ebx
	mov	eax, edx
	xor	eax, DWORD  [ebp-20]
	mov	edi, eax
	mov	eax, edi
	or	eax, esi
	test	eax, eax
	jne	.L4
	mov	eax, DWORD  [ebp+8]
	jmp	.L3
.L4:
	mov	eax, DWORD  [ebp+8]
	mov	edx, DWORD  [eax+12]
	mov	eax, DWORD  [eax+8]
	cmp	DWORD  [ebp-20], edx
	ja	.L5
	cmp	DWORD  [ebp-20], edx
	jb	.L13
	cmp	DWORD  [ebp-24], eax
	jnb	.L5
.L13:
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax+20]
	test	eax, eax
	je	.L14
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax+20]
	mov	DWORD  [ebp+8], eax
	jmp	.L2
.L5:
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax+24]
	test	eax, eax
	je	.L15
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax+24]
	mov	DWORD  [ebp+8], eax
	jmp	.L2
.L14:
	nop
	jmp	.L9
.L15:
	nop
.L9:
	mov	eax, DWORD  [ebp+8]
	mov	edx, DWORD  [eax+12]
	mov	eax, DWORD  [eax+8]
	mov	ebx, eax
	xor	ebx, DWORD  [ebp-24]
	mov	DWORD  [ebp-32], ebx
	mov	eax, edx
	xor	eax, DWORD  [ebp-20]
	mov	DWORD  [ebp-28], eax
	mov	eax, DWORD  [ebp-28]
	or	eax, DWORD  [ebp-32]
	test	eax, eax
	jne	.L11
	mov	eax, DWORD  [ebp+8]
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

freetree:
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	cmp	DWORD  [ebp+8], 0
	je	.L18
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax+20]
	sub	esp, 12
	push	eax
	call	freetree
	add	esp, 16
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax+24]
	sub	esp, 12
	push	eax
	call	freetree
	add	esp, 16
	sub	esp, 12
	push	DWORD  [ebp+8]
	call	free
	add	esp, 16
.L18:
	nop
	leave
	ret

height:
	push	ebp
	mov	ebp, esp
	cmp	DWORD  [ebp+8], 0
	je	.L20
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax+16]
	jmp	.L22
.L20:
	mov	eax, 0
.L22:
	pop	ebp
	ret

max:
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD  [ebp+8]
	cmp	DWORD  [ebp+12], eax
	cmovge	eax, DWORD  [ebp+12]
	pop	ebp
	ret

SingleRotateWithLeft:
	push	ebp
	mov	ebp, esp
	push	ebx
	sub	esp, 16
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	mov	eax, DWORD  [eax+20]
	mov	DWORD  [ebp-8], eax
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	mov	edx, DWORD  [ebp-8]
	mov	edx, DWORD  [edx+24]
	mov	DWORD  [eax+20], edx
	mov	eax, DWORD  [ebp+8]
	mov	edx, DWORD  [eax]
	mov	eax, DWORD  [ebp-8]
	mov	DWORD  [eax+24], edx
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	mov	eax, DWORD  [eax+24]
	push	eax
	call	height
	add	esp, 4
	mov	ebx, eax
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	mov	eax, DWORD  [eax+20]
	push	eax
	call	height
	add	esp, 4
	push	ebx
	push	eax
	call	max
	add	esp, 8
	mov	edx, eax
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	add	edx, 1
	mov	DWORD  [eax+16], edx
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	mov	ebx, DWORD  [eax+16]
	mov	eax, DWORD  [ebp-8]
	mov	eax, DWORD  [eax+20]
	push	eax
	call	height
	add	esp, 4
	push	ebx
	push	eax
	call	max
	add	esp, 8
	lea	edx, [eax+1]
	mov	eax, DWORD  [ebp-8]
	mov	DWORD  [eax+16], edx
	mov	eax, DWORD  [ebp+8]
	mov	edx, DWORD  [ebp-8]
	mov	DWORD  [eax], edx
	nop
	mov	ebx, DWORD  [ebp-4]
	leave
	ret

SingleRotateWithRight:
	push	ebp
	mov	ebp, esp
	push	ebx
	sub	esp, 16
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	mov	eax, DWORD  [eax+24]
	mov	DWORD  [ebp-8], eax
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	mov	edx, DWORD  [ebp-8]
	mov	edx, DWORD  [edx+20]
	mov	DWORD  [eax+24], edx
	mov	eax, DWORD  [ebp+8]
	mov	edx, DWORD  [eax]
	mov	eax, DWORD  [ebp-8]
	mov	DWORD  [eax+20], edx
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	mov	eax, DWORD  [eax+24]
	push	eax
	call	height
	add	esp, 4
	mov	ebx, eax
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	mov	eax, DWORD  [eax+20]
	push	eax
	call	height
	add	esp, 4
	push	ebx
	push	eax
	call	max
	add	esp, 8
	mov	edx, eax
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	add	edx, 1
	mov	DWORD  [eax+16], edx
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	mov	ebx, DWORD  [eax+16]
	mov	eax, DWORD  [ebp-8]
	mov	eax, DWORD  [eax+24]
	push	eax
	call	height
	add	esp, 4
	push	ebx
	push	eax
	call	max
	add	esp, 8
	lea	edx, [eax+1]
	mov	eax, DWORD  [ebp-8]
	mov	DWORD  [eax+16], edx
	mov	eax, DWORD  [ebp+8]
	mov	edx, DWORD  [ebp-8]
	mov	DWORD  [eax], edx
	nop
	mov	ebx, DWORD  [ebp-4]
	leave
	ret

DoubleRotateWithLeft:
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	add	eax, 20
	push	eax
	call	SingleRotateWithRight
	add	esp, 4
	push	DWORD  [ebp+8]
	call	SingleRotateWithLeft
	add	esp, 4
	nop
	leave
	ret

DoubleRotateWithRight:
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	add	eax, 24
	push	eax
	call	SingleRotateWithLeft
	add	esp, 4
	push	DWORD  [ebp+8]
	call	SingleRotateWithRight
	add	esp, 4
	nop
	leave
	ret

insert:
	push	ebp
	mov	ebp, esp
	push	ebx
	sub	esp, 36
	mov	eax, DWORD  [ebp+12]
	mov	DWORD  [ebp-32], eax
	mov	eax, DWORD  [ebp+16]
	mov	DWORD  [ebp-28], eax
	mov	eax, DWORD  [ebp+20]
	mov	DWORD  [ebp-40], eax
	mov	eax, DWORD  [ebp+24]
	mov	DWORD  [ebp-36], eax
	cmp	DWORD  [ebp+8], 0
	je	.L30
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	test	eax, eax
	jne	.L31
.L30:
	sub	esp, 12
	push	28
	call	malloc
	add	esp, 16
	mov	DWORD  [ebp-12], eax
	mov	ecx, DWORD  [ebp-12]
	mov	eax, DWORD  [ebp-32]
	mov	edx, DWORD  [ebp-28]
	mov	DWORD  [ecx+8], eax
	mov	DWORD  [ecx+12], edx
	mov	ecx, DWORD  [ebp-12]
	mov	eax, DWORD  [ebp-40]
	mov	edx, DWORD  [ebp-36]
	mov	DWORD  [ecx], eax
	mov	DWORD  [ecx+4], edx
	mov	eax, DWORD  [ebp-12]
	mov	DWORD  [eax+16], 1
	mov	eax, DWORD  [ebp-12]
	mov	DWORD  [eax+20], 0
	mov	eax, DWORD  [ebp-12]
	mov	DWORD  [eax+24], 0
	mov	eax, DWORD  [ebp-12]
	mov	DWORD  [eax+16], 1
	mov	eax, DWORD  [ebp+8]
	mov	edx, DWORD  [ebp-12]
	mov	DWORD  [eax], edx
	jmp	.L29
.L31:
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	mov	edx, DWORD  [eax+12]
	mov	eax, DWORD  [eax+8]
	cmp	DWORD  [ebp-28], edx
	ja	.L33
	cmp	DWORD  [ebp-28], edx
	jb	.L42
	cmp	DWORD  [ebp-32], eax
	ja	.L33
.L42:
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	add	eax, 20
	sub	esp, 12
	push	DWORD  [ebp-36]
	push	DWORD  [ebp-40]
	push	DWORD  [ebp-28]
	push	DWORD  [ebp-32]
	push	eax
	call	insert
	add	esp, 32
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	mov	eax, DWORD  [eax+20]
	sub	esp, 12
	push	eax
	call	height
	add	esp, 16
	mov	ebx, eax
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	mov	eax, DWORD  [eax+24]
	sub	esp, 12
	push	eax
	call	height
	add	esp, 16
	sub	ebx, eax
	mov	eax, ebx
	cmp	eax, 2
	jne	.L38
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	mov	eax, DWORD  [eax+20]
	mov	edx, DWORD  [eax+12]
	mov	eax, DWORD  [eax+8]
	cmp	DWORD  [ebp-28], edx
	ja	.L36
	cmp	DWORD  [ebp-28], edx
	jb	.L43
	cmp	DWORD  [ebp-32], eax
	jnb	.L36
.L43:
	sub	esp, 12
	push	DWORD  [ebp+8]
	call	SingleRotateWithLeft
	add	esp, 16
	jmp	.L38
.L36:
	sub	esp, 12
	push	DWORD  [ebp+8]
	call	DoubleRotateWithLeft
	add	esp, 16
	jmp	.L38
.L33:
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	mov	edx, DWORD  [eax+12]
	mov	eax, DWORD  [eax+8]
	cmp	DWORD  [ebp-28], edx
	jb	.L38
	cmp	DWORD  [ebp-28], edx
	ja	.L44
	cmp	DWORD  [ebp-32], eax
	jbe	.L38
.L44:
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	add	eax, 24
	sub	esp, 12
	push	DWORD  [ebp-36]
	push	DWORD  [ebp-40]
	push	DWORD  [ebp-28]
	push	DWORD  [ebp-32]
	push	eax
	call	insert
	add	esp, 32
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	mov	eax, DWORD  [eax+24]
	sub	esp, 12
	push	eax
	call	height
	add	esp, 16
	mov	ebx, eax
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	mov	eax, DWORD  [eax+20]
	sub	esp, 12
	push	eax
	call	height
	add	esp, 16
	sub	ebx, eax
	mov	eax, ebx
	cmp	eax, 2
	jne	.L38
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	mov	eax, DWORD  [eax+24]
	mov	edx, DWORD  [eax+12]
	mov	eax, DWORD  [eax+8]
	cmp	DWORD  [ebp-28], edx
	jb	.L40
	cmp	DWORD  [ebp-28], edx
	ja	.L45
	cmp	DWORD  [ebp-32], eax
	jbe	.L40
.L45:
	sub	esp, 12
	push	DWORD  [ebp+8]
	call	SingleRotateWithRight
	add	esp, 16
	jmp	.L38
.L40:
	sub	esp, 12
	push	DWORD  [ebp+8]
	call	DoubleRotateWithRight
	add	esp, 16
.L38:
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	mov	eax, DWORD  [eax+24]
	sub	esp, 12
	push	eax
	call	height
	add	esp, 16
	mov	ebx, eax
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	mov	eax, DWORD  [eax+20]
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
	mov	eax, DWORD  [ebp+8]
	mov	eax, DWORD  [eax]
	add	edx, 1
	mov	DWORD  [eax+16], edx
.L29:
	mov	ebx, DWORD  [ebp-4]
	leave
	ret

myhash:
	push	ebp
	mov	ebp, esp
	push	ebx
	sub	esp, 52
	mov	DWORD  [ebp-16], 0
	mov	DWORD  [ebp-12], 0
	sub	esp, 12
	push	DWORD  [ebp+8]
	call	strlen
	add	esp, 16
	mov	DWORD  [ebp-44], eax
	mov	DWORD  [ebp-24], 1
	mov	DWORD  [ebp-20], 0
	mov	DWORD  [ebp-28], 0
	jmp	.L47
.L51:
	mov	DWORD  [ebp-40], 30
	mov	DWORD  [ebp-36], 0
	mov	edx, DWORD  [ebp-28]
	mov	eax, DWORD  [ebp+8]
	add	eax, edx
	movzx	eax, BYTE  [eax]
	cmp	al, 45
	jne	.L48
	mov	DWORD  [ebp-40], 29
	mov	DWORD  [ebp-36], 0
	jmp	.L49
.L48:
	mov	edx, DWORD  [ebp-28]
	mov	eax, DWORD  [ebp+8]
	add	eax, edx
	movzx	eax, BYTE  [eax]
	cmp	al, 46
	jne	.L50
	mov	DWORD  [ebp-40], 28
	mov	DWORD  [ebp-36], 0
	jmp	.L49
.L50:
	mov	edx, DWORD  [ebp-28]
	mov	eax, DWORD  [ebp+8]
	add	eax, edx
	movzx	eax, BYTE  [eax]
	movsx	eax, al
	sub	eax, 97
	cdq
	mov	DWORD  [ebp-40], eax
	mov	DWORD  [ebp-36], edx
.L49:
	mov	eax, DWORD  [ebp-24]
	mov	edx, DWORD  [ebp-20]
	mov	ecx, DWORD  [ebp-40]
	mov	ebx, ecx
	imul	ebx, edx
	mov	ecx, DWORD  [ebp-36]
	imul	ecx, eax
	add	ecx, ebx
	mul	DWORD  [ebp-40]
	add	ecx, edx
	mov	edx, ecx
	add	DWORD  [ebp-16], eax
	adc	DWORD  [ebp-12], edx
	mov	eax, DWORD  [ebp-20]
	imul	edx, eax, 63
	mov	eax, DWORD  [ebp-24]
	imul	eax, eax, 0
	lea	ecx, [edx+eax]
	mov	eax, 63
	mul	DWORD  [ebp-24]
	add	ecx, edx
	mov	edx, ecx
	mov	DWORD  [ebp-24], eax
	mov	DWORD  [ebp-20], edx
	mov	DWORD  [ebp-24], eax
	mov	DWORD  [ebp-20], edx
	add	DWORD  [ebp-28], 1
.L47:
	mov	eax, DWORD  [ebp-28]
	cmp	eax, DWORD  [ebp-44]
	jl	.L51
	mov	eax, DWORD  [ebp-16]
	mov	edx, DWORD  [ebp-12]
	mov	ebx, DWORD  [ebp-4]
	leave
	ret
