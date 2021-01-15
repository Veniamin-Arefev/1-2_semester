 %include "io.inc"

SECTION .data
a dd 0x0
b dd 0x0, 0x0, F

SECTION .text
GLOBAL CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    SUB     ESP, 4
    GET_UDEC    4, [ESP]
    mov dword[a], esp
    sub dword[a], 96
    mov dword[b], F.L
    mov dword[b+4], F.R    
    mov esi, 32
    CALL    F
    ADD     ESP, 4
    
    PRINT_DEC   4, EAX

    XOR     EAX, EAX
    RET

F:
    CMP     DWORD [ESP], .R
    CMOVNZ  ECX, esi
    CMOVZ   ECX, DWORD [ESP + 8]
    MOV     EAX, DWORD [ESP + 4]
    AND     ECX, ECX
    JNZ     .L
    XOR     EAX, EAX
    RET
.L:
    PUSH    EBX
    MOV     EBX, EAX
    AND     EBX, 1
    SHR     EAX, 1
    DEC     ECX
    PUSH    ECX
    PUSH    EAX
    
    CALL    F
.R:
    ADD     ESP, 8
    INC     EAX
    SUB     EAX, EBX
    POP     EBX
    RET