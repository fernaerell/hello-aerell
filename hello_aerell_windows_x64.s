.section .rodata
    0: .ascii "Hello Aerell!\n"

.section .text
.globl _start

.extern GetStdHandle
.extern WriteConsoleA
.extern ExitProcess

_start:
    subq $40, %rsp

    movq $-11, %rcx
    call GetStdHandle

    movq %rax, %rcx
    leaq 0b(%rip), %rdx
    movq $14, %r8
    leaq 32(%rsp), %r9
    movq $0, 32(%rsp)
    call WriteConsoleA

    xorq %rcx, %rcx
    call ExitProcess
