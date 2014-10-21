; Basic Assembly
; ==============
; 
; Memory - Memory examples
; ------------------------
;
; Corrupt
; @@@@@@@
; 
; This program tries to write to a memory location that it does not own.
;

format PE console
entry start

include 'win32a.inc' 

AMOUNT_NUMS = 6


; This is the data section:
; ===============================================
section '.data' data readable writeable
  keep_nums     dd AMOUNT_NUMS dup (0)
    

; ===============================================
section '.text' code readable executable

start:
    mov     esi,keep_nums
    add     esi,10000h
    mov     dword [esi],3 ; Write some dword.


    ; Exit the process:
	push	0
	call	[ExitProcess]


include 'training.inc'
