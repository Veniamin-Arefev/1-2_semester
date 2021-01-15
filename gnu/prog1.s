	.intel_syntax noprefix
	.text
	.globl	exchange
	.type	exchange, @function
exchange:
	endbr32
	push	ebp
	mov	ebp, esp
	sub	esp, 32
	mov	DWORD PTR [ebp-4], 0 # swap count
	mov	DWORD PTR [ebp-8], 0 # iterator
    mov	DWORD PTR [ebp-12], eax # mas start
    mov	DWORD PTR [ebp-16], edx # count of ints
    mov	DWORD PTR [ebp-20], ebx # save
    mov	DWORD PTR [ebp-24], esi # save
    mov	DWORD PTR [ebp-28], edi # save
	jmp	.L2
.L3:
    mov eax, DWORD PTR [ebp-8]
    imul eax, 4 # normalize
    add eax, DWORD PTR [ebp-12] # mas+i
    mov ebx, eax # backup mas+i
    mov esi, DWORD PTR [eax] # mas[i]
    
    mov eax, DWORD PTR [ebp-16] # count
    dec eax # count-1
    xor edx, edx
    sub eax, DWORD PTR [ebp-8] # count-i-1
    imul eax, 4 # normalize
    add eax, DWORD PTR [ebp-12] # mas+count-i-1
    mov edx, eax # backup mas+count-i-1
    mov edi, DWORD PTR [eax] # mas[count-i-1]
    
	cmp	esi, edi
	ja	.L5
    jmp .L4
    
.L5: # swap
    mov DWORD PTR [ebx], edi # mas[i] = mas[count-i-1]
    mov DWORD PTR [edx], esi # mas[count-i-1] = mas[i]
    add	DWORD PTR [ebp-4], 1 # increment
    
.L4:
    
	add	DWORD PTR [ebp-8], 1 # increment
.L2:
	mov	eax, DWORD PTR [ebp-16]
	shr	eax, 1
	cmp	DWORD PTR [ebp-8], eax
	jl	.L3
	mov	eax, DWORD PTR [ebp-4]
    mov	ebx, DWORD PTR [ebp-20] # load
    mov	esi, DWORD PTR [ebp-24] # load
    mov	edi, DWORD PTR [ebp-28] # load
	leave
	ret
    
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
	mov	DWORD PTR [eax], 4294967295
	mov	eax, DWORD PTR [ebp-12]
	add	eax, 4
	mov	DWORD PTR [eax], 2
	mov	eax, DWORD PTR [ebp-12]
	add	eax, 8
	mov	DWORD PTR [eax], 4
	mov	eax, DWORD PTR [ebp-12]
	add	eax, 12
	mov	DWORD PTR [eax], 6
	mov	eax, DWORD PTR [ebp-12]
	add	eax, 16
	mov	DWORD PTR [eax], 7
	mov	eax, DWORD PTR [ebp-12]
	add	eax, 20
	mov	DWORD PTR [eax], 6
	mov	eax, DWORD PTR [ebp-12]
	add	eax, 24
	mov	DWORD PTR [eax], 3
	mov	eax, DWORD PTR [ebp-12]
	add	eax, 28
	mov	DWORD PTR [eax], 4294967294
	sub	esp, 8
    push 1
    push 1
	mov edx, 8
	mov eax, DWORD PTR [ebp-12]
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

