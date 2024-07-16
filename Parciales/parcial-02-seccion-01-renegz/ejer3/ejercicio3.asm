org 100h

section .text

main:

    

    MOV AH, 06h ;funcion para mover filas
    MOV AL, 00h ;numero de filas a mover(0)
    MOV BH, 0E6h ;fondo amarillo, primer plano cafe
    MOV CX, 0000h ;desde la posicion 10, 28(coord)
    MOV DX, 184fH   ;hasta la coordenada 14,52 (coord.)

    INT 10h ;llama la rutina de la bios
    

    MOV AH, 09H ;activamos funcion 0E (no imprime en la misma posicion de la pagina)
    MOV AL, 'H' ;queremos repetir letra a
    MOV BH, 00H ;en la primera pagina de pantalla (pagina 0)
    MOV BL, 1EH ;letra blanca y fondo azul
    MOV CX, 03H ;queremos repetir el caracter 3 veces
    INT 10H ;activar la interrumplcion 10 (modo texto de video)

    MOV AH, 09H ;activamos funcion 0E (no imprime en la misma posicion de la pagina)
    MOV AL, 'O' ;queremos repetir letra a
    MOV BH, 00H ;en la primera pagina de pantalla (pagina 0)
    MOV BL, 1EH ;letra blanca y fondo azul
    MOV CX, 03H ;queremos repetir el caracter 3 veces
    INT 10H ;activar la interrumplcion 10 (modo texto de video)

    MOV AH, 09H ;activamos funcion 0E (no imprime en la misma posicion de la pagina)
    MOV AL, 'L' ;queremos repetir letra a
    MOV BH, 00H ;en la primera pagina de pantalla (pagina 0)
    MOV BL, 1EH ;letra blanca y fondo azul
    MOV CX, 03H ;queremos repetir el caracter 3 veces
    INT 10H ;activar la interrumplcion 10 (modo texto de video)

    MOV AH, 09H ;activamos funcion 0E (no imprime en la misma posicion de la pagina)
    MOV AL, 'A' ;queremos repetir letra a
    MOV BH, 00H ;en la primera pagina de pantalla (pagina 0)
    MOV BL, 1EH ;letra blanca y fondo azul
    MOV CX, 03H ;queremos repetir el caracter 3 veces
    INT 10H ;activar la interrumplcion 10 (modo texto de video)

    INT 20h