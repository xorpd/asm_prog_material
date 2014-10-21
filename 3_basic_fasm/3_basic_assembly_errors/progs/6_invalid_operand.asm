; This program adds 0x14 to the input.

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    ; Your program begins here:

    call    read_hex    ; Reads eax as hex from console.
    add     14h,eax
    call    print_eax   ; Prints eax as hex back to console.

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'
