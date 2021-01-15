%include "io.inc"

section .data
    K dd 0x0
    last1 dd 0x0
    last2 dd 0x0
    
    space db ' '
    newline db 13
   
section .bss
;    a resb 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_DEC 4, [K]
    GET_DEC 4, ecx
    GET_DEC 4, eax
    
    xor edx, edx
    mov esi, 2011
    idiv esi
    mov eax, edx
    mov dword[last1], eax
    mov dword[last2], eax
.loop1:
    cmp ecx, 0
    je .end
    
    call gridfunction
    xor edx, edx
    mov esi, 2011
    idiv esi
    mov eax, edx
    xchg dword[last1], edx
    xchg edx, dword[last2]
    mov dword[last1], eax

    dec ecx
    jmp .loop1

.end:
    PRINT_UDEC 4, eax
    xor eax, eax
    ret
    
gridfunction:
    push ebp
    mov ebp, esp
    
    push ebx
    push ecx
    push esi
    push edi
    
    mov ebx, eax    
    call countdigits
    mov eax, 1
.loopexp:
    imul eax, dword[K]
    dec ecx
    cmp ecx,0
    jne .loopexp
    imul eax, dword[last1]
    add eax, dword[last2]
    
    pop edi
    pop esi
    pop ecx
    pop ebx
    
    mov esp, ebp
    pop ebp
    ret

countdigits:
    push ebp
    mov ebp, esp
    
    push ebx
    push esi
    push edi
    
    mov ebx, 0
    mov eax, dword[last2]
.loopc:
    xor edx, edx
    idiv dword[K]
    inc ebx
    cmp eax, 0
    jne .loopc
    
    mov ecx, ebx
    
    pop edi
    pop esi
    pop ebx
        
    mov esp, ebp
    pop ebp
    ret
