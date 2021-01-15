%include "io.inc"
 
section .data
    D dd 0
    X dd 0
    Y dd 0
        
    space db ' '
    newline db 13
   
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
   
    GET_DEC 4, eax
    GET_DEC 4, ebx
    GET_DEC 4, ecx
    GET_DEC 4, [D]
    GET_DEC 4, [X]
    GET_DEC 4, [Y]

    mul ebx
    mul ecx
    sub eax, 1
    xor edx, edx
    div dword[D]
    add eax, 1

    mov dword[D], eax
    
    mov eax, [X]
    mov ebx, 60
    mul ebx
    add eax, [Y]
    
    neg eax
    
    mov ebx, 359
    add eax, ebx
    
    and eax, 0x80000000
    shr eax, 31

    mov dword[X], eax
    mov eax, dword[D]
    sub eax, 1
    
    xor edx, edx
    mov ebx, 3
    div ebx
    
    add eax, 1
    
    mul dword[X]
    mov ebx, dword[D]
    sub ebx, eax
    
    PRINT_DEC 4, ebx

    xor eax, eax
    ret