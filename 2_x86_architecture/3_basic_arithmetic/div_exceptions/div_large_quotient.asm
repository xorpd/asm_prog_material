; Example of division resulting in a large quotient.

format PE console
entry start

include 'win32a.inc' 

; ======================================
section '.text' code executable

start:
    
    mov     eax,1234h
    mov     edx,7fffffffh
    mov	    ecx,2
    div	    ecx

    push    0
    call    [ExitProcess]

; ====================================
section '.idata' import data readable
 
library kernel,'kernel32.dll'
 
import  kernel,\
        ExitProcess,'ExitProcess'
