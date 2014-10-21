; Becoming independent
; ====================
; 
; Debugging - Windbg Examples - Breakpoints
; -----------------------------------------
; 
; Specials
; @@@@@@@@
;
; This program sums all the "special" numbers from 1 to MAX_SPECIAL.
; A "special" number is determined by the check_special function.
;

format PE console
entry start

include 'win32a.inc' 

MAX_SPECIAL = 0x40000000

; ===============================================
section '.data' data readable writeable
    s_specials  db  'Sum of special numbers: ',0

; ===============================================
section '.text' code readable executable

start:

    mov     esi,s_specials
    call    print_str

    push    MAX_SPECIAL
    call    sum_specials
    add     esp,4

    call    print_eax

    ; Exit the process:
	push	0
	call	[ExitProcess]

; ========================================
; CDECL sum_specials(bound)
; Operation:
;   Sum all the special dword numbers from 1 to bound.
; Input:
;   bound - maximum dword to check.
; Output:
;   eax contains the sum of special dword numbers.
;
sum_specials:
    .bound = 8
    push    ebp
    mov     ebp,esp
    push    edx
    push    ecx

    xor     edx,edx
    mov     ecx,[ebp + .bound]

.check_num:
    push    ecx
    call    check_special
    add     esp,4
    test    eax,eax
    jz      .not_special_num
    ; Here if the number is special:
    add     edx,ecx
.not_special_num:
    loop    .check_num

    mov     eax,edx

    pop     ecx
    pop     edx
    leave
    ret

; =========================================
; CDECL check_special(num)
; Operation: 
;   Checks if a number has the special property.
; Input: 
;   num
; output:
;   eax == 1 if the number is special.
;   eax == 0 if the number is not special.
; 
check_special:
    .num = 8
    push    ebp
    mov     ebp,esp
    push    ecx         ; Keep ecx

    mov     eax,[ebp + .num]
    mov     ecx,eax
    ror     ecx,5
    xor     eax,ecx
    add     eax,0facefaceh
    ror     eax,3
    xor     eax,ecx
    and     eax,3fffffffh

    ; Transform eax to be 0 or 1.
    ; 1 means special number.
    ; 0 means not special.
    neg     eax
    sbb     eax,eax     ; Subtract with borrow.
                        ; eax <- eax - eax - Carry
    inc     eax

    pop     ecx
    leave
    ret
    

include 'training.inc'
