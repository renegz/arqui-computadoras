org 100h

section .text
    MOV AH, 0EH ;activamos funcion 0E (no imprime en la misma posicion de la pagina)
    MOV AL, 'A' ;queremos repetir letra a
    MOV BH, 00H ;en la primera pagina de pantalla (pagina 0)
    MOV CX, 01H ;queremos repetir el caracter 3 veces
    INT 10H ;activar la interrumplcion 10 (modo texto de video)

    MOV AH, 0EH ;activamos funcion 09
    MOV AL, 'B' ;queremos repetir letra a
    MOV BH, 00H ;en la primera pagina de pantalla (pagina 0)
    MOV CX, 01H ;queremos repetir el caracter 3 veces
    INT 10H ;activar la interrumplcion 10 (modo texto de video)

    MOV AH, 0EH ;activamos funcion 09
    MOV AL, 'C' ;queremos repetir letra a
    MOV BH, 00H ;en la primera pagina de pantalla (pagina 0)
    MOV CX, 01H ;queremos repetir el caracter 3 veces
    INT 10H ;activar la interrumplcion 10 (modo texto de video)

    INT 20h ;interrupcion para terminar el programa