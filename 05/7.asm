%include "io.inc"

CEXTERN strcmp
 

section .data
    counter db -1
    
    space db " "
    inputint db "%d",0
    inputstring db "%s",0
    output db "%d",10,0

section .bss
    strings resb 6024;12*502
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    push ebp
    mov ebp, esp
    sub esp, 16
    and esp, 0xfffffff0
    
    mov dword[esp], inputint
    mov dword[esp+4], counter
    call scanf
    mov esi, -1
    xchg esi, dword[counter]
    inc esi
.start:
    dec esi
    cmp esi, 0
    je .end

    inc dword[counter]
            
    mov dword[esp], inputstring
    mov edi, 12
    imul edi, dword[counter]
    add edi, strings
    mov dword[esp+4], edi
    call scanf
    
    mov ebx, -1
.checknext:
    inc ebx
    cmp ebx, dword[counter]
    je .start
    mov ecx, 12
    imul ecx, ebx
    add ecx, strings
    mov dword[esp], ecx
    call strcmp
    cmp eax, 0
    je .deccounter
    jne .checknext

.deccounter:
    dec dword[counter]
    jmp .start
    
.end:
    inc dword[counter]
    mov dword[esp], output
    mov ebx, dword[counter]
    mov dword[esp+4], ebx
    call printf
    
    mov esp, ebp
    pop ebp

    xor eax, eax
    ret