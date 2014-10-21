; Becoming independent
; ====================
; 
; Debugging - Windbg Examples - basic control
; -------------------------------------------
; 
; Infinite Counter
; @@@@@@@@@@@@@@@@
;
; This program iterates inside an infinite loop.
; It will never end.
;

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    ; Initialize eax:
    xor     eax,eax
    inc     eax

    ; Infinite loop:
.iter:
    mov     ecx,eax
    shr     ecx,1
    and     eax,1
    neg     eax
    and     eax,0D0000001h
    xor     eax,ecx
    jmp     .iter

    ; Exit the process:
	push	0
	call	[ExitProcess]


include 'training.inc'
