%include "io.inc"
 
section .data
    A dd 0x0
    B dd 0x0
    C dd 0x0
    a dd 0x0
    b dd 0x0
    c dd 0x0
    
    space db ' '
    newline db 13
   
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
   
    GET_UDEC 4, [A]
    GET_UDEC 4, [B]
    GET_UDEC 4, [C]
    GET_UDEC 4, [a]
    GET_UDEC 4, [b]
    GET_UDEC 4, [c]

    mov eax, dword[A]
    mov ebx, dword[b]
    add ebx, dword[c]
    imul ebx
    mov ecx, eax
    
    mov eax, dword[B]
    mov ebx, dword[a]
    add ebx, dword[c]
    imul ebx
    add ecx, eax

    mov eax, dword[C]
    mov ebx, dword[a]
    add ebx, dword[b]
    imul ebx
    add ecx, eax
   
    PRINT_DEC 4, ecx

    xor eax, eax
    ret