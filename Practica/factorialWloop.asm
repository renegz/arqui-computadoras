org 100h

section .text

main:
    XOR AX, AX
    XOR BX, BX
    ;Mover el numero que se desea calcular el factorial
    MOV AX, 10d ;Se usaran registros extendidos para trabajar con mas de 16 bits
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
    MUL eCX ;registro extendido
    LOOP factorial ;Retorna automaticamente cuando cx = 1, cx decrementa automaticamente de 1 en 1

zero:
    MOV byte[200h], 1h
    RET

fin:
    ;para enviar 16bits a la memoria
    MOV [200h], eAX ;registro extendido
    RET