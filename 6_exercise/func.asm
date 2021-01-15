extern sqrt
extern exp

section .data
    f1const dq 3.0
    f2const dq 0.5
    f1divconst dq 6.0
   
section .bss
    temp resq 1
section .text
global f1
f1:
    push ebp
    mov ebp, esp
    sub esp, 32
    and esp, 0xFFFFFFF0
    fld qword[f1const] ;3.0
    fld qword[ebp+8]
    fld1
    fsubp ; x - 1
    fst qword[temp]
    fld qword[temp]
    fmulp ; (x - 1)^2
    fld1
    faddp ; (x - 1)^2 + 1
    fdivp
    mov esp, ebp
    pop ebp
    ret


global f2
f2:
    push ebp
    mov ebp, esp
    sub esp, 32
    and esp, 0xFFFFFFF0
    fld qword[ebp+8]
    fld qword[f2const] ; 0.5
    faddp ; x + 0.5
    fstp qword[esp]
    call sqrt
    mov esp, ebp
    pop ebp
    ret


global f3
f3:
    push ebp
    mov ebp, esp
    sub esp, 32
    and esp, 0xFFFFFFF0
    fldz
    fld qword[ebp+8]
    fsubp ;0 - x
    fstp qword[esp]
    call exp
    mov esp, ebp
    pop ebp
    ret


global f1div
f1div:
    push ebp
    mov ebp, esp
    sub esp, 32
    and esp, 0xFFFFFFF0
    fld qword[f1divconst] ;6.0
    fld1
    fld qword[ebp+8]
    fsubp ; 1 - x
    fmulp ; 6.0(1 - x)

    fld qword[ebp+8]
    fld1
    fsubp ; x - 1
    fst qword[temp]
    fld qword[temp]
    fmulp ; (x - 1)^2
    fld1
    faddp ; (x - 1)^2 + 1
    fst qword[temp]
    fld qword[temp]
    fmulp ; ((x - 1)^2 + 1)^2
    
    fdivp
    
    mov esp, ebp
    pop ebp
    ret


global f2div
f2div:
    push ebp
    mov ebp, esp
    sub esp, 32
    and esp, 0xFFFFFFF0
    fld qword[ebp+8]
    fld qword[f2const] ; 0.5
    faddp ; x + 0.5
    fstp qword[esp]
    call sqrt
    fstp qword[temp]
    fld1 ;1
    fld qword[temp] ; sqrt(x + 0.5)
    fld1
    fld1
    faddp ;2
    fmulp ; 2*sqrt(x + 0.5)
    fdivp ; 1 / 2*sqrt(x + 0.5)
    mov esp, ebp
    pop ebp
    ret


global f3div
f3div:
    push ebp
    mov ebp, esp
    sub esp, 32
    and esp, 0xFFFFFFF0
    fldz
    fld qword[ebp+8]
    fsubp ;0 - x
    fstp qword[esp]
    call exp
    fstp qword[temp] ; e ^(- x)
    fldz ;0
    fld qword[temp] ; e ^(- x)
    fsubp ;0 -  e ^(- x)
    mov esp, ebp
    pop ebp
    ret
