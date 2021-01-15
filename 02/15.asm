%include "io.inc"
 
section .data
    x dd 0, 0, 0
    y dd 0, 0, 0
        
    space db ' '
    newline db 13
   
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
   
    GET_DEC 4, [x]
    GET_DEC 4, [y]
    GET_DEC 4, [x+4]
    GET_DEC 4, [y+4]
    GET_DEC 4, [x+8]
    GET_DEC 4, [y+8]
                
    mov eax, [x+4]
    sub eax, [x]
    mov ebx, [y+8]
    sub ebx, [y]
    mul ebx
    mov ecx, eax
    
    mov eax, [x+8]
    sub eax, [x]
    mov ebx, [y+4]
    sub ebx, [y]
    mul ebx
    
    sub ecx, eax
        
    mov eax, ecx
    sar ecx, 31
    xor eax, ecx
    sub eax, ecx
    
    xor edx, edx
    mov ebx, 2
    div ebx
    
    and edx, 1
    mov ecx, eax
    mov eax, edx
    mov ebx, 5
    mul ebx
    
    PRINT_DEC 4, ecx
    PRINT_CHAR '.'
    PRINT_DEC 4, eax

    xor eax, eax
    ret