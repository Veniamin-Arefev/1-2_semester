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
    call read
    
    xor eax, eax
    ret
    
    
read:
    push ebp
    mov ebp, esp
    

    GET_DEC 4, eax
    push eax
    cmp eax, 0
    je .stop
    call read
    pop eax
    PRINT_DEC 4, eax
    PRINT_CHAR space
.stop:
    
    mov esp, ebp
    pop ebp
        
    ret
