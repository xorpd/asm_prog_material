; Becoming independent
; ====================
; 
; Debugging - Windbg Examples - State
; -----------------------------------
; 
; Deep
; @@@@
;
; This program calls func1, which calls func2, which calls func3, which finally
; calls func4. func4 then prints a string to the console.
;

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.data' data readable writeable
    shello  db  'Hello from the depth of code! ',13,10,0

; ===============================================
section '.text' code readable executable

start:
    call    func1

    ; Exit the process:
	push	0
	call	[ExitProcess]

func1:
    call    func2
    ret

func2:
    call    func3
    ret

func3:
    call    func4
    ret

func4:
    mov     esi,shello
    call    print_str
    ret


include 'training.inc'
