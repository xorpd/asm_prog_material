; Becoming independent
; ====================
; 
; Debugging - Windbg Examples - Exceptions
; ----------------------------------------
; 
; Division by Zero
; @@@@@@@@@@@@@@@@
;
; This program divides by zero, to create an exception.
;

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    xor     eax,eax
    div     eax

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'
