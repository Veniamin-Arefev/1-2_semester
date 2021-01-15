%include "io.inc"
 
section .data
    X dd 0x0
    N dd 0x0
    M dd 0x0
    Y dd 0x0
    
    space db ' '
    newline db 13
   
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
   
    GET_UDEC 4, [X]
    GET_UDEC 4, [N]
    GET_UDEC 4, [M]
    GET_UDEC 4, [Y]

    mov eax, dword[Y]
    sub eax, 2011d
    mov dword[Y], eax
    
    imul dword[N]
    add eax, dword[X]
    mov ecx, eax
    
    mov eax, dword[Y]
    imul dword[M]
    sub ecx, eax

    PRINT_DEC 4, ecx

    xor eax, eax
    ret