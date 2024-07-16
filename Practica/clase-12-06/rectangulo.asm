org 100h

section .text

main:
    MOV AH, 00H ;modo grafico
    MOV AL, 12H ;vga 640x480
    INT 10H

    CALL rectangulo


rectangulo:
    MOV DX, 70d ;En la fila 70 (46 hexa)
    MOV CX, 90d ;En la columna 90 (8c hexa)

    CALL fila

    
columna:
    MOV AH, 0CH ;Peticion para escribir un punto
    MOV AL, 04H ;En color rojo
    MOV BH, 0 ;En la pagina 0
    INT 10H

    CMP cx, 190d
    je compare

    INC CX
    JMP columna

fila:
    CALL columna
    

compare:
    CMP dx, 120d
    je fin
    MOV CX, 90d ;En la columna 90 (8c hexa)
    inc DX
    JMP fila

fin:
    INT 20h