%include "io.inc"
 
section .data
    a dd 0x0
    b dd 0x0
    c dd 0x0
    v dd 0x0
    space db ' '
   
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    xor ebx, ebx
   
    GET_DEC 4, eax
    mov dword[a], eax
   
    GET_DEC 4, eax
    mov dword[b], eax
   
    GET_DEC 4, eax
    mov dword[c], eax
   
    GET_DEC 4, eax
    mov dword[v], eax
   
    mov eax, dword[a]
    mul dword[b]
    mov ebx, eax
    mov eax, edx
    mul dword[c]
    mov ecx, eax
    
    mov eax, ebx
    mul dword[c]
    add edx, ecx
    
    div dword[v]
 
    PRINT_DEC 4, eax
                                                                       
    xor eax, eax
    ret