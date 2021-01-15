%include "io.inc"

CEXTERN fopen
CEXTERN fclose
CEXTERN fscanf
CEXTERN fprintf
CEXTERN qsort
 

section .data
    counter dd -1
    
    fileref dd 0x0
    
    space db " "
    filenamein db "input.txt", 0
    filenameout db "output.txt", 0
    filemode db "a+",0
    filemode2 db "w+",0
    input db "%d",0
    output db "%d ",0

section .bss
    ints resb 4008;4*1002
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    push ebp
    mov ebp, esp
    sub esp, 16
    and esp, 0xfffffff0
    
    mov dword[esp], filenamein
    mov dword[esp+4], filemode
    call fopen
    mov dword[fileref], eax
    
    mov dword[esp], eax
    mov dword[esp+4], input
    
.startin:
    inc dword[counter]
    mov ecx, dword[counter]
    imul ecx, 4
    add ecx, ints
    mov dword[esp+8], ecx
    call fscanf
    
    cmp eax, 1
    jne .endin
    jmp .startin
    
.endin:    
    mov ebx, dword[fileref]
    mov dword[esp], ebx
    call fclose
    
    mov dword[esp], ints
    mov eax, dword[counter]
    mov dword[esp+4], eax
    mov dword[esp+8], 4
    mov dword[esp+12], comp
    call qsort
    
    mov dword[esp], filenameout
    mov dword[esp+4], filemode2
    call fopen

    mov dword[fileref], eax
    mov ebx, 0
    mov dword[esp], eax
    mov dword[esp+4], output
.startout:
    cmp dword[counter], 0
    jne .cont
    mov esp, ebp
    pop ebp

    xor eax, eax
    ret    
    
.cont:    
    lea ecx, [4*ebx + ints]
    mov ecx, dword[ecx]
;    mov dword[esp], output
;    mov dword[esp+4], ecx
    mov dword[esp+8], ecx
    call fprintf
    
    inc ebx
    cmp ebx, dword[counter]
    jl .startout
    
    mov ebx, dword[fileref]
    mov dword[esp], ebx
    call fclose
    
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
    sub eax, ecx
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