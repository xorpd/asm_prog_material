; Example of an infinite loop.
; Demonstrates very simple usage of the jmp instruction.

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    ; Your program begins here:

    mov     eax,1
    call    print_eax
    jmp     skipl

    mov     eax,2
    call    print_eax

skipl:
    mov     eax,3
    call    print_eax

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'
