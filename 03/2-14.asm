%include "io.inc"

section .bss
    n resd 1
    m resd 1
    sup resd 1
    k resd 1
    sum resd 1
    kn resd 1

section .text
global CMAIN
CMAIN:
    GET_UDEC 4, n
    GET_UDEC 4, k
.F:
    mov eax, dword[n]
    xor ecx, ecx
.L1:
    inc ecx
    shr eax, 1
    jnz .L1
    dec ecx
    mov dword[m], ecx
    cmp ecx, dword[k] ;������, ����� ����� ����� � k ������ >n
    jb .fin

    sub ecx, dword[k]
    mov dword[sup], ecx
    mov dword[sum], 1
    mov eax, dword[m]
    test eax, eax
    jz .fin   ; ������, ����� ����� ����� � k ������ >n
    cmp eax, dword[k]
    jz .fin  ; ������, ����� ������ k ����� �������� �� �����(k=m, sup = 0), sum=1
    
    mov eax, 1
    mov ecx, 1
    cmp ecx, dword[sup]
    je .aftL2
.L2:
    ;������� ����� ���������: for (int i = 1; i < sup; i++)
    mov ebx, dword[k]
    add ebx, ecx
    mul ebx
    xor edx, edx
    div ecx
    add dword[sum], eax
    inc ecx
    inc ebx
    cmp ebx, dword[m]
    jb .L2
.aftL2:    
    mov eax, 1
    mov ecx, dword[m]
.L3:
    shl eax, 1
    dec ecx
    jnz .L3
    sub dword[n], eax
    
    mov eax, dword[n]
    test eax, eax
    jz .fin ; n - ������� ������ >0
    mov ecx, dword[m]
    xor ebx, ebx
.L4:
    inc ebx    ;������� ����� ���������� ��������
    dec ecx    ;� ecx �������� ���������� ����� � �������� �����
    shr eax, 1
    jnz .L4
    dec ebx
    mov dword[m], ebx 
    sub dword[k], ecx
    mov ebx, dword[k]
    test ebx, ebx
    jnz .f
    jz .count0
.aftercount0:
    test ecx, ecx
    jnz .fin
    add dword[sum], 1
    jmp .fin
.f:
    mov ecx, dword[m]
    
    cmp ecx, dword[k] ;случай, когда любое число с k нулями >n
    jb .fin

    mov eax, dword[k]
    dec eax
    mov dword[kn], eax
    sub ecx, dword[kn]
    mov dword[sup], ecx
    add dword[sum], 1
    mov eax, dword[m]
    test eax, eax
    jz .fin   ; случай n=1 (m=0), тогда sum = 1
    cmp eax, dword[kn]
    jz .fin  ; случай, когда больше k нулей вставить не можем(k=m, sup = 0), sum=1
    
    mov eax, 1
    mov ecx, 1
    cmp ecx, dword[sup]
    je .aftl2
.l2:
                    ; считаем сумму сочетаний: for (int i = 1; i < sup; i++)
    mov ebx, dword[kn]
    add ebx, ecx
    mul ebx
    xor edx, edx
    div ecx
    add dword[sum], eax
    inc ecx
    inc ebx
    cmp ebx, dword[m]
    jb .l2
.aftl2:    
    mov eax, 1
    mov ecx, dword[m]
.l3:
    shl eax, 1
    dec ecx
    jnz .l3
    sub dword[n], eax
    
    mov eax, dword[n]
    mov ecx, dword[m]
    test eax, eax
    jz .iffin ; n - степень двойки >0
    xor ebx, ebx
.l4:
    inc ebx    ;считаем новое количество разрядов
    dec ecx    ;в ecx окажется количество нулей в исходном числе между старшими единицами
    shr eax, 1
    jnz .l4
    dec ebx
    mov dword[m], ebx 
    sub dword[k], ecx
    mov ebx, dword[k]
    test ebx, ebx
    jnz .f
    jz .count1
.aftercount1:
    test ecx, ecx
    jnz .fin
    add dword[sum], 1
    jmp .fin
    
.iffin:
    xor ebx, ebx
    xor ecx, ecx
    mov edx, 1
    mov eax, dword[k]
    cmp eax, 1
    cmovz ebx, edx
    mov eax, dword[m]
    cmp eax, 1
    cmovz ecx, edx
    and ebx, ecx
    add dword[sum], ebx
.fin:
    PRINT_UDEC 4, sum   
    jmp .E
.count0:
    mov eax, dword[n]
    xor ecx, ecx
.loop:
    mov ebx, eax
    and ebx, 1
    not ebx
    and ebx, 1
    add ecx, ebx
    shr eax, 1
    jnz .loop
    jmp .aftercount0
.count1:
    mov eax, dword[n]
    xor ecx, ecx
.loop1:
    mov ebx, eax
    and ebx, 1
    not ebx
    and ebx, 1
    add ecx, ebx
    shr eax, 1
    jnz .loop1
    jmp .aftercount1
.E:
    xor eax, eax
    ret
