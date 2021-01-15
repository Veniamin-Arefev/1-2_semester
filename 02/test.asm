%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_CHAR esi
    GET_DEC 4, edi
    
    sub esi, 'H'
    neg esi
    mov ebx, esi
    PRINT_DEC 1, ebx
    sub edi, 8
    neg edi
    mov ecx, edi
    ;PRINT_DEC 4, ecx
    
    mov eax, ebx
    mov esi, 2
    div esi
    mul ecx
    mov edi, eax
    
    xor eax, eax
    ret