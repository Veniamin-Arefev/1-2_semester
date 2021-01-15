%include "io.inc"

section .data
    a dd 0,0,0,0
    b dd 0,0

    x dd 0
    y dd 0
    

    space db ' '
    newline db 13

section .bss
    una resb 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    GET_UDEC 4, eax
    mov dword[a], eax
    GET_UDEC 4, eax
    mov dword[a+4], eax
    GET_UDEC 4, eax
    mov dword[a+8], eax
    GET_UDEC 4, eax
    mov dword[a+12], eax
    GET_UDEC 4, eax
    mov dword[b], eax
    GET_UDEC 4, eax
    mov dword[b+4], eax    
;y calculation
    ;det A
    mov eax, dword[a]
    and eax, dword[a+12]    
    mov ebx, dword[a+4]
    and ebx, dword[a+8]    
    xor eax, ebx
    not eax
    
    mov ecx, dword[b]
    or ecx, dword[b+4]
    and ecx, eax
      
    mov eax, dword[b]
    and eax, dword[a+8]
    mov ebx, dword[b+4]
    and ebx, dword[a]
    xor eax, ebx
    
    or eax, ecx
    mov dword[y], eax

;x calculation
    mov eax, dword[a+4]
    and eax, dword[y]
    xor eax, dword[b]
    and eax, dword[a]
    
    mov ebx, dword[a+12]
    and ebx, dword[y]
    xor ebx, dword[b+4]
    and ebx, dword[a+8]
    
    or eax, ebx
    mov dword[x], eax
        
    PRINT_UDEC 4, [x]
    PRINT_CHAR space
    PRINT_UDEC 4, [y]    

    xor eax, eax
    ret