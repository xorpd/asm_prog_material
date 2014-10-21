; An example for structured loop and if.

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    ; The program begins here:

    mov     ecx,100h
while_loop:
    mov     eax,ecx
    call    print_eax

    add     ecx,8h

    ; if ecx == 0x130:
    cmp     ecx,130h
    jnz     end_if
    inc     ecx     ; ecx <-- ecx + 1
end_if:

    cmp     ecx,160h
    jb      while_loop

    ; Exit the process:
	push	0
	call	[ExitProcess]


; ==============[read_hex]========================
; Reads hex number from console,
; and returns the resulted number in eax.
read_hex:

    .read_hex_bytes_read = -4
    .read_hex_buffer     = -20

    push    ebp
    mov     ebp,esp

    ; Keep some room for locals:
    sub     esp,16+4

    push    ebx
    push    ecx
    push    edx

    ; Get the Standard input handle:
    push    -10             ; -10 means standard input.
    call    [GetStdHandle]
    mov     ebx,eax

    ; Read bytes from the standard input handle:
    push    0

    lea     ecx, [ebp + .read_hex_bytes_read]
    push    ecx
    push    12   ; Read some bytes.

    lea     ecx, [ebp + .read_hex_buffer]
    push    ecx
    push    ebx
    call    [ReadFile]

    ; Attempt to convert the buffer to a number:
    push    10h     ; Hexadecimal base.
    push    0

    lea     ecx,[ebp + .read_hex_buffer]
    push    ecx
    call    [strtoul]
    add     esp,4*3

    ; Result is inside eax.
    pop     edx
    pop     ecx
    pop     ebx

    add     esp,16+4
    pop     ebp
    ret
    
; ================[print_eax]====================
; Prints eax to console:
print_eax:
    pushad      ; Keep all registers.

; Skip over the data:
    jmp     .print_eax_after_data
    .print_eax_fmt   db          "%x",10,13,0
.print_eax_after_data:

    push    eax     ; The argument.
    push    .print_eax_fmt
    call    [printf]
    add     esp,8
    popad           ; Restore all registers.
    ret

; ====================================
; Imports section:
section '.idata' import data readable
 
library kernel,'kernel32.dll',\
        msvcrt,'msvcrt.dll'
 
import  kernel,\
        ExitProcess,'ExitProcess',\
        GetStdHandle,'GetStdHandle',\
        ReadFile,'ReadFile'

import  msvcrt,\
        printf, 'printf',\
        strtoul, 'strtoul'

