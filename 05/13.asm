%include "io.inc"

CEXTERN scanf
CEXTERN fprintf
CEXTERN get_stdout
CEXTERN malloc
CEXTERN free


section .data
    N dd 0
    
    array dd 0
    stdout dd 0
    
    stack dd 0
    
    space db " "
    input db "%d",0
    output db "%d",10,0

section .bss
;    ints resb 4008;4*1002
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    push ebp
    mov ebp, esp
    
    sub esp, 32
    and esp, 0xfffffff0
    
    sub esp, 40
    mov dword[stack], esp
    add esp, 40
    
    call get_stdout
    mov dword[stdout], eax
    
    mov dword[esp], input
    mov dword[esp+4], N
    call scanf
    
    mov eax, dword[N]
    imul eax, 4
    
    mov dword[esp], eax
    call malloc
    mov dword[array], eax 
    
    mov ebx, dword[N]
    mov esi, dword[array]
.newelement:
    mov dword[esp], input
    mov dword[esp+4], esi
    call scanf
    
    add esi, 4
    dec ebx
    jnz .newelement

    mov eax, dword[array]
    mov dword[esp], eax
    mov eax, dword[N]
    mov dword[esp+4], eax
    mov dword[esp+8], fprintf
    mov dword[esp+12], 2
    mov eax, dword[stdout]
    mov dword[esp+16], eax
    mov dword[esp+20], output
    call apply
    
    mov esp, ebp
    pop ebp
    
    xor eax, eax
    ret
    
apply:
    push ebp
    mov ebp, esp
    mov dword[ebp-4], ebx
    
    mov eax, dword[ebp+20] ; ebp+4 +4*4 is n
    imul eax, 4
    add eax, 8
    sub esp, eax
    and esp, 0xfffffff0
    
    ;call fn for each iteration
    mov eax, dword[ebp+20]
    mov ecx, 0
    
.addnewparam:
    mov edx, dword[ebp+24+ecx]
    mov dword[esp+ecx], edx
    add ecx, 4
    dec eax
    jnz .addnewparam
    
    lea ebx, [esp+ecx]
    
    mov edi, dword[ebp+12]
    mov esi, 0
.addlastparam:
    lea edx, [4*esi]
    add edx, dword[ebp+8]
    mov edx, dword[edx]
    mov dword[ebx], edx
    call dword[ebp+16]
    
    inc esi
    dec edi
    jnz .addlastparam
        
    mov ebx, dword[ebp-4]
    mov esp, ebp
    pop ebp
    
    ret    
