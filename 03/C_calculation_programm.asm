%include "io.inc"

section .data
    a dd 0x0
    
    space db ' '
    newline db 13
   
section .bss
    C resd 1024;32*32
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    mov ebx, 0
    
    mov dword[C], 1
.loop:
    cmp ebx, 31
    je .end
    inc ebx
    mov eax, -1
.innerloop:    
    inc eax
    
    mov ecx, ebx ; index calculation
    sal ecx, 7;*32*4=2^5*2^2=2^7
    mov edx, eax
    imul edx, 4
    add ecx, edx
    add ecx, C
    
    cmp eax, 0
    jne .next2
    mov dword[ecx], 1
    jmp .innerloop
    
.next2:    
    cmp eax, ebx
    jne .next1
    mov dword[ecx], 1
    jmp .loop
    
.next1:    
    lea edx, [ecx-128] ;32*4 C from n-1 to k
    lea edi, [ecx-132] ;32*4+1*4 C from n-1 to k-1
    mov esi, dword[edx]
    add esi, dword[edi]
    mov dword[ecx], esi
    jmp .innerloop
.end:
    PRINT_DEC 4, [C]
    PRINT_DEC 4, [C+4]   
    xor eax, eax
    ret