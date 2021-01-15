%include "io.inc"
 
section .data
    
    space db ' '
    newline db 13
   
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    xor ebx, ebx
   
    GET_UDEC 1, al
    GET_UDEC 1, ah
    GET_UDEC 1, bl
    GET_UDEC 1, bh
    
    shl ebx, 16
    
    or eax, ebx

    PRINT_UDEC 4, eax

    xor eax, eax
    ret