; Becoming independent
; ====================
; 
; Debugging - Windbg Examples - Exceptions
; ----------------------------------------
; 
; Access violation
; @@@@@@@@@@@@@@@@
;
; This program attempts to write into address 0, to create an exception.
;

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    xor     eax,eax
    mov     dword [eax],3h  ; Write 3h to location 3h.
                            ; Raises an exception in protected mode.

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'
