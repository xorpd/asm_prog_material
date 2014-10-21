; Example of an infinite loop.
; Demonstrates very simple usage of the jmp instruction.

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    ; Your program begins here:

    ; Infinite loop:
    mov     ecx,0
my_label:
    inc     ecx
    jmp     my_label

    ; We will never get here.
    call    print_eax

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'
