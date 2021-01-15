%include "io.inc"

section .data
    cha dd 0,0
    num dd 0,0


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
    mov dword[cha], eax
    GET_CHAR eax
    mov dword[num], eax

    GET_CHAR eax
    GET_CHAR eax
    mov dword[cha+4], eax
    GET_CHAR eax
    mov dword[num+4], eax    

    mov eax, dword[cha]
    sub eax, dword[cha+4]
    mov ecx, eax
    sar ecx, 31
    xor eax, ecx
    sub eax, ecx
    mov ebx, eax

    mov eax, dword[num]
    sub eax, dword[num+4]
    mov ecx, eax
    sar ecx, 31
    xor eax, ecx
    sub eax, ecx
    
    add eax, ebx
    PRINT_DEC 4, eax

    xor eax, eax
    ret