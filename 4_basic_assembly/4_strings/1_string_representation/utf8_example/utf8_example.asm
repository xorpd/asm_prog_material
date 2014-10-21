; Basic Assembly
; ==============
; 
; Strings - String representation
; -------------------------------
;
; This program demonstrates usage of the utf-8 encoding.
; 
; - It includes encoding/utf8.inc 
; - It uses the du operator to declare characters.
;
; - You have to make sure that your editor supports the utf-8 encoding.
; 

format PE console
entry start

include 'win32a.inc' 
include 'encoding/utf8.inc'

; ===============================================
section '.data' data readable writeable
    my_str  du '你好',0

; ===============================================
section '.text' code readable executable

start:

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'
