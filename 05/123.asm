%include "io.inc"

section .bss
    temp resd 1
section .data
    float_two dd 11.2
    output_format db "%h", 10, 0
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp
    and esp, 0xfffffff0
    sub esp, 16
    mov eax, dword[float_two]
    mov dword[esp + 4], eax
    mov dword[esp], output_format
    call printf
    mov esp, ebp
    xor eax, eax
    ret