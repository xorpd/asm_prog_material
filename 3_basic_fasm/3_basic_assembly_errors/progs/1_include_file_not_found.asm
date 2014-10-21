; This program includes from win32abcd.inc, which is
; a non existent file.

format PE console
entry start

include 'win32abcd.inc' 

; ===============================================
section '.text' code readable executable

start:
    ; Your program begins here:

    call    read_hex    ; Reads eax as hex from console.
    add     eax,eax
    call    print_eax   ; Prints eax as hex back to console.

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'
