%include "io.inc"
 
section .data
    N dd 0x0
    K dd 0x0
    answer dd 0x0
    kol0 dd 0x0
    temp1 dd 0x0
    temp2 dd 0x0
   
    space db ' '
    newline db 13
 
     
section .bss
    C resd 1024;32*32
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_UDEC 4, [N] ;N
    GET_UDEC 4, [K] ;K
    
    
        mov ebx, 0
    
    mov dword[C], 1
.loopC:
    cmp ebx, 31
    je .endC
    inc ebx
    mov eax, -1
.innerloopC:    
    inc eax
    
    mov ecx, ebx ; index calculation
    sal ecx, 7;*32*4=2^5*2^2=2^7
    mov edx, eax
    imul edx, 4
    add ecx, edx
    add ecx, C
    
    cmp eax, 0
    jne .next2C
    mov dword[ecx], 1
    jmp .innerloopC
    
.next2C:    
    cmp eax, ebx
    jne .next1C
    mov dword[ecx], 1
    jmp .loopC
    
.next1C:    
    lea edx, [ecx-128] ;32*4 C from n-1 to k
    lea edi, [ecx-132] ;32*4+1*4 C from n-1 to k-1
    mov esi, dword[edx]
    add esi, dword[edi]
    mov dword[ecx], esi
    jmp .innerloopC
.endC:
    
    
    
    cmp dword[K], 0
    jne .checkKfor0
    inc dword[answer]
.checkKfor0:
    cmp dword[N], 1
    je .end
    
.checkfor1:
 
    mov ecx, 0 ;counter for first 1 in bin representation
    mov edi, dword[N]
    mov ebx, 0
    jmp .loop
 
.loop: ; just check our N
    shr edi, 1
    jz .l1z
    jnz .l1nz
.l1z:
    jmp .l1
.l1nz:    
    inc ecx
    jc .loop
    inc ebx
    jmp .loop
.l1:    
    cmp ebx, dword[K];check N for K zero in bin
    jne .l2
    inc dword[answer]
.l2: ;lets check all smaller ones
    mov ebx, ecx ; backup for ecx
    cmp ecx, 0
    je .loopwithlesser ;check with current size of the number
    mov eax, 1
    shl eax, cl
    
.moveright1:
    dec ecx
    shr eax, 1
    cmp eax, 0
    je .loopwithlesser
    mov esi, eax
    and esi, dword[N]
    cmp esi, 0
    je .eq0
    ; there is 1
    mov dword[temp1], eax
    mov dword[temp2], ecx
    
    ; C from ecx to k-kol1-1 calculation
    
    mov edi, dword[K] ; our K
    dec edi
    sub edi, dword[kol0]
    
    cmp edi, 0
    jl .moveright1

    cmp ecx, edi
    jl .moveright1

    mov edx, ecx ; index calculation
    sal edx, 7;*32*4=2^5*2^2=2^7
    mov esi, edi
    imul esi, 4
    add edx, esi
    add edx, C
    
    mov edx, dword[edx]

    add dword[answer], edx
    jmp .moveright1
    
.eq0:
    inc dword[kol0]
    jmp .moveright1

    
.loopwithlesser: ;lets check all smaller ones
    dec ebx ; c from n(ebx) to K
    mov ecx, ebx
    jz .endwithlesser
    cmp ecx, dword[K] 
    jl .loopwithlesser

    mov edx, ebx ; index calculation
    sal edx, 7;*32*4=2^5*2^2=2^7
    mov esi, dword[K]
    imul esi, 4
    add edx, esi
    add edx, C
    
    mov edx, dword[edx]    

    add dword[answer], edx
    jmp .loopwithlesser    
    
.endwithlesser:
  
.end:    
    PRINT_DEC 4, [answer]
    xor eax, eax
    ret