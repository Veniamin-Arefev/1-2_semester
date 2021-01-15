%include "io.inc"

section .data
    n dd 0x0
    k dd 0x0
    sum dd 0x0
    
    two dd 2
    firstm dd 41
    secondm dd 42
        
    space db ' '
    newline db 13

section .bss
    una resb 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    GET_DEC 4, eax
    mov dword[n], eax
    
    GET_DEC 4, eax
    mov dword[k], eax

    mov eax, dword[n]
    xor edx, edx
    div dword[two]
    mul dword[firstm]
    mov dword[sum], eax
    
    mov eax, dword[n]
    xor edx, edx
    dec eax
    div dword[two]
    mul dword[secondm]
    add eax, dword[sum]

    add eax, dword[k]

    PRINT_DEC 4, eax

    xor eax, eax
    ret