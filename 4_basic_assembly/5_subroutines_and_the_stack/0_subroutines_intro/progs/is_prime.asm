; Basic Assembly
; ==============
; 
; Subroutines introduction
; ------------------------
;
; is_prime
; @@@@@@@@
;
; This program takes the number n as input, and finds all the prime numbers
; between 2 and n (Including n).
;
; This program demonstrates a very crude way of creating functions and using
; them. It uses only simple jumps: Both for calling to a function, and to return
; from it later.
;
; In this program:
; 
; - The function is_prime checks whether the number given inside eax is prime.
;   If it is, the function returns eax == 1. Otherwise eax == 0 is returned.
;
; - The program calls the is_prime function in a loop, in order to find out all
;   the prime numbers between 2 and n, where n is the input of the program.
;

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.data' data readable writeable
    enter_n         db      'Please enter n: ',0
    primes_found    db      'Primes found until the given n: ',13,10,0

section '.bss' readable writeable
    n           dd  ?

; ===============================================
section '.text' code readable executable

start:
    
    ; Request the value n from the user:
    mov     esi,enter_n
    call    print_str

    call    read_hex
    mov     dword [n],eax

    ; Print to the user: 'Primes found until the given n:'
    mov     esi,primes_found
    call    print_str

    ; Start looking for primes:
    mov     ebx,2

    ; Note that here we can not use ecx as iterator, because the is_prime
    ; function changes ecx

next_number:
    mov     eax,ebx
    ; Invoke the is_prime subroutine:
    jmp     is_prime
after_is_prime:
    test    eax,eax
    jz      not_prime
    ; We got a prime number:
    mov     eax,ebx
    call    print_eax
not_prime:
    inc     ebx
    cmp     ebx, dword [n]
    jbe     next_number

    
    ; Exit the process:
	push	0
	call	[ExitProcess]


; The is_prime function.
; input: number to check in eax.
; output: eax = 1 if the number was prime. eax = 0 otherwise.
is_prime:
    mov     esi,eax
    mov     ecx,1
    xor     edi,edi
    inc     edi
check_divisor:
    inc     ecx
    cmp     ecx,esi
    jae     end_divisors_loop
    mov     eax,esi
    cdq
    div     ecx
    test    edx,edx
    jnz     not_divisor
    ; A proper divisor was found.
    ; The number is not prime.
    xor     edi,edi
not_divisor:
    jmp     check_divisor
end_divisors_loop:

    mov     eax,edi
    jmp     after_is_prime

include 'training.inc'
