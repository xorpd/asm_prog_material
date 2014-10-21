; This program has to_heaven entry point.
; This entry point can not be found anywhere in this program.

format PE console
entry to_heaven

include 'win32a.inc' 

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
