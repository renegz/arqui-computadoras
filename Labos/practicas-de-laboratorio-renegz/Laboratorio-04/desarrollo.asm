org 100h

section .text

main: 
    ;Limpiar registros AX y BX
    XOR AX, AX
    XOR BX, BX
    ;Guardar valores a sumar
    MOV AX, 5d
    MOV BX, 13d

    ;Sumar valores
    CALL addition

    ;Comparar hasta que el resultado sea mayor a 20
    CALL subrutine

    INT 20h

subrutine:
    ;Comparar resultado
    CMP AX, 20d
    ;Si el resultado es mayor a 20 entra a fin
    JA fin
    ;Si el resultado no es mayor a 20
    CALL addfive
    ;Volver a comparar
    JMP subrutine

addition:
    ADD AX, BX
    RET

fin:
    MOV byte[200h], 'F'
    MOV byte[201h], 'I'
    MOV byte[202h], 'N'
    RET

addfive:
    ADD AX, 5d
    RET