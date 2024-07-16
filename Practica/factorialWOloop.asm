org 100h

section .text

main:
    XOR AX, AX
    XOR BX, BX
    ;Mover el numero que se desea calcular el factorial
    MOV AX, 7d
    ;Declarar contador
    MOV CX, AX
    DEC CX
    CALL subrutine


    INT 20h

subrutine:
    ;Compara si el numero es 0
    CMP AX, 1h
    JBE  zero
    CALL factorial
    JMP fin

factorial:
    MUL CX
    DEC CX
    CMP CX, 1h
    JA factorial
    RET

zero:
    MOV byte[200h], 1h
    RET

fin:
    ;para enviar 16bits a la memoria
    MOV word[200h], AX
    RET