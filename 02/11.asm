%include "io.inc"

section .data
    char dd 0x0
    num dd 0x0



    space db ' '
    newline db 13

section .bss
    una resb 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    GET_CHAR eax
    neg eax
    add eax, 'H'
    mov dword[char], eax
    
    GET_DEC 4, eax
    neg eax
    add eax, 8
    mov dword[num], eax

    mul dword[char]    
    mov ecx, 2
    div ecx
    PRINT_DEC 4, eax

    xor eax, eax
    ret