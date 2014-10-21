; Basic Assembly
; ==============
; 
; Memory - Defining memory
; ------------------------
;
; Sections
; @@@@@@@@
;
; This assembly file will assemble into an EXE that doesn't do anything.
; However, if observed using a hex editor, you can see that it contains 
; the ".data" and the ".bss" sections.
;
; The .bss section will be of size zero! It doesn't take any space at all inside
; the EXE. It is only loaded when the EXE is being run.
; 


format PE console
entry start

include 'win32a.inc' 

; This is the data section:
; ===============================================
section '.data' data readable writeable
    ; initialized data:
    arr6    dd 6 dup (12345678h)


; This is the bss (uninitialized) section:
; ===============================================
section '.bss' readable writeable ; ("Better Save Space")
    ; uninitialized data:
    num1    dd  ?
    arr8    dd  8 dup (?)

; ===============================================
section '.text' code readable executable

start:

    ; Exit the process:
	push	0
	call	[ExitProcess]


include 'training.inc'
