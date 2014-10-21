; Basic Assembly
; ==============
; 
; Memory - Defining memory
; ------------------------
;
; Multi data definition
; @@@@@@@@@@@@@@@@@@@@@
;
; Assembling this file will not produce an EXE, only a BIN file that could be
; inspected using a hex editor.
;
; Here are some examples regarding defining arrays of data.
;

; 4 consecutive bytes of 0x12:
array_bytes     db 4 dup (12h)

; 5 consecutive words of 0x5678:
array_words     dw 5 dup (5678h)

; 6 consecutive dwords of 0xaabbccdd
array_dwords    dd 6 dup (0aabbccddh)

; 7 consecutive qwords of 0x9999666644448888
array_qwords    dq 7 dup (9999666644448888h)

