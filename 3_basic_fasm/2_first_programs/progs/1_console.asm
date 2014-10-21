; Example for a very basic fasm program. (Console based).

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    ; Your program begins here:
    inc     eax
    inc     eax
    dec     eax
    inc     eax

    ; Exit the process:
	push	0
	call	[ExitProcess]


; ====================================
; Imports section:
section '.idata' import data readable
 
library kernel,'kernel32.dll'
 
import  kernel,\
        ExitProcess,'ExitProcess'
