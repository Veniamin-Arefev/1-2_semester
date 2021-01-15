%include "io.inc"

section	.rodata
    LC0 db "%d %d %d %d",0
    LC1 db"%d",10,0
section .text
global CMAIN
CMAIN:
	lea	ecx, [esp+4]
	and	esp, -16
	push	DWORD  [ecx-4]
	push	ebp
	mov	ebp, esp
	push	ecx
	sub	esp, 36
	lea	ecx, [ebp-36]
	add	ecx, 12
	lea	edx, [ebp-36]
	add	edx, 8
	lea	eax, [ebp-36]
	add	eax, 4
	sub	esp, 12
	push	ecx
	push	edx
	push	eax
	lea	eax, [ebp-36]
	push	eax
	push	LC0
	call	scanf
	add	esp, 32
	mov	edx, DWORD  [ebp-32]
	mov	eax, DWORD  [ebp-36]
	sub	esp, 8
	push	edx
	push	eax
	call	nod
	add	esp, 16
	mov	DWORD  [ebp-12], eax
	mov	edx, DWORD  [ebp-24]
	mov	eax, DWORD  [ebp-28]
	sub	esp, 8
	push	edx
	push	eax
	call	nod
	add	esp, 16
	mov	DWORD  [ebp-16], eax
	sub	esp, 8
	push	DWORD  [ebp-16]
	push	DWORD  [ebp-12]
	call	nod
	add	esp, 16
	mov	DWORD  [ebp-20], eax
	sub	esp, 8
	push	DWORD  [ebp-20]
	push	LC1
	call	printf
	add	esp, 16
	mov	eax, 0
	mov	ecx, DWORD  [ebp-4]
	leave
	lea	esp, [ecx-4]
	ret
nod:
	push	ebp
	mov	ebp, esp
	sub	esp, 16
	mov	eax, DWORD  [ebp+12]
	cmp	eax, DWORD  [ebp+8]
	jle	.L2
	mov	eax, DWORD  [ebp+8]
	mov	DWORD  [ebp-4], eax
	mov	eax, DWORD  [ebp+12]
	mov	DWORD  [ebp+8], eax
	mov	eax, DWORD  [ebp-4]
	mov	DWORD  [ebp+12], eax
.L2:
	mov	DWORD  [ebp-8], 0
	jmp	.L3
.L4:
	mov	eax, DWORD  [ebp+8]
	cdq
	idiv	DWORD  [ebp+12]
	mov	DWORD  [ebp-8], edx
	mov	eax, DWORD  [ebp+12]
	mov	DWORD  [ebp+8], eax
	mov	eax, DWORD  [ebp-8]
	mov	DWORD  [ebp+12], eax
.L3:
	cmp	DWORD  [ebp+12], 0
	jne	.L4
	mov	eax, DWORD  [ebp+8]
	leave
	ret
