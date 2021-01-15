%include "io.inc"

CEXTERN scanf
CEXTERN printf
CEXTERN malloc
CEXTERN free


section .data
    N dd 0
    
    intt dd 0
    
    tempsize dd 0
    tempsum dq 0
    tempref dd 0
    
    size dd 0    
    sum dd 0x00000000, 0x80000000
    ref dd 0
    
    space db " "
    newline db 10,0
    input db "%d",0
    output db "%d ",0

section .bss
;    ints resb 4008;4*1002
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    push ebp
    mov ebp, esp
    
    sub esp, 16
    and esp, 0xfffffff0
    
    mov dword[esp], 16 ; just need it
    call malloc
    mov dword[ref], eax 
    
    mov dword[esp], input
    mov dword[esp+4], N
    call scanf

.newmatrix:
    mov dword[esp], input
    mov dword[esp+4], tempsize
    call scanf
    
    mov eax, dword[tempsize]
    imul eax, eax
    imul eax, 4
    mov dword[esp], eax
    call malloc
    
    mov dword[tempref], eax
    
    mov edi, 0;first index
    mov esi, 0;second index
.newlement:
    mov eax, dword[tempsize]
    imul eax, esi
    add eax, edi
    imul eax, 4
    add eax, dword[tempref]
    mov dword[esp], input
    mov dword[esp+4], eax
    call scanf
    
    inc edi
    cmp edi, dword[tempsize]
    jl .newlement
    xor edi, edi
    inc esi
    cmp esi, dword[tempsize]
    jl .newlement
    
    ;work with trace
    mov eax, dword[tempref]
    mov dword[esp], eax
    mov eax, dword[tempsize]
    mov dword[esp+4], eax
    call filltemptrace
    
    mov eax, dword[sum+4]
    cmp eax, dword[tempsum+4]
    jg .next
    jl .aftercomp
    mov eax, dword[sum]
    cmp eax, dword[tempsum]
    ja .next
    je .next
    ;jge .next

.aftercomp:    
    ;swap
    mov eax, dword[tempsize]
    mov dword[size], eax
    mov eax, dword[tempsum]
    mov dword[sum], eax
    mov eax, dword[tempsum+4]
    mov dword[sum+4], eax    
    mov eax, dword[ref]
    xchg eax, dword[tempref]
    mov dword[ref], eax
.next:
    mov eax, dword[tempref]
    mov dword[esp], eax
    call free
    
    dec dword[N]
    jnz .newmatrix
    
    ;now lets print our matrix

    mov edi, 0;first index
    mov esi, 0;second index
.newlementprint:
    mov eax, dword[size]
    imul eax, esi
    add eax, edi
    imul eax, 4
    add eax, dword[ref]
    mov dword[esp], output
    mov eax, dword[eax]
    mov dword[esp+4], eax
    call printf
    
    inc edi
    cmp edi, dword[size]
    jl .newlementprint
    mov dword[esp], newline
    call printf   
    xor edi, edi
    inc esi
    cmp esi, dword[size]
    jl .newlementprint
    
    mov esp, ebp
    pop ebp
    
    xor eax, eax
    ret
    
filltemptrace: ;(ref, count)
    push ebx; now esp is esp+4
    mov ebx, dword[esp+12] ; esp+8
    mov ecx, dword[esp+8] ;esp+4
    mov dword[tempsum], 0
    mov dword[tempsum+4], 0
.againtrace:
    mov eax, dword[ecx]
    cdq
    
    add dword[tempsum], eax
    adc dword[tempsum+4], edx
    
    add ecx, dword[esp+12]
    add ecx, dword[esp+12]
    add ecx, dword[esp+12]
    add ecx, dword[esp+12]    
    add ecx, 4
    
    dec ebx
    jnz .againtrace
    
    pop ebx
    ret
    