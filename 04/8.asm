%include "io.inc"

section .data
    N dd 0x0
    K dd 0x0
    answer dd 0x0
    last dd -1
    
    space db ' '
    newline db 13
   
section .bss
;    a resb 1
section .text
global CMAIN
CMAIN:
    ;write your code here
    GET_UDEC 4, [N]
    GET_UDEC 4, [K]
    
    mov eax, dword[N]
    add dword[answer], eax
.loop:    
    call getsum
    cmp eax, dword[last]
    je .end
    mov dword[last], eax
    jmp .loop

.end:    

    PRINT_UDEC 4, [answer]
    xor eax, eax
    ret
    
    
getsum:
    push ebp
    mov ebp, esp
    
    mov esi, 0
.again:
    xor edx, edx
    idiv dword[K]
    add esi, edx
    cmp eax, 0
    jne .again
    
    add dword[answer], esi
    mov eax, esi
    
    mov esp, ebp
    pop ebp
        
    ret
