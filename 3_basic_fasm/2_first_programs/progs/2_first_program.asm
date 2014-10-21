; Example for a simple FASM console program.

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    ; Your program begins here:
    call    read_hex    ; Reads eax as hex from console.
    inc     eax         ; Increses eax by 1.
    call    print_eax   ; Prints eax as hex back to console.

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

