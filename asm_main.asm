; file: asm_main.asm
;Author: Brandan Coleman
;Date: 12/11/19
;Array with integers and multiplication
%include "asm_io.inc"
;
; initialized data is put in the .data segment
;
segment .data
        arr dd 0,1,2,3,4
        arrsize dd 5
        input db "input a number to multiply: ",0



; uninitialized data is put in the .bss segment
;
segment .bss
        scalar resd 1
;
; code is put in the .text segment
;
segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
; *********** Start  Assignment Code *******************
        mov eax, arr
        push eax
        mov eax, [arrsize]
        push eax
        
        mov eax, input
        call print_string
        call read_int              
        push eax

        call mult_arr
        pop eax
        pop eax
        pop eax

        mov ecx, [arrsize]
        mov edx, 0
printloop: ;; prints valus of array
        mov eax, [arr+edx]
        call print_int
        call print_nl
        add edx, 4
        loop printloop




; *********** End Assignment Code **********************

        popa
        mov     eax, 0      ; return back to the C program
        leave                     
        ret

mult_arr:
        push ebp
        mov ebp, esp
        mov ebx, [ebp+16]
        mov ecx, [ebp+12]
        mov edx, 0
    scalarloop:
            mov eax, [ebx + edx]
            imul eax, [ebp+8] ; multiply array by in scalar quantity and go to next to next element.
            mov [ebx+ edx], eax
            add edx, 4
            loop scalarloop



        pop ebp
        ret



