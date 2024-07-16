org 100h

section .text

setup:
    MOV SI, 90d ;columna 90
    MOV DI, 70d ;fila 70

main:

    CALL IniciarModoGrafico
    CALL EncenderPixel

    INT 20H

IniciarModoGrafico:
    MOV AH, 0H
    mov AL, 12h ;640x480 pixeles
    INT 10H 
    RET

EncenderPixel:
    MOV AH, 0CH ;Para dibujar un pixel
    MOV AL, 0100b ;Color rojo (en binario)
    MOV BH, 0h ;Página 0
    MOV CX, SI ;Columna
    MOV DX, DI  ;Fila
    INT 10H

    INC SI ;Incrementar columna
    CMP SI, 190d ;Si la columna no es igual a 190
    JNE EncenderPixel ;Volver a encender pixel hasta que termine de pintar la fila

    MOV SI, 90d ;Reiniciar columna

    INC DI ;Incrementar fila
    CMP DI, 120d ;Si la fila no es igual a 120 salta de fila
    JNE EncenderPixel ;Volver a pintar

    RET