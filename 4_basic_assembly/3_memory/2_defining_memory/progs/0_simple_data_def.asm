; Basic Assembly
; ==============
; 
; Memory - Defining memory
; ------------------------
;
; Simple data definition
; @@@@@@@@@@@@@@@@@@@@@@
;
; This assembly file will actually assemble into a bin file. (You won't be able
; to run it, only to look at its contents using a hex editor).
;
; You can see here examples of defining simple data structures:
;

; Define one Byte:
a   db  0abh        ; Data Byte.

; Define a Word (Two bytes):
b   dw  0cc99h      ; Data Word.

; Define a Double word (4 bytes):
c   dd  12345678h

; Define a Quad word (8 bytes):
d   dq  0aabbccdd11223344h
