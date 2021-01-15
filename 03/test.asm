%include "io.inc"

section .data
    strin db "a0b0c0d0"
    
    space db ' '
    newline db 13

section .bss
    una resb 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    mov eax, dword[strin]
    
    mov eax, 7
    mov ebx, 5
    
    PRINT_DEC 4,eax
    PRINT_CHAR space
    PRINT_DEC 4,ebx
    
    PRINT_CHAR newline

    xchg ebx, eax

    PRINT_DEC 4,eax
    PRINT_CHAR space
    PRINT_DEC 4,ebx

    xor eax, eax
    ret