org 100h

section .text
    MOV AH, 06h ;funcion para mover filas
    MOV AL, 01h ;numero de filas a mover(1)
    MOV BH, 30h ;fondo cian, primer plano negro
    MOV CX, 00h ;desde la posicion 00,00 (coord)
    MOV DX, 184fh   ;hasta la coordenada 24,79 (coord.)
    INT 10h ;llama la rutina de la bios

    int 20h