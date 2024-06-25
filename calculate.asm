org 0x100               ; Specify this is a .COM program
section .data
    a db 5               ; Define a = 5
    b db 3               ; Define b = 3
    c db 2               ; Define c = 2
    resultMsg db 'Result: $' ; Define the message for result

section .text
_start:                  ; Label should have a colon
    ; Load value of b into al
    mov al, [b]          ; al = b
    sub al, [c]          ; al = al - c (b - c)
    add al, [a]          ; al = al + a (b - c + a)

    ; Convert the result to an ASCII character (for single-digit numbers)
    add al, 30h          ; Convert number to ASCII character

    ; Display the result
    mov ah, 09h          ; DOS function to display a string
    lea dx, resultMsg    ; Load address of resultMsg into DX
    int 21h              ; Call DOS interrupt

    ; Display the number
    mov dl, al           ; Move result to DL for output
    mov ah, 02h          ; DOS function to display a character
    int 21h              ; Call DOS interrupt

    ; Terminate the program
    mov ax, 4c00h        ; DOS function to terminate the program
    int 21h              ; Call DOS interrupt
