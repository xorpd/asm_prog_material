; Becoming independent
; ====================
; 
; Debugging - First example
; -------------------------
; 
; mem_count
; @@@@@@@@@
; 
; Demonstration for using the debugger.
; This program writes increasing dwords into memory, in a loop.
;

format PE console
entry start

include 'win32a.inc' 

ARR_LEN = 20h

; ===============================================
section '.bss' readable writeable
    my_arr          dd  ARR_LEN dup (?)

; ===============================================
section '.text' code readable executable

start:
    mov     ecx,ARR_LEN
    xor     eax,eax
    mov     edi,my_arr

.next_dw:
    stosd   
    inc     eax
    loop    .next_dw

    ; Exit the process:
	push	0
	call	[ExitProcess]


include 'training.inc'
