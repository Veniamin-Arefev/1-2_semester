%include "io.inc"
 
section .data
    a db 0
    
    space db ' '
    newline db 13
   
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
   
    GET_DEC 4, eax
    
    mov ecx, eax
    sar ecx, 31
    xor eax, ecx
    sub eax, ecx    

    PRINT_DEC 4, eax

    xor eax, eax
    ret