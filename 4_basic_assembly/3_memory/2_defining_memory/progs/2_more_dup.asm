; Basic Assembly
; ==============
; 
; Memory - Defining memory
; ------------------------
;
; More dup
; @@@@@@@@
;
; Some examples that demonstrate what could be done using dup.
;

; Repeat the sequence (1,2,3,4,5) of 5 bytes, 4 times.
repeat_byte     db 4 dup (1,2,3,4,5)

; Repeat the sequence of words: (0006h,0007h) 3 times.
repeate_word    dw 3 dup(6,7)

; Repeat the dword 0xabcd1234h 2*3 = 6 times.
repeate_word2    dd 3*2 dup(0abcd1234h)

