; Becoming independent
; ====================
; 
; Debugging - Windbg Examples - State
; -----------------------------------
; 
; Structured Deep
; @@@@@@@@@@@@@@@
;
; This program calls func1, which calls func2, which calls func3, which finally
; calls func4. func4 then prints a string to the console.
;
; Each of the function build a stack frame.
;

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.data' data readable writeable
    shello  db  'Hello from the depth of structured code! ',13,10,0

; ===============================================
section '.text' code readable executable

start:
    call    func1

    ; Exit the process:
	push	0
	call	[ExitProcess]

func1:
    enter   0,0
    call    func2
    leave
    ret

func2:
    enter   0,0
    call    func3
    leave
    ret

func3:
    enter   0,0
    call    func4
    leave
    ret

func4:
    enter   0,0
    mov     esi,shello
    call    print_str
    leave
    ret


include 'training.inc'
