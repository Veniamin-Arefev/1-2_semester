%include "io.inc"
 
section .data
    vx dd 0x0
    vy dd 0x0
    ax1 dd 0x0
    ay1 dd 0x0
    t dd 0x0
    t2 dd 0x0
    space db ' '
   
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
   
    GET_DEC 4, eax
    mov dword[vx], eax
   
    GET_DEC 4, eax
    mov dword[vy], eax
   
    GET_DEC 4, eax
    mov dword[ax1], eax
   
    GET_DEC 4, eax
    mov dword[ay1], eax
 
    GET_DEC 4, eax
    mov dword[t], eax    
    
    imul dword[t]    
    mov dword[t2], eax    
       
    mov eax, dword[ax1]
    imul dword[t2]

    mov ebx, eax
 
    mov eax, dword[vx]
    imul dword[t]
 
    add eax, ebx
   
    PRINT_DEC 4, eax
    PRINT_CHAR space
 
    mov eax, dword[ay1]
    imul dword[t2]
 
    mov ebx, eax
 
    mov eax, dword[vy]
    imul dword[t]
 
    add eax, ebx
   
    PRINT_DEC 4, eax
                                                                       
    xor eax, eax
    ret