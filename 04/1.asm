%include "io.inc"

section .data
    a dd 0x0
    
    space db ' '
    newline db 13
   
section .bss
;    a resb 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_UDEC 4, eax
    
    GET_UDEC 4, ebx
    push ebx
    call nod
    add esp, 4

    GET_UDEC 4, ebx
    push ebx
    call nod
    add esp, 4

    GET_UDEC 4, ebx
    push ebx
    call nod
    add esp, 4

    PRINT_UDEC 4, eax

    xor eax, eax
    ret
    
nod:
    push ebp
    mov ebp, esp
    
    push ecx
    push edx

    cmp eax, ebx
    jg .noswap 
    xchg eax, ebx
.noswap:
    mov ecx, 0; eax - a ebx - b ecx - c
    
.loop:
    cmp ebx, 0
    je .return
    xor edx, edx
    idiv ebx
    mov ecx, edx
    mov eax, ebx
    mov ebx, ecx
    jmp .loop
.return:    

    pop edx
    pop ecx
    
    mov esp, ebp
    pop ebp
    ret
    
    