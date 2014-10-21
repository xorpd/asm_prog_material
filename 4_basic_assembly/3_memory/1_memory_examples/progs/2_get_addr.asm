; Basic Assembly
; ==============
; 
; Memory - Memory examples
; ------------------------
;
; Get Address
; @@@@@@@@@@@
; 
; This program prints the address of keep_nums, and of the start label.
;

format PE console
entry start

include 'win32a.inc' 

AMOUNT_NUMS = 6

; This is the data section:
; ===============================================
section '.data' data readable writeable
  keep_nums  dd AMOUNT_NUMS dup (0)
    
; ===============================================
section '.text' code readable executable

start:
    mov     eax,keep_nums
    call    print_eax

    mov     eax,start
    call    print_eax

    ; Exit the process:
	push	0
	call	[ExitProcess]


include 'training.inc'
