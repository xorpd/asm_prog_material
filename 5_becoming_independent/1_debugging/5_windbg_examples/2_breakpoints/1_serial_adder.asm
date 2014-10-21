; Becoming independent
; ====================
; 
; Debugging - Windbg Examples - Breakpoints
; -----------------------------------------
; 
; Serial Adder
; @@@@@@@@@@@@
;
; Adds a constant (ADD_CONST) to every dword in my_list.
;

format PE console
entry start

include 'win32a.inc' 

ADD_CONST = 7

; ===============================================
section '.data' data readable writeable
    my_list    dd  1,2,3,4,5,6,7,8,9,0ah,0bh,0ch
    LIST_LEN = ($ - my_list) / 4
    
; ===============================================
section '.text' code readable executable

start:
    mov     edi,my_list
    mov     ecx,LIST_LEN

.next_num:
    mov     eax,dword [edi] ; Read dword
    add     eax,ADD_CONST   ; Add to dword.
    stosd                   ; Store dword.
    loop    .next_num

    ; Exit the process:
	push	0
	call	[ExitProcess]


include 'training.inc'
