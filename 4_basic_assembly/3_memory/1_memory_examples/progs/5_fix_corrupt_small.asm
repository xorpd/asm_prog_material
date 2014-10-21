; Basic Assembly
; ==============
; 
; Memory - Memory examples
; ------------------------
;
; Fix Corrupt Small
; @@@@@@@@@@@@@@@@@
; 
; This program writes to a memory that it owns.
; It defines a very large BSS section. Because it is an uninitialized data
; section, the resulting EXE is not very large, as in the DATA section case.
;

format PE console
entry start

include 'win32a.inc' 

AMOUNT_NUMS = (10000h / 4) + 1


;   ; This is the data section:
;   ; ===============================================
;   section '.data' data readable writeable
;     keep_nums     dd AMOUNT_NUMS dup (0)


; This is the bss (uninitialized) section:
section '.bss' readable writeable ; Better Save Space.
    ; uninitialized data:
    keep_nums       dd  AMOUNT_NUMS dup (?)

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
