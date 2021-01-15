%include "io.inc"

section .data
    a dd 0x0
    
    space db ' '
    newline db 13
   
section .bss
;    a resb 1
section .text
global CMAIN
CMAIN:
    ;write your code here
    xor eax, eax
    ret