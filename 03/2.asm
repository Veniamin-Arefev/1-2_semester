%include "io.inc"

section .data
    N dd 0x0
    
    space db ' '
    newline db 13
   
section .bss
;    a resb 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_UDEC 4, eax
    mov ebx, 0
    mov ecx, 32

.loop:
    shr eax, 1
    jnc .l1
    inc ebx
.l1:    
    loop .loop
    PRINT_DEC 4, ebx
    xor eax, eax
    ret