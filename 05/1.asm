%include "io.inc"

section .data
    intt dd 0x0
    
    space db ' '
    newline db 13
    
    input db "%u",0
    output db "0x%08X",10,0
   
section .bss
;    a resb 1
section .text
global CMAIN
CMAIN:
    ;write your code here
    push ebp
    
    mov ebp, esp
    
    sub esp, 16
    and esp, 0xfffffff0
    
.start:
    
    mov dword[esp], input
    mov dword[esp+4], intt
    call scanf
    
    cmp eax, 1
    jne .end

    mov dword[esp], output
    mov ebx, dword[intt]
    mov dword[esp+4], ebx
    call printf
    jmp .start
    
    
.end:    
    mov esp, ebp
    pop ebp

    xor eax, eax
    ret