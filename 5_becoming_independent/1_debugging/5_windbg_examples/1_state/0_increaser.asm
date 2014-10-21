; Becoming independent
; ====================
; 
; Debugging - Windbg Examples - State
; -----------------------------------
; 
; Increaser
; @@@@@@@@@
;
; This program adds 1 to every dword from the src_list, and stores the result
; inside the corresponding location in dst_list.
;

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.data' data readable writeable
    src_list    dd  1,5,8,2,0fh,0dh,13h,4,6
    LIST_LEN = ($ - src_list) / 4
    

; ===============================================
section '.bss' readable writeable
    dst_list    dd  LIST_LEN dup (?)

; ===============================================
section '.text' code readable executable

start:
    mov     esi,src_list
    mov     edi,dst_list
    mov     ecx,LIST_LEN

.next_elem:
    lodsd
    inc     eax
    call    print_eax
    stosd
    loop    .next_elem

    ; Exit the process:
	push	0
	call	[ExitProcess]


include 'training.inc'
