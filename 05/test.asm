%include "io.inc"

CEXTERN qsort

section .data
    ints dd  2147483647, -2147483646
    
    space db ' '
    newline db 13

section .bss
    una resb 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    push ebp
    mov ebp, esp
    sub esp, 16
    and esp, 0xfffffff0
    
    mov dword[esp], ints
    mov dword[esp+4], 2
    mov dword[esp+8], 4
    mov dword[esp+12], comp
    call qsort
    
    PRINT_DEC 4, [ints]
    PRINT_CHAR space
    PRINT_DEC 4, [ints+4]
    PRINT_CHAR space
;    PRINT_DEC 4, [ints+8]

    mov esp, ebp
    pop ebp
    
    xor eax, eax
    ret
global comp
comp:
    mov eax, dword[esp+4]
    mov eax, dword[eax]
    mov ecx, dword[esp+8]
    mov ecx, dword[ecx]
    cmp eax, 0
    jl .firstneg
    jg .firstpos
    mov eax, ecx
    ret
.firstneg:
    cmp ecx, 0
    jg .secondpos1
    sub eax, ecx
    ret
.firstpos:
    cmp ecx, 0
    jl .secondneg1
    sub eax, ecx
    ret    
.secondpos1:
    mov eax, -1
    ret
.secondneg1:    
    mov eax, 1
    ret    
