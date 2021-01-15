%include "io.inc"
 
section .data
    
    space db ' '
    newline db 13
   
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
   
    GET_UDEC 4, eax
    GET_UDEC 1, bl
    
    mov cl, 32
    sub cl, bl
    
    shl eax, cl
    shr eax, cl 

    PRINT_DEC 4, eax

    xor eax, eax
    ret