%include "io.inc"

CEXTERN fopen
CEXTERN fclose
CEXTERN fscanf
CEXTERN fprintf
 

section .data
    intt dd 0x0
    counter dd -1
    
    filein dd 0x0
    
    space db " "
    filename db "data.in", 0
    filemode db "a+",0
    input db "%d",0
    output db "%d",10,0

section .bss
;    a resb 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    push ebp
    mov ebp, esp
    sub esp, 16
    and esp, 0xfffffff0
    
    mov dword[esp], filename
    mov dword[esp+4], filemode
    call fopen
    mov dword[filein], eax
    
    mov dword[esp], eax
    mov dword[esp+4], input
    mov dword[esp+8], intt
    
.start:
    inc dword[counter]
    call fscanf

    
    cmp eax, 1
    jne .end
    jmp .start
    
.end:    
    mov ebx, dword[filein]
    mov dword[esp], ebx
    call fclose
    
    mov dword[esp], output
    mov ebx, dword[counter]
    mov dword[esp+4], ebx
    call printf
    
    mov esp, ebp
    pop ebp

    xor eax, eax
    ret