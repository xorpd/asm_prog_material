; This program multiplies the input by 2.
; To see the "write failed" assembly error, run this program and don't type in
; the input yet. Then while the program is running, try to assemble it from
; another console.

format PE console
entry start

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
