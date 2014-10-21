; Basic Assembly
; ==============
; 
; Memory - Memory examples
; ------------------------
;
; Fix Corrupt
; @@@@@@@@@@@
; 
; This time, as opposed to the corrupt program, this program does own the memory
; that it writes. It declares a very large data section.
;

format PE console
entry start

include 'win32a.inc' 

AMOUNT_NUMS = (10000h / 4) + 1


; This is the data section:
; ===============================================
section '.data' data readable writeable
  keep_nums     dd AMOUNT_NUMS dup (0)
    

; ===============================================
section '.text' code readable executable

start:
    mov     esi,keep_nums
    add     esi,10000h
    mov     dword [esi],3   ; Write some dword.


    ; Exit the process:
	push	0
	call	[ExitProcess]


include 'training.inc'
