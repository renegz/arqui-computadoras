org 100h

section .text

    MOV AH, 06h ;funcion para mover filas
    MOV AL, 00h ;numero de filas a mover(0)
    MOV BH, 0E6h ;fondo amarillo, primer plano cafe
    MOV CX, 0000h ;desde la posicion 10, 28(coord)
    MOV DX, 184fH   ;hasta la coordenada 14,52 (coord.)

    INT 10h ;llama la rutina de la bios
    
    MOV AH, 06h ;funcion para mover filas
    MOV AL, 05h ;numero de filas a mover(0)
    MOV BH, 40h ;fondo amarillo, primer plano cafe
    MOV CX, 0A1Ch ;desde la posicion 10, 28(coord)
    MOV DX, 0E34H   ;hasta la coordenada 14,52 (coord.)

    INT 10h ;llama la rutina de la bios

    int 20h