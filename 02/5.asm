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
   
    GET_UDEC 4, eax
    mov dword[a], eax
   
    GET_UDEC 4, eax
    mov dword[b], eax
   
    mov eax, dword[a]
    mov ecx, dword[b]
    ror eax, cl
 
    PRINT_UDEC 4, eax
                                                                       
    xor eax, eax
    ret