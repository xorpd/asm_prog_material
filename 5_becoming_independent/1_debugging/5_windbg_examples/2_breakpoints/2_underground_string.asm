; Becoming independent
; ====================
; 
; Debugging - Windbg Examples - Breakpoints
; -----------------------------------------
; 
; Underground String
; @@@@@@@@@@@@@@@@@@
;
; This program prints a string to the console.
;

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.data' data readable writeable
    follow     db  'Follow me.',13,10,0
    
; ===============================================
section '.text' code readable executable

start:
    mov     esi,follow
    call    print_str

    ; Exit the process:
	push	0
	call	[ExitProcess]


include 'training.inc'
