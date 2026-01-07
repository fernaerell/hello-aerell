# Example to print "Hello Aerell!" in assembly windows x64 AT&T syntax.

# Read-only data section for constants
.section .rodata
    # Define the string label '0'. \n is a newline character.
    0: .ascii "Hello Aerell!\n"

# Code section
.section .text
.globl _start

# External Windows API functions (Win32/64)
.extern GetStdHandle
.extern WriteConsoleA
.extern ExitProcess

_start:
    # Shadow Space: Allocate 40 bytes on the stack
    # Required by Windows x64 calling convention before calling functions
    subq $40, %rsp

    # Get handle for Standard Output (STDOUT)
    # -11 is the constant for STD_OUTPUT_HANDLE
    movq $-11, %rcx
    call GetStdHandle

    # Prepare arguments for WriteConsoleA
    movq %rax, %rcx           # Argument 1: Handle returned from GetStdHandle (in %rax)
    leaq 0b(%rip), %rdx       # Argument 2: Pointer to our "Hello Aerell!" string
    movq $14, %r8             # Argument 3: Length of the string (14 characters)
    leaq 32(%rsp), %r9        # Argument 4: Pointer to memory to store number of chars written
    movq $0, 32(%rsp)         # Argument 5: Set lpReserved to NULL (passed via stack)
    call WriteConsoleA

    # Exit the program
    xorq %rcx, %rcx           # Set return code to 0 (Success)
    call ExitProcess
