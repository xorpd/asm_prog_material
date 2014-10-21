; Becoming independent
; ====================
; 
; Debugging - Windbg Examples - Exceptions
; ----------------------------------------
; 
; int 3
; @@@@@
;
; This program contains a "int 3" instruction to create a debug exception.
;

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    int3        ; 0xcc
    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

; Footnote: If you use "int 3" instead of "int3", you will not get the same
; results. "int 3" is not encoded into 0xcc
