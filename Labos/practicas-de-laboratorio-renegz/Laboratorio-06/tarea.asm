org 100h

section .text

setup:
    MOV si, 90d
    MOV DX, 70d ;En la fila 70 (46 hexa)
    MOV CX, 90d ;En la columna 90 (8c hexa)

main:
    CALL IniciarModoGrafico
    CALL triangulo

IniciarModoGrafico:
    MOV AH, 0H
    mov AL, 12h ;640x480 pixeles
    INT 10H 
    RET

triangulo:

    MOV AH, 0CH ;Peticion para escribir un punto
    MOV AL, 04H ;En color rojo
    MOV BH, 0 ;En la pagina 0
    INT 10H

    CMP cx, si
    je compare

    INC CX
    JMP triangulo

compare:
    CMP dx, 120d
    je fin
    MOV CX, 90d ;En la columna 90 (8c hexa)
    inc si
    inc DX
    JMP triangulo

fin:
    INT 20h