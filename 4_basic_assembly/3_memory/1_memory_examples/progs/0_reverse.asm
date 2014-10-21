; Basic Assembly
; ==============
; 
; Memory - Memory examples
; ------------------------
;
; Reverse
; @@@@@@@
; 
; This program receives 5 numbers, and prints them back in reverse order.
; It uses memory to remember the given 5 numbers.
;

format PE console
entry start

include 'win32a.inc' 


; This is the data section:
; ===============================================
section '.data' data readable writeable
    ; 5 dwords:
    keep_nums     dd 5 dup (0)
    
; ===============================================
section '.text' code readable executable

start:

    mov     ecx,5

; First we read all the numbers, and keep them in memory.
read_one_number:
    dec     ecx
    call    read_hex
    mov     esi,ecx
    ; Calculate the address of dword number ecx:
    shl     esi,2 ; multiply by 4. Every dword is 4 bytes!
    add     esi,keep_nums
    ; Store the number inside dword number ecx:
    mov     dword [esi],eax 
    test    ecx,ecx
    jnz     read_one_number

    mov     edi,5
    mov     ecx,0

; Now we print all the numbers, in reverse order:
print_one_number:
    mov     esi,ecx
    ; Calculate the address of dword number ecx:
    shl     esi,2
    add     esi,keep_nums
    ; Read from dword number ecx:
    mov     eax,dword [esi]
    call    print_eax
    inc     ecx
    cmp     ecx,edi
    jnz     print_one_number


    ; Exit the process:
	push	0
	call	[ExitProcess]


include 'training.inc'
