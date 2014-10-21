; Example of division by zero.

format PE console
entry start

include 'win32a.inc' 

; ======================================
section '.text' code readable executable

  start:
	mov     eax,3
	mov     edx,0
	mov     ecx,0
	div     ecx

	push	0
	call	[ExitProcess]

; ====================================
section '.idata' import data readable
 
library kernel,'kernel32.dll'
 
import  kernel,\
        ExitProcess,'ExitProcess'
