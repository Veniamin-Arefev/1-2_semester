%include "io.inc"

CEXTERN fopen
CEXTERN feof
CEXTERN fclose
CEXTERN qsort
CEXTERN fscanf
CEXTERN fprintf

section .rodata
    LC0 db "r", 0
    LC1 db "input.txt", 0
    LC2 db "%s", 0
    LC3 db "output.txt", 0
    LC4 db "w", 0
    ;func dd comp, 0
    
section .bss
    mas resd 1000
    temp resd 1
    save_esp resd 1
    
section .data
    N dd 0
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ebp, esp
    and esp, 0xfffffff0
    sub esp, 16
    mov dword[esp + 4], LC0
    mov dword[esp], LC1
    call fopen
    PRINT_DEC 4, eax
    NEWLINE
    mov dword[temp], eax;infile
    
    
.while:
    mov ebx, dword[temp]
    mov dword[esp], ebx
    call feof
    cmp eax, 0
    jne .while_end
    
    mov ebx, dword[temp]
    mov dword[esp], ebx
    mov dword[esp + 4], LC2
    mov eax, dword[N]
    mov ecx, 4
    mul ecx
    add eax, mas
    mov dword[esp + 8], eax
    call fscanf
    PRINT_DEC 4, eax
    NEWLINE
    inc dword[N]
    jmp .while
        
.while_end:
    mov ebx, dword[temp]
    mov dword[esp], ebx
    call fclose;считывание закончено
    mov esp, ebp
    xor eax, eax
    ret