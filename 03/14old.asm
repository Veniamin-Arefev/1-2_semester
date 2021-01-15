%include "io.inc"

section .data
    K dd 0x0
    
    space db ' '
    newline db 13
   
section .bss
;    a resb 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_UDEC 4, eax ;N
    GET_UDEC 4, ebx ;K
    mov dword[K], ebx
    mov edx, 0 ;iterator
    mov esi, 0 ;answer

.loopmain:    
    inc edx
    cmp eax, edx
    jl .end
    mov edi, edx
    mov ebx, 0
    jmp .loop

.loop:
    shr edi, 1
    jz .l1
    jc .loop
    inc ebx
    jmp .loop
.l1:    
   
    cmp ebx, dword[K]
    jne .l2
    inc esi
.l2:
    jmp .loopmain
    
.end:    
    PRINT_DEC 4, esi
    xor eax, eax
    ret