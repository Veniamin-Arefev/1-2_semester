%include "io.inc"

section .data
    x dd 0,0
    y dd 0,0
    px dd 0
    py dd 0
    
    space db ' '
    newline db 13
   
section .bss
;    a resb 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_DEC 4, [x]
    GET_DEC 4, [y]
    GET_DEC 4, eax
    cmp dword[x], eax
    je .l1
    mov dword[x+4], eax
.l1:
    GET_DEC 4, ebx
    cmp dword[y], ebx
    je .l2
    mov dword[y+4], ebx
.l2:
    GET_DEC 4, eax
    cmp dword[x], eax
    je .l3
    mov dword[x+4], eax
.l3:
    GET_DEC 4, ebx
    cmp dword[y], ebx
    je .l4
    mov dword[y+4], ebx
.l4:
    GET_DEC 4, eax
    cmp dword[x], eax
    je .l5
    mov dword[x+4], eax
.l5:
    GET_DEC 4, ebx
    cmp dword[y], ebx
    je .l6
    mov dword[y+4], ebx
.l6:
    mov eax, dword[x]
    cmp eax, dword[x+4]
    jg .l7
    xchg eax, dword[x+4]
.l7:
    mov ebx, dword[y]
    cmp ebx, dword[y+4]
    jg .l8
    xchg ebx, dword[y+4]
.l8:
    GET_DEC 4, edx;px
    GET_DEC 4, ecx;py
    
    cmp eax, edx ;<
    jle .lost
    cmp dword[x+4], edx;>
    jge .lost
    cmp ebx, ecx;>
    jle .lost
    cmp dword[y+4], ecx;<
    jge .lost    
    
    
    PRINT_STRING 'YES'
    xor eax, eax
    ret
.lost:
    PRINT_STRING 'NO'
    xor eax, eax
    ret
