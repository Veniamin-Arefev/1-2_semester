%include "io.inc"

section .data
    intt dd 0x0
    upnum dd 0x0
    downnum dd 0x1
    
    space db ' '
    newline db 13
   
section .bss
;    a resb 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_DEC 4, ebx
    
    
.loop1:
    
    call readonce
    call normalize
    
    sub ebx, 1
    jnz .loop1

    xor edx, edx
    mov eax, dword[intt]
    imul dword[downnum]
    add dword[upnum], eax
    PRINT_UDEC 4, [upnum]
    PRINT_CHAR space
    PRINT_UDEC 4, [downnum]
    xor eax, eax
    ret
    
normalize:
    push ebp
    mov ebp, esp
    
    push ebx
    push esi
    push edi
    
    mov ecx, 1
.loop2:
    inc ecx
    
.loop3:    

    cmp ecx, dword[downnum]
    jge .endnor
    
    mov eax, dword[upnum]
    xor edx, edx
    idiv ecx
    cmp edx, 0
    jne .loop2
    mov eax, dword[downnum]
    xor edx, edx
    idiv ecx
    cmp edx, 0
    jne .loop2

    mov eax, dword[upnum]
    xor edx, edx
    idiv ecx
    mov dword[upnum], eax

    mov eax, dword[downnum]
    xor edx, edx
    idiv ecx
    mov dword[downnum], eax
    jmp .loop3
            
.endnor:
    
    pop edi
    pop esi
    pop ebx
    
    mov esp, ebp
    pop ebp
    ret
        
readonce:
    push ebp
    mov ebp, esp
    
    push ebx
    push esi
    push edi
    
    GET_UDEC 4, esi
    GET_UDEC 4, edi
    
    xor edx, edx
    mov ebx, dword[upnum]
    imul ebx, edi;imul dword[upnum], edi
    mov dword[upnum], ebx
    imul esi, dword[downnum]
    add dword[upnum], esi
    mov ebx, dword[downnum]
    imul ebx, edi;imul dword[downnum], edi
    mov dword[downnum], ebx
    
    mov eax, dword[upnum]
    idiv dword[downnum]
    mov dword[upnum], edx
    add dword[intt], eax
        
    pop edi
    pop esi
    pop ebx
    
    mov esp, ebp
    pop ebp
    
    ret
