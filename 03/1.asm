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
    GET_DEC 4, ecx
    sub ecx, 2
    GET_DEC 4, eax ; eax>=ebx=>esi
    GET_DEC 4, ebx
    GET_DEC 4, esi
    
    cmp eax, ebx
    jg .l1
    xchg eax, ebx
.l1:
    cmp eax, esi
    jg .l2
    xchg eax, esi
.l2:
    cmp ebx, esi
    jg .l3
    xchg ebx, esi
.l3:
    loop .loop
    jmp .end

.loop:
    GET_DEC 4, edx
    cmp eax, edx
    jl .l4
    cmp ebx, edx
    jl .l5
    cmp esi, edx
    jl .l6
    jmp .bottomloop
.l4:
    mov esi, ebx
    mov ebx, eax
    mov eax, edx
    jmp .bottomloop    
.l5:
    mov esi, ebx
    mov ebx, edx
    jmp .bottomloop    
.l6:
    mov esi, ebx

.bottomloop:
    loop .loop
    
.end:    
    PRINT_DEC 4, eax
    PRINT_CHAR space
    PRINT_DEC 4, ebx
    PRINT_CHAR space
    PRINT_DEC 4, esi
    xor eax, eax
    ret
