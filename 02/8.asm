%include "io.inc"
 
section .data
    
    space db ' '
    newline db 13
   
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
   
    GET_HEX 4, eax
    GET_HEX 4, ebx
    GET_HEX 4, ecx
    
    and eax, ecx
    not ecx
    and ebx, ecx
    
    or eax, ebx

    PRINT_HEX 4, eax

    xor eax, eax
    ret