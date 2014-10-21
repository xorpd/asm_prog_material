; Basic Assembly
; ==============
; 
; Memory - Memory examples
; ------------------------
;
; Reverse constant
; @@@@@@@@@@@@@@@@
; 
; This program receives AMOUNT_NUMS numbers, and prints them back in reverse
; order. It uses memory to remember the given AMOUNT_NUMS numbers.
;

format PE console
entry start

include 'win32a.inc' 

; This is an assembly time constant:
AMOUNT_NUMS = 6
; Whenever the assembler sees AMOUNT_NUMS, it will replace it with
; the the number 6.


; This is the data section:
; ===============================================
section '.data' data readable writeable
    ; Assembly time constant could be used here too:
    keep_nums     dd AMOUNT_NUMS dup (0)
    

; ===============================================
section '.text' code readable executable

start:

    mov     ecx,AMOUNT_NUMS

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

    mov     edi,AMOUNT_NUMS
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
