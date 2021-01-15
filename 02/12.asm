%include "io.inc"

section .data
    mast dd 'S','C','D','H',0
    dost dd '2','3','4','5','6','7','8','9','T','J','Q','K','A',0


    space db ' '
    newline db 13

section .bss
    una resb 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    GET_DEC 4, eax
    dec eax

    mov ecx, 13
    xor edx, edx
    div ecx
    
    PRINT_CHAR [dost+edx*4]
    PRINT_CHAR [mast+eax*4]

    xor eax, eax
    ret