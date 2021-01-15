%include "io.inc"
CEXTERN malloc

section .data
    a dd 0x0
        sum dq 0xFFFFFFFFFFFFFFFF
    space db ' '
    newline db 13
   
section .bss
;    a resb 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    mov ebp, esp
    sub esp, 16
    and esp, 0xfffffff0
    
    mov eax, 1
    dec eax
    xchg dword[eax], eax
    PRINT_HEX 4, eax
    
    
    mov esp, ebp
    xor eax, eax
    ret